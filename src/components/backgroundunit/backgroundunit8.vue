<template>
  <canvas ref="canvascontext" :width="w" :height="h" :id="controlid"></canvas>
</template>
<script>
export default {
  props: ['w', 'h'],
  data () {
    return {
      controlid: '',
      ctx: undefined,
      canvas: null,
      squids: new Array(32),
      bubbles: new Array(54),
      t: 0,
      timeIndex: [],
    }
  },
  methods: {
    init () {
      this.t = 0;
      //create squids
      for (let i = 0; i < this.squids.length; i++) {
        var s = 20, e = 160;
        this.squids[i] = {
          re: s + (Math.random() * e),
          g: s + (Math.random() * e),
          b: s + (Math.random() * e),
          x: Math.random() * innerWidth,
          y: Math.random() * innerHeight,
          vx: (0.5 - Math.random()) / 4,
          vy: 0.1 - Math.random(),
          r: 10 + (Math.random() * 40),
          a: []
        };
      }
      //create bubbles
      for (let i = 0; i < this.bubbles.length; i++) {
        this.bubbles[i] = {
          x: Math.random() * innerWidth,
          y: Math.random() * innerHeight,
          vx: 0.5 - Math.random(),
          vy: -0.2 - Math.random(),
          o: 0.05 + Math.random() * 0.1,
          r: 3 + Math.random() * 20
        };
      }
    },
    limit (d) {
      if (d.x < -d.r) d.x = innerWidth + d.r;
      if (d.x > innerWidth + d.r) d.x = -d.r;
      if (d.y < -d.r) d.y = innerHeight + d.r;
      if (d.y > innerHeight + d.r) d.y = -d.r;
    },
    animate () {
      this.t++;
      this.canvas.width = this.w;
      this.canvas.height = this.h;
      this.bubbles.forEach(b => {
        b.x += b.vx;
        b.y += b.vy;
        this.limit(b);
        this.ctx.fillStyle = 'rgba(255,255,255,' + b.o + ')';
        this.ctx.beginPath();
        this.ctx.arc(b.x, b.y, b.r, Math.PI * 2, 0);
        this.ctx.fill();
      });
      this.squids.forEach(d => {
        var w = Math.sin((this.t + (d.r * 100)) / 10);
        d.x += d.vx * 4;
        d.y -= w + 1;
        d.y += d.vy;
        this.limit(d);
        var color1 = 'rgba(' + d.re + ',' + d.g + ',' + d.b + ',0.4)';
        var color2 = 'rgba(' + d.re + ',' + d.g + ',' + d.b + ',0.2)';
        this.ctx.fillStyle = color1;
        this.ctx.beginPath();
        this.ctx.arc(d.x, d.y, d.r, Math.PI + (-0.5 + d.vx) - (w / 4), (0.5 + d.vx) + (w / 4));
        this.ctx.fill();
        d.a.push({ x: d.x, y: d.y - (d.r * 0.2) });
        if (d.a.length > d.r * 3) d.a.splice(0, 1);
        d.a.forEach((p, i) => {
          this.ctx.fillStyle = color2;
          this.ctx.fillRect(p.x, p.y, 2, 2);
          if (i > d.a.length / 2) {
            this.ctx.fillRect(p.x - (d.r / 4), p.y, 2, 2);
            this.ctx.fillRect(p.x + (d.r / 4), p.y, 2, 2);
          }
          if (i > d.a.length / 3) {
            this.ctx.fillRect(p.x + (d.r / 10), p.y - 10, 2, 2);
            this.ctx.fillRect(p.x - (d.r / 10), p.y - 10, 2, 2);
          }
        });
      });
      this.timeIndex.push(requestAnimationFrame(this.animate));
    }
  },
  created () {
    this.controlid =
      'div' + Date.parse(new Date()) + '_' + Math.ceil(Math.random() * 99999)
    this.$nextTick(() => {
      this.canvas = document.getElementById(this.controlid);
      this.ctx = this.canvas.getContext("2d")
      this.init();
      this.animate();
    })
  },
  beforeDestroy () {
    this.timeIndex.forEach(ee => {
      window.cancelAnimationFrame(ee);
    })
    this.timeIndex = []
  }
}
</script>