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
      timeIndex: [],
      RESOLUTION: 1,
      PARTICLE_COUNT: 400,
      CONNECT_DISTANCE: 0,
      FORCE_DISTANCE: 0,
      PI: Math.PI,
      time: new Date(),
      particles: []
    }
  },
  created () {
    this.controlid =
      'div' + Date.parse(new Date()) + '_' + Math.ceil(Math.random() * 99999)
    this.$nextTick(() => {
      this.canvas = document.getElementById(this.controlid);
      this.ctx = this.canvas.getContext("2d")
      this.refreshSize();
      this.particles = new Array(this.PARTICLE_COUNT).
        fill({}).
        map(this.particlePrototype);
      this.loop()
    })
  },
  methods: {
    r (n = 1) { return Math.random() * n; },
    refreshSize () {
      this.canvas.width = this.w;
      this.canvas.height = this.h;
      this.CONNECT_DISTANCE = this.w * 0.05
      this.CONNECT_DISTANCE = this.w * 0.05
      this.TAU = this.PI * 2;
    },
    lerp (start, end, amt) {
      return (1 - amt) * start + amt * end;
    },
    distance (x1, y1, x2, y2) {
      const a = x1 - x2;
      const b = y1 - y2;
      return Math.sqrt(a * a + b * b);
    },
    angle (cx, cy, ex, ey) {
      return Math.atan2(ey - cy, ex - cx);
    },
    particlePrototype () {
      return {
        x: this.w * 0.5 + Math.cos(this.r(this.TAU)) * this.r(this.w * 0.5),
        y: this.h * 0.5 + Math.sin(this.r(this.TAU)) * this.r(this.h * 0.5),
        angle: this.r(this.TAU),
        speed: this.r(0.15),
        normalSpeed: this.r(0.15),
        oscAmplitudeX: this.r(2),
        oscSpeedX: 0.001 + this.r(0.008),
        oscAmplitudeY: this.r(2),
        oscSpeedY: 0.001 + this.r(0.008),
        connectDistance: this.r(this.CONNECT_DISTANCE),
        color: {
          r: Math.round(200 + this.r(55)),
          g: Math.round(150 + this.r(105)),
          b: Math.round(200 + this.r(55))
        }
      }
    },
    update () {
      this.particles.forEach(p1 => {
        p1.x += (Math.cos(p1.angle) + Math.cos(this.time * p1.oscSpeedX) * p1.oscAmplitudeX) * p1.speed;
        p1.y += (Math.sin(p1.angle) + Math.cos(this.time * p1.oscSpeedY) * p1.oscAmplitudeY) * p1.speed;

        p1.speed = this.lerp(p1.speed, p1.normalSpeed * this.RESOLUTION, 0.1);

        if (p1.x > this.w || p1.x < 0) {
          p1.angle = this.PI - p1.angle;
        }
        if (p1.y > this.h || p1.y < 0) {
          p1.angle = -p1.angle;
        }

        if (this.r() < 0.005)
          p1.oscAmplitudeX = this.r(2);
        if (this.r() < 0.005)
          p1.oscSpeedX = 0.001 + this.r(0.008);
        if (this.r() < 0.005)
          p1.oscAmplitudeY = this.r(2);
        if (this.r() < 0.005)
          p1.oscSpeedY = 0.001 + this.r(0.008);

        p1.x = Math.max(-0.01, Math.min(p1.x, this.w + 0.01));
        p1.y = Math.max(-0.01, Math.min(p1.y, this.h + 0.01));
      });
    },
    render () {
      this.ctx.clearRect(0, 0, this.w, this.h);
      this.particles.map(p1 => {
        this.particles.
          filter(p2 => {
            if (p1 == p2)
              return false;
            if (this.distance(p1.x, p1.y, p2.x, p2.y) > p1.connectDistance)
              return false;
            return true;
          }).
          map(p2 => {
            const dist = this.distance(p1.x, p1.y, p2.x, p2.y);
            p1.speed = this.lerp(p1.speed, p1.speed + 0.05 / p1.connectDistance * dist, 0.2);
            return {
              p1,
              p2,
              color: p1.color,
              opacity: Math.floor(100 / p1.connectDistance * (p1.connectDistance - dist)) / 100
            };

          }).
          forEach((line) => {
            const colorSwing = Math.sin(this.time * line.p1.oscSpeedX);
            this.ctx.beginPath();
            this.ctx.globalAlpha = line.opacity;
            this.ctx.moveTo(line.p1.x, line.p1.y);
            this.ctx.lineTo(line.p2.x, line.p2.y);
            this.ctx.strokeStyle = `rgb(
					${Math.floor(line.color.r * colorSwing)},
					${Math.floor(line.color.g * 0.5 + line.color.g * 0.5 * colorSwing)},
					${line.color.b}
				)`;
            this.ctx.lineWidth = line.opacity * 4;
            this.ctx.stroke();
            this.ctx.closePath();
          });
      });
    },
    loop () {
      this.time = new Date();
      this.update();
      this.render();
      this.timeIndex.push(window.requestAnimationFrame(this.loop));
    }

  },
  watch: {

  },
  // 销毁前取消动画
  beforeDestroy () {
    this.timeIndex.forEach(ee => {
      window.cancelAnimationFrame(ee);
    })
    this.timeIndex = []
  }

}
</script>