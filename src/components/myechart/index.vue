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
import { commGetApi, commPostApi } from '../api/index.js'
import elementResizeDetectorMaker from 'element-resize-detector'
import configs from '../../configs'
export default {
  props: ['options'],
  data() {
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
    initChart() {
      // this.$echarts.registerTheme('tdTheme', tdTheme) // 覆盖默认主题
      this.mychart = echarts.init(
        document.getElementById(this.controlid),
        tdTheme
      )
      this.loadOption(this.options)
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
    resize() {
      this.mychart.resize()
    },
    loadOption(options) {
      let app = {}
      if (typeof options === 'function') {
        try {
          options(this.mychart, echarts, app, this)
          // this.optionconfig = options(this.mychart, echarts, app, this)
          // if (this.optionconfig === undefined) {
          //   this.optionconfig = {}
          // }
          // this.mychart.setOption(this.optionconfig, true)
          this.isError = false
        } catch (ex) {
          this.isError = true
          this.logmsg = 'option函数方法语法错误，具体错误：' + ex
        }
      } else if (
        typeof options === 'string' &&
        options.indexOf('function') >= 0
      ) {
        let fun = undefined
        try {
          eval('fun=' + options)
          fun(this.mychart, echarts, app, this)
          // this.optionconfig = fun(this.mychart, echarts, app, this)
          // if (this.optionconfig === undefined) {
          //   this.optionconfig = {}
          // }
          // this.mychart.setOption(this.optionconfig, true)
          this.isError = false
        } catch (ex) {
          this.isError = true
          this.logmsg = 'option函数方法语法错误，具体错误：' + ex
        }
      } else if (
        typeof options === 'string' &&
        options.indexOf('function') < 0
      ) {
        this.isError = false
        this.optionconfig = eval("(" + options + ")")
        if (options !== null && options !== undefined) {
          this.mychart.clear(); // 每次重绘之前，先清除一下
          this.mychart.setOption(this.optionconfig)
        }
      } else if (options !== null && options !== undefined) {
        this.isError = false
        this.optionconfig = options
        if (options !== null && options !== undefined) {
          this.mychart.clear(); // 每次重绘之前，先清除一下
          this.mychart.setOption(options)
        }
      } else {
        this.isError = false
        this.optionconfig = {}
        if (options !== null && options !== undefined) {
          this.mychart.clear(); // 每次重绘之前，先清除一下
          this.mychart.setOption(options)
        }
      }
    },
    getMychart() {
      return this.mychart
    },
    loadMapJson(mapname) {
      configs.getmapjson('mapjson/' + mapname + '.json', (res) => {
        if (res.code == 0) {
          if (typeof res.data !== 'string') {
            echarts.registerMap(mapname, res.data)
          } else {
            echarts.registerMap(
              mapname,
              JSON.parse(res.data.replace(/[\r\n]/g, '').trim())
            )
          }
        }
      })
    },
  },
  created() {
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
    if (echarts.getMap('china') === null) {
      this.loadMapJson('china')
    }
    if (echarts.getMap('world') === null) {
      this.loadMapJson('world')
    }
    this.ajaxget = commGetApi
    this.ajaxpost = commPostApi
  },
  mounted() {
    this.$nextTick(() => {
      this.initChart()
    })
  },
  watch: {
    options(val) {
      if (this.mychart !== undefined) {
        this.loadOption(val)
      }
    },
  },
  beforeDestroy() {
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
