<template>
  <div class="flvPlayer" :class="modeClass" v-loading="loading" element-loading-spinner="el-icon-loading"
    element-loading-background="rgba(0, 0, 0, 0.8)">
    <div class="videoloadError" :style="
      src === undefined || src === null || src === ''
        ? 'display:block'
        : 'display:none'
    ">
      <div class="icon"></div>
      <div class="text">视屏加载失败！</div>
    </div>
    <video :id="videoid" muted :style="
      src === undefined || src === null || src === ''
        ? 'display:none'
        : 'display:block'
    "></video>
  </div>
</template>
<script>
import flvjs from "flv.js";
export default {
  props: ["src", "screenMode"],
  data() {
    return {
      videoid: "",
      loading: false,
      modeClass: "adaptive",
      errCount: 0,
      prefixName: "",
      isFullscreenData: false
    };
  },
  created() {
    this.videoid =
      "video" + Date.parse(new Date()) + "_" + Math.ceil(Math.random() * 99999);
  },
  methods: {
    getscreenModeclass() {
      switch (this.screenMode) {
        // case 'quanping':
        //   this.fullscreen()
        //   break
        case "1":
          this.modeClass = "adaptive";
          break;
        case "2":
          this.modeClass = "origin";
          break;
        case "3":
          this.modeClass = "rate-169";
          break;
        case "4":
          this.modeClass = "rate-43";
          break;
        default:
          this.modeClass = "adaptive";
          break;
      }
    },
    ///截图代码
    screenshot() {
      let videoElement = document.getElementById(`${this.videoid}`);
      let canvas = document.createElement("canvas");
      canvas.width = videoElement.videoWidth;
      canvas.height = videoElement.videoHeight;
      canvas
        .getContext("2d")
        .drawImage(videoElement, 0, 0, canvas.width, canvas.height);
      let url = canvas.toDataURL("image/png");
      console.log(url);
      return url;
    },
    ///下载截图
    screenshotDownload() {
      var a = document.createElement("a");
      a.href = this.screenshot();
      const date = new Date();
      const fileName = `${date.toLocaleString()}.png`;
      a.setAttribute("download", fileName);

      a.click();
      this.$message.success(`截图 ${fileName}已为您下载至本地`);
    },
    // 播放
    play() {
      this.playStatus = true;
      this.flvPlayer.play();
    },
    // 停止
    stop() {
      console.log(this.flvPlayer);
      if (this.flvPlayer) {
        try {
          this.flvPlayer.pause();
          this.flvPlayer.unload();
        } catch (e) {
          console.error(e);
        }
        // 卸载DOM对象
        this.flvPlayer.detachMediaElement();
        // 销毁flvjs对象
        this.flvPlayer.destroy();
      }
    },
    pause() {
      this.playStatus = false;
      this.flvPlayer.pause();
    },
    isFullscreen(fn) {
      let fullscreenEnabled;
      // 判断浏览器前缀
      if (document.fullscreenEnabled) {
        fullscreenEnabled = document.fullscreenEnabled;
      } else if (document.webkitFullscreenEnabled) {
        fullscreenEnabled = document.webkitFullscreenEnabled;
        this.prefixName = "webkit";
      } else if (document.mozFullScreenEnabled) {
        fullscreenEnabled = document.mozFullScreenEnabled;
        this.prefixName = "moz";
      } else if (document.msFullscreenEnabled) {
        fullscreenEnabled = document.msFullscreenEnabled;
        this.prefixName = "ms";
      }
      if (!fullscreenEnabled) {
        if (fn !== undefined) fn(); // 执行不支持全屏的回调
        this.isFullscreenData = false;
      }
    },
    fullscreen() {
      this.isFullscreen();
      const element = document.getElementById(this.videoid); // 获取dom
      let methodName =
        this.prefixName === ""
          ? "requestFullscreen"
          : `${this.prefixName}RequestFullScreen`; // API前缀
      console.log(methodName);
      element[methodName](); // 调用全屏
      // }
    },
    // 创建视屏播放
    createPlayer() {
      if (this.src === undefined || this.src === null || this.src === "") {
        return;
      }
      let _this = this;
      if (this.flvPlayer) {
        return;
      }
      if (flvjs.isSupported()) {
        this.loading = true;
        let source = {
          isLive: true,
          hasAudio: false,
          type: "flv",
          url: this.src,
          enableWorker: false, // 不启用分离线程
          enableStashBuffer: false, // 关闭IO隐藏缓冲区
          reuseRedirectedURL: true, // 重用301/302重定向url，用于随后的请求，如查找、重新连接等。
          autoCleanupSourceBuffer: true, // 自动清除缓存
          autoCleanupMaxBackwardDuration: 30, //当向后缓冲区持续时间超过此值（以秒为单位）时，对 SourceBuffer 进行自动清理
          autoCleanupMinBackwardDuration: 20, //指示在执行自动清理时为后向缓冲区保留的持续时间（以秒为单位）。
          lazyLoad: true,
          lazyLoadMaxDuration: 30,
          lazyLoadRecoverDuration: 30
        };
        this.flvPlayer = flvjs.createPlayer(source);
        this.flvPlayer.attachMediaElement(
          document.getElementById(this.videoid)
        );
        this.flvPlayer.on(
          flvjs.Events.ERROR,
          (errorType, errorDetail, errorInfo) => {
            console.log("errorType:", errorType);
            console.log("errorDetail:", errorDetail);
            console.log("errorInfo:", errorInfo);
            // 如果视频播放出错就销毁player，用当前的url重新创建一个
            if (_this.flvPlayer) {
              _this.stop();
              // 出现异常后进行续约 如果续约4次不成功就不在继续续约
              if (_this.errCount < 5) {
                _this.$emit("retryflvPlayer");
              }
            }
          }
        );
        this.flvPlayer.on(flvjs.Events.METADATA_ARRIVED, () => {
          this.errCount = 0;
          console.log("#############加载完成！");
          this.loading = false;
        });
        this.flvPlayer.on(flvjs.Events.MEDIA_INFO, data => {
          const playPromise = _this.flvPlayer.play();
          playPromise.catch(error => {
            console.log("Catch error: ", error);
          });
        });
        this.flvPlayer.on(flvjs.Events.STATISTICS_INFO, data => {
          // console.log(data)
          if (data.speed != 0) {
            setTimeout(function () {
              _this.loading = false;
            }, 1000);
          }
        });

        this.flvPlayer.on(flvjs.Events.LOADING_COMPLETE, function () {
          /// 断流了 需要续约
          console.log("断流了");
          // _this.loading = true
          _this.$emit("onrenew", _this);
        });
        this.flvPlayer.load();
        this.flvPlayer.play();
      }
    }
  },
  mounted() {
    this.getscreenModeclass();
    this.createPlayer();
  },
  destroyed() {
    if (this.flvPlayer) {
      this.stop();
    }
  },
  watch: {
    src: {
      handler: function (newVal, oldVal) {
        let _this = this;
        if (newVal != oldVal || newVal === null) {
          if (_this.flvPlayer) {
            _this.stop();
          }
        }
        if (newVal) {
          _this.createPlayer();
        }
      }
    },
    screenMode() {
      this.getscreenModeclass();
    }
  }
};
</script>
<style scoped>
.flvPlayer {
  width: 100%;
  height: 100%;
}

video {
  width: 100%;
  height: 100%;
}

.adaptive video {
  object-fit: fill !important;
}

.origin video {
  object-fit: none;
}

.rate-169 video {
  position: absolute;
  width: 100%;
  height: 56.52%;
  object-fit: fill !important;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  margin: auto;
}

.rate-43 video {
  position: absolute;
  width: 100%;
  height: 75%;
  object-fit: fill !important;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  margin: auto;
}

.videoloadError {
  width: 140px;
  margin-left: auto;
  margin-right: auto;
  font-size: 10px;
  font-family: Microsoft YaHei;
  font-weight: 400;
  color: #526482;
  margin-top: 30%;
  padding-bottom: 30%;
}

.videoloadError .text {
  width: 100px;
  height: 20px;
  line-height: 20px;
  float: left;
  padding-left: 10px;
}

.videoloadError .icon {
  width: 20px;
  height: 20px;
  background-image: url(../../assets/24gf-pictureSplit.png);
  background-repeat: round;
  float: left;
}
</style>
