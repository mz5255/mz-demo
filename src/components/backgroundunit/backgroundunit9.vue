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
      pixels: [],
      timeIndex: []
    }
  },
  methods: {
    init() {
      for (var x = -400; x < 400; x += 5) {
        for (var z = -250; z < 250; z += 5) {
          this.pixels.push({ x: x, y: 100, z: z });
        }
      }
    },
    render(ts) {
      var imageData = this.ctx.getImageData(0, 0, this.w, this.h),
        len = this.pixels.length,
        fov = 250,
        pixel, scale,
        x2d, y2d, c;

      for (var i = 0; i < len; i++) {
        pixel = this.pixels[i];
        scale = fov / (fov + pixel.z);
        x2d = pixel.x * scale + this.w / 2;
        y2d = pixel.y * scale + this.h / 2;
        if (x2d >= 0 && x2d <= this.w && y2d >= 0 && y2d <= this.h) {
          c = (Math.round(y2d) * imageData.width + Math.round(x2d)) * 4;
          imageData.data[c] = 17;
          imageData.data[c + 1] = 122;
          imageData.data[c + 2] = 181;
          imageData.data[c + 3] = 255;
        }
        pixel.z -= 0.4;
        pixel.y = this.h / 14 + Math.sin(i / len * 15 + (ts / 450)) * 10;
        if (pixel.z < -fov) pixel.z += 2 * fov;
      }
      this.ctx.putImageData(imageData, 0, 0);
    },
    drawFrame(ts) {
      this.timeIndex.push(requestAnimationFrame(this.drawFrame, this.canvas));
      this.ctx.fillStyle = '#17293a';
      this.ctx.fillRect(0, 0, this.w, this.h);
      this.render(ts);
    }

  },
  created() {
    this.controlid =
      'div' + Date.parse(new Date()) + '_' + Math.ceil(Math.random() * 99999)
    this.$nextTick(() => {
      this.canvas = document.getElementById(this.controlid);
      this.ctx = this.canvas.getContext("2d")
      this.init();
      this.drawFrame()
    })
  },
  beforeDestroy() {
    this.timeIndex.forEach(ee => {
      window.cancelAnimationFrame(ee);
    })
    this.timeIndex = []
  },
}
</script>