<template>
  <!-- 画布区域 -->
  <div ref="canvasWrap" :style="canvasWrapStyle">
    <my-fabric ref="myFabric" :bg-img-src="this.url" :width="w" :height="h" @zoomend="zoomEnd($event)" @objectdblclick="dblClickMarker($event)" @objectmouseenter="markerMouseenter($event)" @objectmouseleave="markerMouseleave($esvent)" @ready="fabricReady()">
    </my-fabric>
  </div>
</template>
<script>
import MyFabric from "./myfabric.vue";
export default {
  props: ['w', 'h', 'url'],
  components: {
    MyFabric,
  },
  computed: {
    canvasWrapStyle () {
      return `width:${this.w}px;height:${this.h}px;position:relative;`;
    }
  },
  data () {
    return {


    };
  },
  mounted () {
    this.fabricObj = this.$refs.myFabric;
  },
  methods: {
    fabricReady () {
      //渲染标注数据
      this.render();
    },
    render () {
      //拿到标注信息
    },
    //画板缩放时
    zoomEnd (zoom) {
      console.log(zoom);
      // if (zoom > 1) {
      //   this.fabricObj.setCursor("grab");
      // } else {
      //   this.changeMarkerMode(this.markMode);
      // }
    },
    //双击标注时
    dblClickMarker (marker) {
      console.log(marker);
    },
    //鼠标移动标注上时
    markerMouseenter (marker, e) {
      console.log(marker, e);
    },
    //鼠标离开标注时
    markerMouseleave ({ marker, e }) {
      console.log(marker, e);
    },
  },
};
</script>
<style scoped></style>
