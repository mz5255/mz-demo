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
      colors: ["255, 255, 255", "255, 99, 71", "19, 19, 19"],
      blurry: true,
      border: false,
      minRadius: 10,
      maxRadius: 35,
      minOpacity: 0.005,
      maxOpacity: 0.5,
      minSpeed: 0.05,
      maxSpeed: 0.5,
      fps: 60,
      numParticles: 75,
      timer: null
    }
  },
  methods: {
    init () {
      this.render();
      this.createCircle()
    },
    _rand (b, a) {
      return Math.random() * (a - b) + b
    },
    render () {
      this.canvas.width = this.w;
      this.canvas.height = this.h;
    },
    createCircle () {
      var c = [];
      for (var b = 0; b < this.numParticles; b++) {
        var d = this,
          a = d.colors[~~(d._rand(0, d.colors.length))];
        c[b] = {
          radius: d._rand(d.minRadius, d.maxRadius),
          xPos: d._rand(0, this.canvas.width),
          yPos: d._rand(0, this.canvas.height),
          xVelocity: d._rand(d.minSpeed, d.maxSpeed),
          yVelocity: d._rand(d.minSpeed, d.maxSpeed),
          color: "rgba(" + a + "," + d._rand(d.minOpacity, d.maxOpacity) + ")"
        };
        d.draw(c, b)
      }
      d.animate(c)
    },
    draw (d, c) {
      var e = this,
        a = e.ctx;
      if (e.blurry === true) {
        var b = a.createRadialGradient(d[c].xPos, d[c].yPos, d[c].radius, d[c].xPos, d[c].yPos, d[c].radius / 1.25);
        b.addColorStop(1, d[c].color);
        b.addColorStop(0, "rgba(34, 34, 34, 0)");
        a.fillStyle = b
      } else {
        a.fillStyle = d[c].color
      }
      if (e.border === true) {
        a.strokeStyle = "#fff";
        a.stroke()
      }
      a.beginPath();
      a.arc(d[c].xPos, d[c].yPos, d[c].radius, 0, 2 * Math.PI, false);
      a.fill()
    },
    animate (b) {
      let c = this;
      this.timer = setInterval(function () {
        c.clearCanvas();
        for (var d = 0; d < c.numParticles; d++) {
          b[d].xPos += b[d].xVelocity;
          b[d].yPos -= b[d].yVelocity;
          if (b[d].xPos > c.canvas.width + b[d].radius || b[d].yPos > c.canvas.height + b[d].radius) {
            c.resetParticle(b, d)
          } else {
            c.draw(b, d)
          }
        }
      },
        1000 / c.fps)
    },
    resetParticle (b, a) {
      var d = this;
      var c = d._rand(0, 1);
      if (c > 0.5) {
        b[a].xPos = -b[a].radius;
        b[a].yPos = d._rand(0, this.canvas.height)
      } else {
        b[a].xPos = d._rand(0, this.canvas.width);
        b[a].yPos = this.canvas.height + b[a].radius
      }
      d.draw(b, a)
    },
    clearCanvas () {
      this.ctx.clearRect(0, 0, this.canvas.width, this.canvas.height)
    }
  },
  created () {
    this.controlid =
      'div' + Date.parse(new Date()) + '_' + Math.ceil(Math.random() * 99999)
    this.$nextTick(() => {
      this.canvas = document.getElementById(this.controlid);
      this.ctx = this.canvas.getContext("2d")
      this.init()
    })
  }, beforeDestroy () {
    clearTimeout(this.timer)
    this.timer = null
  }
}
</script>