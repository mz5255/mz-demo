<template>
  <div class="liveplayer">
    <flvPlayer ref="refflvPlayer" :src="liveurl" :screenMode="screenMode" @retryflvPlayer="retryflvPlayer"></flvPlayer>
    <div class="opt">
      <div class="title"></div>
      <div class="button">
        <div class="icon jietu" title="截图" @click.stop="screenshot"></div>
        <div class="icon tingzhi" title="全屏" @click.stop="fullscreen"></div>
        <!-- <div class="icon tingzhi2" @click.stop="stop"></div> -->
      </div>
    </div>
  </div>
</template>
<script>
import flvPlayer from "./index.vue";
export default {
  props: ["liveurl"],
  components: { flvPlayer },
  data() {
    return {
      screenMode: "1"
    };
  },
  created() {
    // this.init()
  },
  methods: {
    screenshot() {
      this.$refs.refflvPlayer.screenshot();
    },
    fullscreen() {
      this.$refs.refflvPlayer.fullscreen();
    },
    stop() {
      this.$refs.refflvPlayer.stop();
    },
    init() {
      // if (this.equipCode === "" || this.equipCode === undefined) {
      //   return;
      // }
      // const param = { equipCode: this.equipCode, type: "pc" };
      // liveShowUrl(param).then(res => {
      //   if (res.code === 200) {
      //     this.src = res.data;
      //   } else {
      //     this.src = "";
      //     this.$message.error(res.msg);
      //   }
      // });
    },
    // 出现异常后 续约
    retryflvPlayer() {
      // this.init();
    }
  },
  mounted() {
    // this.init();
  },
  watch: {
    // equipCode() {
    //   this.init();
    // }
  }
};
</script>
<style scoped>
.liveplayer {
  width: 100%;
  height: 100%;
  position: relative;
}

.liveplayer .opt {
  width: 100%;
  height: 40px;
  background: #000000;
  position: absolute;
  bottom: 0px;
}

.liveplayer .opt .title {
  font-size: 12px;
  font-family: Microsoft YaHei;
  font-weight: 400;
  color: #ffffff;
  line-height: 28px;
  height: 28px;
  padding-left: 10px;
  float: left;
  width: calc(100% - 90px);
}

.liveplayer .opt .button {
  width: 80px;
  float: left;
}

.liveplayer .opt .button .icon {
  width: 20px;
  height: 20px;
  margin-top: 6px;
  margin-left: 5px;
  float: left;
  cursor: pointer;
  background-size: contain;
}

.liveplayer .opt .button .icon:first-child {
  margin-left: 0px;
}

.liveplayer .opt .button .shouchang {
  background-image: url(../../assets/live/shouchang.png);
}

.liveplayer .opt .button .jietu {
  background-image: url(../../assets/live/jietu.png);
}

.liveplayer .opt .button .tingzhi {
  background-image: url(../../assets/live/tingzhi.png);
}

.liveplayer .opt .button .tingzhi2 {
  background-image: url(../../assets/live/tingzhi2.png);
}

.liveplayer .opt .button .shouchang:hover,
.liveplayer .opt .button .shouchang.active {
  background-image: url(../../assets/live/active/shouchang.png);
}

.liveplayer .opt .button .jietu {
  background-image: url(../../assets/live/jietu.png);
}

.liveplayer .opt .button .jietu:hover,
.liveplayer .opt .button .jietu.active {
  background-image: url(../../assets/live/active/jietu.png);
}

.liveplayer .opt .button .tingzhi {
  background-image: url(../../assets/live/tingzhi.png);
}

.liveplayer .opt .button .tingzhi:hover,
.liveplayer .opt .button .tingzhi.active {
  background-image: url(../../assets/live/active/tingzhi.png);
}

.liveplayer .opt .button .tingzhi2 {
  background-image: url(../../assets/live/tingzhi2.png);
}

.liveplayer .opt .button .tingzhi2:hover,
.liveplayer .opt .button .tingzhi2.active {
  background-image: url(../../assets/live/active/tingzhi2.png);
}
</style>
