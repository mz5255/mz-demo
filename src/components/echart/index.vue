<template>
  <div class="echart" :id="controlid" :style="{
    float: 'left',
    width: '100%',
    height: '100%',
  }"></div>
</template>
<script>
import * as echarts from 'echarts'
import tdTheme from '@/components/echart/theme.json' // 引入默认主题
import 'echarts-gl'
import 'echarts-liquidfill/src/liquidFill.js' //在这里引入

export default {
  props: ['options'],
  data() {
    return {
      mychart: {},
      controlid: '',
      optionconfig: {},
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

      // // 随着屏幕大小调节图表
      document.getElementById(this.controlid).addEventListener('resize', () => {
        this.resize()
      })
      this.$emit('initChartAfter')
    },
    resize() {
      this.mychart.resize()
    },
    loadOption(options) {
      this.optionconfig = options
      if (options !== null) {
        this.mychart.setOption(options)
      } else {
        this.mychart.setOption({})
      }
    },
    getMychart() {
      return this.mychart
    },
  },
  created() {
    this.controlid =
      'div' + Date.parse(new Date()) + '_' + Math.ceil(Math.random() * 99999)
  },
  mounted() {
    this.$nextTick(() => {
      this.initChart()
    })
  },
  watch: {
    options(val) {
      this.loadOption(val)
    },
  },
  beforeDestroy() {
    if (this.mychart) {
      this.mychart.dispose();
    }
  },
}
</script>
