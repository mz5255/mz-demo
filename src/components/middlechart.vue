<template>
  <myechart ref="echartContent" :options="options" :istitle="false"></myechart>
</template>
<script>
import myechart from './echart/index.vue'
import * as echarts from 'echarts'
export default {
  props: ['chartdata'],
  data () {
    return {
      options: {},
      timer: null
    }
  },
  components: { myechart },
  methods: {
    assignment (val) {
      console.log(val);
    }
  },
  created () {
    this.options = {
      //backgroundColor: '#fff',
      tooltip: {},
      grid: {
        left: '40',
        bottom: '30',
        top: '5'
      },
      dataZoom: [
        {

          show: false,
          type: 'slider', // 这个 dataZoom 组件是 slider 型 dataZoom 组件
          startValue: 0,      // 从头开始。
          endValue: 8    // 一次性展示五个。
        }
      ],
      xAxis: {
        type: 'category',
        data: [
          '大米',
          '小麦粉',
          '食用油',
          '大豆'
        ],
        axisLine: {
          lineStyle: {
            color: '#999'
          }
        },
        axisTick: {
          show: false
        }
      },
      yAxis: {
        type: 'value',
        axisTick: {
          show: false
        },
        axisLine: {
          lineStyle: {
            color: '#999'
          }
        },
        splitLine: {
          show: false
        }
      },
      series: [
        {
          data: [3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
          type: 'bar',
          itemStyle: {
            normal: {
              barBorderRadius: [0, 0, 0, 0],
              color: new echarts.graphic.LinearGradient(0, 1, 0, 0, [
                {
                  offset: 0,
                  color: '#1A4DC0',
                },
                {
                  offset: 1,
                  color: '#9E2FFD',
                },
              ])
            }
          },
          barWidth: '10%'

        },
        {
          data: [3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
          type: 'bar',
          itemStyle: {
            normal: {
              barBorderRadius: [0, 0, 0, 0],
              color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
                {
                  offset: 0,
                  color: '#FF2246'
                }, {
                  offset: 1,
                  color: '#FFC0CB'

                }
              ])
            }
          },
          barWidth: '10%'

        }
      ]
    }
    this.assignment(this.chartdata)

  },
  mounted () { },
  watch: {
    chartdata (val) {
      this.assignment(val)
      if (this.$refs.echartContent !== undefined) {
        this.$refs.echartContent.loadOption(this.options)
      }

    }
  }, beforeDestroy () {
    clearTimeout(this.timer)
    this.timer = null
  }
}
</script>
