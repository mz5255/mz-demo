<template>

  <canvas ref="canvascontext" :width="w" :height="h" :id="controlid"></canvas>

</template>
<script>
class Flower {
  constructor(x, y, radius, controlid) {
    this.x = x;
    this.y = y;
    this.radius = radius;
    this.dx = 0.8 + Math.random() * 0.2;
    this.fdx = Math.pow(this.dx, 15);
    this.radians = 0;
    this.controlid = controlid
    this.randomInt = (min, max) => Math.floor(Math.random() * (max - min) + min);

  }
  draw () {
    let c = document.getElementById(this.controlid).getContext("2d")
    let long = this.radius * 20;
    let cutLong = long / 10;
    if (c !== undefined) {
      c.beginPath();
      c.strokeStyle = "#fff";
      c.arc(this.x, this.y, this.radius, 0, Math.PI * 2, true);
      c.moveTo(this.x, this.y + this.radius);
      c.lineTo(this.x, this.y + long);
      c.stroke();
      c.beginPath();
      c.save();
      c.strokeStyle = "#725527";
      c.lineWidth = cutLong;
      c.lineCap = "round";
      c.moveTo(this.x, this.y + long - cutLong);
      c.lineTo(this.x, this.y + long + cutLong);
      c.stroke();
      c.restore();
      c.beginPath();
      c.save();
      c.globalAlpha = 0.5;
      for (let i = 0.5; i < 5; i++) {
        c.moveTo(this.x, this.y);
        c.quadraticCurveTo(
          this.x + cutLong,
          this.y + cutLong,
          this.x + cutLong * i,
          this.y - cutLong * 1.5
        );
        c.moveTo(this.x, this.y);
        c.quadraticCurveTo(
          this.x - cutLong,
          this.y + cutLong,
          this.x - cutLong * i,
          this.y - cutLong * 1.5
        );
      }
      c.lineWidth = 1;
      c.stroke();
      c.restore();
    }
  }
  createFlower (array = []) {
    let fh = document.getElementById(this.controlid).height
    let i = array.indexOf(this);
    array.splice(i, 1);
    let x = 0;
    let y = this.randomInt(-10, fh * 1.5);
    array.push(new Flower(x, y, this.radius));
  }
  update (array = []) {
    let fw = document.getElementById(this.controlid).width
    if (this.x - this.radius > fw) this.createFlower(array);
    this.radians += 0.01;
    this.x += this.dx;
    this.y += Math.cos(this.radians) - this.fdx;
    this.draw();
  }
}
export default {
  props: ['w', 'h'],
  data () {
    return { canvas: null, flowers: [], randomInt: (min, max) => Math.floor(Math.random() * (max - min) + min), c: null, timeIndex: [], controlid: '' }
  },
  created () {
    this.controlid =
      'div' + Date.parse(new Date()) + '_' + Math.ceil(Math.random() * 99999)
    this.$nextTick(() => {
      this.canvas = document.getElementById(this.controlid);
      // this.canvas.style.background = "linear-gradient( to bottom, #002172, #479CD5)";
      this.refreshSize();
      this.init();
      this.timeIndex = []
      this.loop();
    })

  }, methods: {
    refreshSize () {
      this.canvas.width = this.w;
      this.canvas.height = this.h;
    },
    loop () {
      this.timeIndex.push(window.requestAnimationFrame(this.loop));
      this.refreshSize();
      this.flowers.forEach((f) => f.update(this.flowers));
    },
    init () {
      for (let i = 0; i < 100; i++) {
        let x = Math.random() * this.w;
        let y = this.randomInt(-10, this.h * 1.5);
        this.flowers.push(new Flower(x, y, 1, this.controlid));
      }
    }
  },
  watch: {
    w () {
      this.refreshSize()
    },
    h () {
      this.refreshSize()
    }
  },
  // 销毁前取消动画
  beforeDestroy () {
    this.timeIndex.forEach(ee => {
      window.cancelAnimationFrame(ee);
    })
    this.timeIndex = []
  },
}
</script>
