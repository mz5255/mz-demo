<template>
  <canvas ref="canvascontext" :width="w" :height="h" :id="controlid"></canvas>
</template>
<script>
class Vector3 {
  constructor(x, y, z, controlid) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.controlid = controlid;
    this.color = "#0D0";
    this.maxAmplitude = 1500;
    // this.rotXCounter = 0;
    // this.rotYCounter = 0;
    // this.rotZCounter = 0;
    this.fov = 100;
    this.dist = 100;

    this.particleSize = 2;
  }
  rotateX (angle) {
    const z = this.z * Math.cos(angle) - this.x * Math.sin(angle);
    const x = this.z * Math.sin(angle) + this.x * Math.cos(angle);
    return new Vector3(x, this.y, z, this.controlid);
  }

  rotateY (angle) {
    const y = this.y * Math.cos(angle) - this.z * Math.sin(angle);
    const z = this.y * Math.sin(angle) + this.z * Math.cos(angle);
    return new Vector3(this.x, y, z, this.controlid);
  }
  rotateZ (angle) {
    const x = this.x * Math.cos(angle) - this.y * Math.sin(angle);
    const y = this.x * Math.sin(angle) + this.y * Math.cos(angle);
    return new Vector3(x, y, this.z, this.controlid);
  }

  perspectiveProjection (fov, viewDistance) {
    let canvas = document.getElementById(this.controlid)
    const factor = fov / (viewDistance + this.z);
    const x = this.x * factor + canvas.width / 2;
    const y = this.y * factor + canvas.height / 2;
    return new Vector3(x, y, this.z, this.controlid);
  }
  draw () {
    const ctx = document.getElementById(this.controlid).getContext("2d");
    const frac = this.y / this.maxAmplitude;
    const r = Math.floor(frac * 100);
    const g = 20;
    const b = Math.floor(255 - frac * 100);
    const vec = this.rotateX(window.canvasparam[this.controlid].rotXCounter).rotateY(window.canvasparam[this.controlid].rotYCounter).rotateZ(window.canvasparam[this.controlid].rotZCounter).perspectiveProjection(this.fov, this.dist);

    this.color = `rgb(${r}, ${g}, ${b})`;
    ctx.fillStyle = this.color;
    ctx.fillRect(vec.x, vec.y, this.particleSize, this.particleSize);
  }
}
export default {
  props: ['w', 'h'],
  data () {
    return {
      canvas: null, points: [], timeIndex: [], controlid: '', sideLength: 50,
      spacing: 200,
      opacity: 0.2, maxAmplitude: 1500,
    }
  },
  methods: {
    refreshSize () {
      this.canvas.width = this.w;
      this.canvas.height = this.h;
    },
    init () {
      // Init
      for (let z = 0; z < this.sideLength; z++) {
        for (let x = 0; x < this.sideLength; x++) {
          const xStart = -(this.sideLength * this.spacing) / 2;
          this.points.push(
            new Vector3(xStart + x * this.spacing, 0, xStart + z * this.spacing, this.controlid));

        }
      }
    },
    loop () {
      const ctx = document.getElementById(this.controlid).getContext("2d");
      ctx.fillStyle = `rgba(0, 0, 0, ${this.opacity})`;
      ctx.fillRect(0, 0, this.canvas.width, this.canvas.height);

      for (let i = 0, max = this.points.length; i < max; i++) {
        const x = i % this.sideLength;
        const z = Math.floor(i / this.sideLength);
        const xFinal = Math.sin(x / this.sideLength * 4 * Math.PI + window.canvasparam[this.controlid].counter);
        const zFinal = Math.cos(z / this.sideLength * 4 * Math.PI + window.canvasparam[this.controlid].counter);
        const gap = this.maxAmplitude * 0.3;
        const amp = this.maxAmplitude - gap;

        this.points[z * this.sideLength + x].y = this.maxAmplitude + xFinal * zFinal * amp;

        this.points[i].draw();
      }
      window.canvasparam[this.controlid].counter += 0.03;

      window.canvasparam[this.controlid].rotXCounter += 0.005;
      window.canvasparam[this.controlid].rotYCounter += 0.005;
      //rotZCounter += 0.005;

      this.timeIndex.push(window.requestAnimationFrame(this.loop));
    }
  },
  created () {
    if (window.canvasparam === undefined) {
      window.canvasparam = {}
    }
    this.controlid =
      'div' + Date.parse(new Date()) + '_' + Math.ceil(Math.random() * 99999)
    window.canvasparam[this.controlid] = {
      counter: 0,
      rotXCounter: 0,
      rotYCounter: 0,
      rotZCounter: 0
    }
    this.$nextTick(() => {
      this.canvas = document.getElementById(this.controlid);
      // this.canvas.style.background = "linear-gradient( to bottom, #002172, #479CD5)";
      this.refreshSize();
      this.init();
      this.timeIndex = []
      this.loop();
    })
  },
  // 销毁前取消动画
  beforeDestroy () {
    this.timeIndex.forEach(ee => {
      window.cancelAnimationFrame(ee);
    })
    this.timeIndex = []
    delete window.canvasparam[this.controlid]
  },
}


</script>

