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
      drops: [],
    }
  },
  methods: {
    random(min, max) {
      return Math.random() * (max - min) + min //min - max之间的随机数
    },
    raindrop() {
      let $this = this
      return {
        cxt: $this.ctx,
        w: $this.w,
        h: $this.h,
        init: function() {
          //初始化方法 设置每个雨滴的初始化属性
          //设置坐标
          this.x = $this.random(0, this.w)
          this.y = 0
          //y方向的速度值
          this.vy = $this.random(4, 5)
          //雨滴下落的最大高度
          this.l = $this.random(0.8 * this.h, 0.9 * this.h)
          //波纹的初始半径
          this.r = 1
          this.vr = 1 //半径增大的速度
          //判断雨滴消失的透明度
          this.a = 1 // =>0
          this.va = 0.96 //透明度的变化系数
        },
        draw: function() {
          //绘制图形
          if (this.y > this.l) {
            //雨滴下落到了指定位置 开始绘制圆形
            this.cxt.beginPath() //先开始路径
            this.cxt.arc(this.x, this.y, this.r, 0, Math.PI * 2, false)
            this.cxt.strokeStyle = 'rgba(0,255,255,' + this.a + ')'
            this.cxt.stroke()
          } else {
            //绘制下落的雨滴
            this.cxt.fillStyle = 'rgb(0,255,255)'
            this.cxt.fillRect(this.x, this.y, 2, 10)
          }

          this.update()
        },
        update: function() {
          //更新坐标位置
          if (this.y < this.l) {
            this.y += this.vy
          } else {
            //雨滴下落到了指定位置 开始绘制波纹
            if (this.a > 0.03) {
              this.r += this.vr
              if (this.r > 50) {
                this.a *= this.va
              }
            } else {
              //重新初始化
              this.init()
            }
          }
        },
      }
    },
    init() {
      for (var i = 0; i < 30; i++) {
        setTimeout(() => {
          var drop = this.raindrop()
          drop.init()
          this.drops.push(drop)
        }, i * 300)
      }
    },
    move() {
      //cxt.clearRect(0,0,w,h);
      //先复制透明层再绘制雨滴 雨滴就把先绘制的透明层覆盖 下一次绘制透明层
      //就会把之前绘制的雨滴覆盖 若干的透明层叠加就会越来越不透明
      this.ctx.fillStyle = 'rgba(0,0,0,0.1)'
      this.ctx.fillRect(0, 0, this.w, this.h)
      for (var k = 0; k < this.drops.length; k++) {
        this.drops[k].draw()
      }
      requestAnimationFrame(this.move)
    },
  },
  created() {
    this.controlid =
      'div' + Date.parse(new Date()) + '_' + Math.ceil(Math.random() * 99999)
    this.$nextTick(() => {
      this.canvas = document.getElementById(this.controlid)
      this.ctx = this.canvas.getContext('2d')
      this.init()
      this.move()
    })
  },
}
</script>
