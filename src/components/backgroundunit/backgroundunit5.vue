<template>
  <canvas ref="canvascontext" :width="w" :height="h" :id="controlid"></canvas>
</template>
<script>
class generate_mol {
  constructor(w, h, mol, controlid) {
    this.x = Math.random() * w;
    this.y = Math.random() * h;
    this.vx = Math.random() * -2;
    this.vy = Math.random() * 2;
    this.vr = 0.1;
    this.r = Math.random() * Math.PI;
    this.mol = mol;
    this.controlid = controlid;
    this.ctx = document.getElementById(this.controlid).getContext("2d")
  }
  draw () {
    // this.ctx.translate(1, 0, 0, 1, 0, 0)
    if (this.mol == "C6H6O") {
      //Phenol
      this.ctx.save();
      // this.ctx.translate(1, 0, 0, 1, 0, 0)
      // this.ctx.clearRect(0, 0, document.getElementById(this.controlid).w, document.getElementById(this.controlid).h);
      this.ctx.translate(this.x + 20, this.y + 80);
      this.ctx.rotate(this.r);
      this.ctx.translate(-this.x + 20, -this.y - 80);
      this.ctx.beginPath();
      this.ctx.moveTo(this.x, this.y + 5);
      this.ctx.lineTo(this.x, this.y + 30);
      this.ctx.lineTo(this.x - 26, this.y + 45);
      this.ctx.lineTo(this.x - 26, this.y + 75);
      this.ctx.lineTo(this.x, this.y + 90);
      this.ctx.lineTo(this.x + 26, this.y + 75);
      this.ctx.lineTo(this.x + 26, this.y + 45);
      this.ctx.lineTo(this.x, this.y + 30);
      this.ctx.moveTo(this.x - 20, this.y + 47);
      this.ctx.lineTo(this.x - 20, this.y + 73);
      this.ctx.moveTo(this.x, this.y + 83);
      this.ctx.lineTo(this.x + 22, this.y + 70);
      this.ctx.moveTo(this.x, this.y + 36);
      this.ctx.lineTo(this.x + 22, this.y + 49);
      this.ctx.strokeStyle = "rgba(255,255,255,0.2)";
      this.ctx.lineWidth = 3;
      this.ctx.stroke();
      this.ctx.fillStyle = "rgba(255,255,255,0.2)";
      this.ctx.font = "15px Arial";
      this.ctx.fillText("OH", this.x - 5, this.y);
      this.ctx.closePath();
      this.ctx.restore();
    }
    else if (this.mol == "C8H10N4O2") {
      //Caffeine
      this.ctx.save();
      // this.ctx.translate(1, 0, 0, 1, 0, 0)
      // this.ctx.clearRect(0, 0, document.getElementById(this.controlid).w, document.getElementById(this.controlid).h);
      // this.ctx.translate(this.x + 20, this.y + 80);
      this.ctx.rotate(this.r);
      //this.ctx.translate(-this.x + 20, -this.y - 80);
      this.ctx.beginPath();
      this.ctx.moveTo(this.x, this.y + 5);
      this.ctx.lineTo(this.x, this.y + 22);
      this.ctx.moveTo(this.x - 9, this.y + 35);
      this.ctx.lineTo(this.x - 26, this.y + 45);
      this.ctx.lineTo(this.x - 26, this.y + 75);
      this.ctx.lineTo(this.x, this.y + 90);
      this.ctx.lineTo(this.x + 18, this.y + 80);
      this.ctx.moveTo(this.x + 26, this.y + 68);
      this.ctx.lineTo(this.x + 26, this.y + 45);
      this.ctx.lineTo(this.x + 9, this.y + 35);
      this.ctx.moveTo(this.x - 20, this.y + 47);
      this.ctx.lineTo(this.x - 20, this.y + 73);
      this.ctx.moveTo(this.x + 23, this.y + 42);
      this.ctx.lineTo(this.x + 36, this.y + 32);
      this.ctx.moveTo(this.x + 26, this.y + 46);
      this.ctx.lineTo(this.x + 39, this.y + 36);
      this.ctx.moveTo(this.x + 34, this.y + 81);
      this.ctx.lineTo(this.x + 48, this.y + 90);
      this.ctx.moveTo(this.x - 2, this.y + 88);
      this.ctx.lineTo(this.x - 2, this.y + 110);
      this.ctx.moveTo(this.x + 3, this.y + 88);
      this.ctx.lineTo(this.x + 3, this.y + 110);
      this.ctx.moveTo(this.x - 26, this.y + 45);
      this.ctx.lineTo(this.x - 46, this.y + 38);
      this.ctx.moveTo(this.x - 60, this.y + 44);
      this.ctx.lineTo(this.x - 74, this.y + 58);
      this.ctx.lineTo(this.x - 61, this.y + 77);
      this.ctx.moveTo(this.x - 58, this.y + 49);
      this.ctx.lineTo(this.x - 68, this.y + 59);
      this.ctx.moveTo(this.x - 46, this.y + 82);
      this.ctx.lineTo(this.x - 26, this.y + 73);
      this.ctx.moveTo(this.x - 60, this.y + 86);
      this.ctx.lineTo(this.x - 70, this.y + 100);
      this.ctx.strokeStyle = "rgba(255,255,255,0.2)";
      this.ctx.lineWidth = 3;
      this.ctx.stroke();
      this.ctx.fillStyle = "rgba(255,255,255,0.2)";
      this.ctx.font = "15px Arial";
      this.ctx.fillText("CH", this.x - 5, this.y);
      this.ctx.fillText("3", this.x + 18, this.y + 6);
      this.ctx.fillText("N", this.x - 5, this.y + 37);
      this.ctx.fillText("O", this.x + 38, this.y + 35);
      this.ctx.fillText("N", this.x + 21, this.y + 81);
      this.ctx.fillText("CH", this.x + 50, this.y + 99);
      this.ctx.fillText("3", this.x + 72, this.y + 105);
      this.ctx.fillText("O", this.x - 5, this.y + 124);
      this.ctx.fillText("N", this.x - 59, this.y + 42);
      this.ctx.fillText("N", this.x - 59, this.y + 84);
      this.ctx.fillText("H  C", this.x - 98, this.y + 114);
      this.ctx.fillText("3", this.x - 87, this.y + 119);
      this.ctx.closePath();
      this.ctx.restore();
    }
    else if (this.mol == "C6H6") {
      //Benzene
      this.ctx.save();
      // this.ctx.translate(1, 0, 0, 1, 0, 0)
      // this.ctx.clearRect(0, 0, document.getElementById(this.controlid).w, document.getElementById(this.controlid).h);
      this.ctx.translate(this.x + 20, this.y + 80);
      this.ctx.rotate(this.r);
      this.ctx.translate(-this.x + 20, -this.y - 80);
      this.ctx.beginPath();
      this.ctx.moveTo(this.x, this.y + 30);
      this.ctx.lineTo(this.x - 26, this.y + 45);
      this.ctx.lineTo(this.x - 26, this.y + 75);
      this.ctx.lineTo(this.x, this.y + 90);
      this.ctx.lineTo(this.x + 26, this.y + 75);
      this.ctx.lineTo(this.x + 26, this.y + 45);
      this.ctx.lineTo(this.x, this.y + 30);
      this.ctx.moveTo(this.x - 20, this.y + 47);
      this.ctx.lineTo(this.x - 20, this.y + 73);
      this.ctx.moveTo(this.x, this.y + 83);
      this.ctx.lineTo(this.x + 22, this.y + 70);
      this.ctx.moveTo(this.x, this.y + 36);
      this.ctx.lineTo(this.x + 22, this.y + 49);
      this.ctx.strokeStyle = "rgba(255,255,255,0.2)";
      this.ctx.lineWidth = 3;
      this.ctx.stroke();
      this.ctx.closePath();
      this.ctx.restore();
    }
  }
}
export default {
  props: ['w', 'h'],
  data () {
    return {
      controlid: '',
      ctx: undefined,
      canvas: null,
      timeIndex: [],
      mols: []
    }
  },
  created () {
    this.controlid =
      'div' + Date.parse(new Date()) + '_' + Math.ceil(Math.random() * 99999)
    this.$nextTick(() => {
      this.canvas = document.getElementById(this.controlid);
      this.ctx = this.canvas.getContext("2d")
      this.init();
      this.loop();
    })
  },
  methods: {
    init () {
      for (var i = 0; i < 28; i++) {
        this.mols.push(new generate_mol(this.w, this.h, "C8H10N4O2", this.controlid));
        this.mols.push(new generate_mol(this.w, this.h, "C6H6O", this.controlid));
        this.mols.push(new generate_mol(this.w, this.h, "C6H6", this.controlid));
      }
    },
    draw () {
      this.canvas.width = this.w;
      for (var i = 0; i < this.mols.length; i++) {
        var m = this.mols[i];
        m.x += m.vx;
        if (m.x >= this.w - 100 || m.x <= 0) {
          m.vx = -m.vx;
        }
        m.y += m.vy;
        if (m.y >= this.h - 100 || m.y <= 0) {
          m.vy = -m.vy;
        }

        m.r += 0.005;
        m.draw();
      }
    },
    loop () {
      this.draw();
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
