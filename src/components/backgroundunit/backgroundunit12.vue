<template>
  <canvas ref="canvascontext" :width="w" :height="h" :id="controlid"></canvas>
</template>
<script>
export default {
  props: ['w', 'h'],
  data() {
    return {
      controlid: '',
      ctx: undefined,
      canvas: null,
      timeIndex: [],
      topiary: null,
      w2: 0,
      h2: 0,
      uu: 0,
      cnt: 0,
    }
  },
  beforeDestroy() {
    this.timeIndex.forEach((ee) => {
      window.cancelAnimationFrame(ee)
    })
    this.timeIndex = []
  },
  methods: {
    init() {
      this.w2 = this.w * 0.5
      this.h2 = this.h * 0.5
      this.topiary = this.branch(80, 0, 0)
      this.topiary.init()
    },
    rnd(min, max) {
      return Math.random() * (max - min) + min
    },
    draw() {
      this.ctx.save()
      this.ctx.clearRect(0, 0, this.w, this.h)
      this.ctx.translate(this.w2, this.h * 0.98)
      this.ctx.rotate(-Math.PI * 0.5)
      this.topiary.disp(this.ctx)
      this.ctx.restore()
    },
    branch(len, ang, gen) {
      let $this = this
      return {
        len: len,
        ang: ang,
        gen: gen,
        limb: [],
        sway: 0,
        mult: $this.rnd(0.01, 0.1),
        spawn: 0,
        vel: 0,
        uu: $this.uu,
        ctx: $this.ctx,
        init() {
          if (gen < 10) {
            let item1 = $this.branch(
              len * $this.rnd(0.8, 0.99),
              $this.rnd(0, Math.PI / 6),
              this.gen + 1
            )
            item1.init()
            this.limb.push(item1)
            let item2 = $this.branch(
              len * $this.rnd(0.8, 0.99),
              $this.rnd(0, -Math.PI / 6),
              this.gen + 1
            )
            item2.init()
            this.limb.push(item2)
          }
        },
        disp() {
          this.sway++
          this.ctx.save()
          this.vel *= 0.9
          var dif = 1 - this.spawn
          this.vel += dif * 0.1
          this.spawn += this.vel

          this.ctx.strokeStyle = 'hsla(' + ($this.uu % 360) + ',100%,50%,1)'
          this.ctx.lineWidth = 1
          this.ctx.beginPath()
          this.ctx.rotate(
            this.ang + (Math.sin(this.sway * this.mult) * Math.PI) / 128
          )
          this.ctx.moveTo(0, 0)
          this.ctx.lineTo(this.len * this.spawn, 0)
          this.ctx.stroke()

          this.ctx.translate(this.len * this.spawn, 0)

          if (this.spawn > 0.6) {
            for (var i = 0; i < this.limb.length; i++) {
              var limb = this.limb[i]
              limb.disp(this.ctx)
            }
          }
          this.ctx.restore()
        },
      }
    },
    anim() {
      this.cnt++
      this.uu -= 0.5
      if (this.cnt % 2) {
        this.draw()
      }
      this.timeIndex.push(window.requestAnimationFrame(this.anim))
    },
  },
  created() {
    this.controlid =
      'div' + Date.parse(new Date()) + '_' + Math.ceil(Math.random() * 99999)
    this.$nextTick(() => {
      this.canvas = document.getElementById(this.controlid)
      this.ctx = this.canvas.getContext('2d')
      this.init()
      this.anim()
    })
  },
}
</script>
