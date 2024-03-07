<template>
  <div :style="getcss">{{ amount }}</div>
</template>
<script>
export default {
  props: {
    num: {
      type: Number,
      default: 0
    },
    w: {
      type: Number,
      default: 12
    },
    h: {
      type: Number,
      default: 12
    },
    content: {
      type: String,
      default: ''
    }, cssstyle: {
      type: String,
      default: ''
    }
  },
  computed: {
    getcss() {
      return `width:${this.w}px;height:${this.h}px;  ` + this.cssstyle;
    }
  },
  mounted() {
    this.loadnumScroll();
  },

  data() {
    return {
      amount: 0
    };
  },
  methods: {
    loadnumScroll() {
      this.numScroll(this.num, this);
    },

    ///数字千分位 格式化
    numberFormat(value) {
      if (typeof value == "number" || Number.isNaN(value)) {
        var valstr = value + "";
        let varArry = valstr.split(".");
        valstr = varArry[0];
        let i = 0;
        var val = "";
        for (let key in valstr) {
          val = val + valstr[valstr.length - 1 - key];
        }
        valstr = val;
        val = "";
        for (let key in valstr) {
          if (i % 3 === 0 && i != 0) {
            val = val + "," + valstr[key];
          } else {
            val = val + valstr[key];
          }
          i++;
        }
        valstr = val;
        val = "";
        for (let key in valstr) {
          val = val + valstr[valstr.length - 1 - key];
        }
        if (varArry.length > 1) {
          return val + "." + varArry[1];
        }
        return val;
      }
      return value;
    },
    /* 数字滚动动画 */
    numScroll(maxNum, that) {
      let numText = 0;
      if (that.animateFrame != null) {
        cancelAnimationFrame(that.animateFrame); // 清除 requestAnimationFrame 请求动画帧
      }
      let step = Number((maxNum / 100).toFixed(0));
      if (step == 0) {
        step = 1;
      }
      // 数字动画
      function digitalAnimation() {
        numText += step; // 速度的计算可以为小数 。数字越大，滚动越快
        if (numText >= maxNum) {
          numText = maxNum;
          cancelAnimationFrame(that.animateFrame);
        } else {
          that.animateFrame = requestAnimationFrame(digitalAnimation); // 请求动画帧(一个浏览器的宏任务)
        }
        if (that.content != null && that.content.indexOf("{nt}") >= 0) {
          that.amount = that.content.replace("{nt}", that.numberFormat(numText));
        } else {
          that.amount = that.numberFormat(numText);
        }
      }
      digitalAnimation(); // 数字动画
    }
  },
  watch: {
    num() {
      this.loadnumScroll();
    },
    content() {
      if (this.content.indexOf("{nt}") >= 0) {
        this.loadnumScroll();
      }
    }
  }
};
</script>
