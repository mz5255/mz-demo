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
      BACKGROUND_COLOR: "rgba(0,43,54,1)",   // 背景颜色
      POINT_NUM: 100,                       // 星星数目
      POINT_COLOR: "rgba(255,255,255,0.7)",  // 点的颜色
      LINE_LENGTH: 10000,
      startTime: new Date().getTime(),
      points: [],
      p0: null, //鼠标
      timeIndex: []

    }
  },
  methods: {
    initPoints () {
      this.p0 = this.Point();
      this.p0.dx = this.p0.dy = 0;
      for (var i = 0; i < this.POINT_NUM; ++i) {
        this.points.push(this.Point());
      }
    },
    //随机数函数
    randomInt (min, max) {
      return Math.floor((max - min + 1) * Math.random() + min);
    },
    randomFloat (min, max) {
      return (max - min) * Math.random() + min;
    },
    drawLine (p1, p2, deg) {
      var dx = p1.x - p2.x;
      var dy = p1.y - p2.y;
      var dis2 = dx * dx + dy * dy;
      if (dis2 < 2 * this.LINE_LENGTH) {
        if (dis2 > this.LINE_LENGTH) {
          if (p1 === this.p0) {
            p2.x += dx * 0.03;
            p2.y += dy * 0.03;
          } else return;
        }
        var t = (1.05 - dis2 / this.LINE_LENGTH) * 0.2 * deg;
        this.ctx.strokeStyle = "rgba(255,255,255," + t + ")";
        this.ctx.beginPath();
        this.ctx.lineWidth = 1.5;
        this.ctx.moveTo(p1.x, p1.y);
        this.ctx.lineTo(p2.x, p2.y);
        this.ctx.closePath();
        this.ctx.stroke();
      }
      return;
    },
    Point () {
      let $this = this;
      let speed = $this.randomFloat(0.3, 1.4);
      let angle = $this.randomFloat(0, 2 * Math.PI);
      return {
        cvs: $this.canvas,
        ctx: $this.ctx,
        x: $this.randomFloat(0, $this.canvas.width),
        y: $this.randomFloat(0, $this.canvas.height),
        dx: Math.sin(angle) * speed,
        dy: Math.cos(angle) * speed,
        r: 1.2,
        color: $this.POINT_COLOR,
        move () {
          this.x += this.dx;
          if (this.x < 0) {
            this.x = 0;
            this.dx = -this.dx;
          } else if (this.x > this.cvs.width) {
            this.x = this.cvs.width;
            this.dx = -this.dx;
          }
          this.y += this.dy;
          if (this.y < 0) {
            this.y = 0;
            this.dy = -this.dy;
          } else if (this.y > this.cvs.height) {
            this.y = this.cvs.height;
            this.dy = -this.dy;
          }
        },
        draw () {
          debugger;
          this.ctx.fillStyle = this.color;
          this.ctx.beginPath();
          this.ctx.arc(this.x, this.y, this.r, 0, Math.PI * 2);
          this.ctx.closePath();
          this.ctx.fill();
        }
      }
    },
    drawFrame () {
      this.canvas.width = this.w;
      this.canvas.height = this.h;
      this.ctx.fillStyle = this.BACKGROUND_COLOR;
      this.ctx.fillRect(0, 0, this.canvas.width, this.canvas.height);
      var arr = (this.p0.x == null ? this.points : [this.p0].concat(this.points));
      for (var i = 0; i < arr.length; ++i) {
        for (var j = i + 1; j < arr.length; ++j) {
          this.drawLine(arr[i], arr[j], 1.0);
        }
        arr[i].draw();
        arr[i].move();
      }
      this.timeIndex.push(window.requestAnimationFrame(this.drawFrame));
    }
  },
  beforeDestroy () {
    this.timeIndex.forEach(ee => {
      window.cancelAnimationFrame(ee);
    })
    this.timeIndex = []
  },
  created () {
    this.controlid =
      'div' + Date.parse(new Date()) + '_' + Math.ceil(Math.random() * 99999)
    this.$nextTick(() => {
      this.canvas = document.getElementById(this.controlid);
      this.ctx = this.canvas.getContext("2d")
      this.initPoints()
      this.drawFrame()
    })
  }

}
</script>