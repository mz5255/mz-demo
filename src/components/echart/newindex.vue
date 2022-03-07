<template>
  <div :style="{ width: '100%', height: '100%' }">
    <div v-if="isError !== true" class="echart" :id="controlid" :style="{
        float: 'left',
        width: '100%',
        height: '100%',
      }"></div>
    <div v-else class="logmsg">{{ logmsg }}</div>
  </div>
</template>
<script>
import * as echarts from 'echarts'
import tdTheme from './theme.json' // 引入默认主题
import 'echarts-gl'
import 'echarts-liquidfill/src/liquidFill.js' //在这里引入
import { commGetApi, commPostApi } from '../../api/index.js'
import elementResizeDetectorMaker from 'element-resize-detector'
export default {
  data () {
    return {
      mychart: undefined,
      controlid: '',
      optionconfig: {},
      isError: false,
      logmsg: '',
      ajaxget: null,
      ajaxpost: null,
    }
  },
  methods: {
    initChart () {
      // this.$echarts.registerTheme('tdTheme', tdTheme) // 覆盖默认主题
      this.mychart = echarts.init(
        document.getElementById(this.controlid),
        tdTheme
      )
      let app = {}
      this.$emit("loadoptions", this.mychart, echarts, app, this)
      const _this = this
      const erd = elementResizeDetectorMaker()
      erd.listenTo(document.getElementById(this.controlid), () => {
        _this.$nextTick(() => {
          this.resize()
        })
      })
      // // 随着屏幕大小调节图表
      // document.getElementById(this.controlid).addEventListener('resize', () => {
      //   debugger;
      //   this.resize()
      // })
      this.$emit('initChartAfter')
    },
    resize () {
      this.mychart.resize()
    },
    getMychart () {
      return this.mychart
    },
  },
  created () {
    // echarts.getMap = function (name) {
    //   let jsonmap = undefined
    //   switch (name) {
    //     case 'china':
    //       jsonmap = JSON.parse(mapjson.china)
    //       break;

    //     default:
    //       break;
    //   }
    //   return jsonmap
    // }
    this.controlid =
      'div' + Date.parse(new Date()) + '_' + Math.ceil(Math.random() * 99999)
    this.ajaxget = commGetApi
    this.ajaxpost = commPostApi
  },
  mounted () {
    this.$nextTick(() => {
      this.initChart()
    })
  },
  beforeDestroy () {
    this.mychart.dispose()
  },
}
</script>
<style scoped>
.logmsg {
  color: red;
  font-size: 25px;
}
</style>
