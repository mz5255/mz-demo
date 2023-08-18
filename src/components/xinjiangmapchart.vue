<template>
  <myechart ref="echartContent" :options="options" :istitle="false"></myechart>
</template>
<script>
import myechart from './echart/index.vue'
import * as echarts from 'echarts'
var xinjiangMap = new Function(`return xinjiangmapjson`)()
export default {
  props: ['chartdata'],
  data () {
    return {
      options: {},
      timer: null,
      title: '',
    }
  },
  components: { myechart },
  methods: {
    assignment (val) {
      console.log(val)
    },
  },
  created () {
    // var planePath = 'path://M1705.06,1318.313v-89.254l-319.9-221.799l0.073-208.063c0.521-84.662-26.629-121.796-63.961-121.491c-37.332-0.305-64.482,36.829-63.961,121.491l0.073,208.063l-319.9,221.799v89.254l330.343-157.288l12.238,241.308l-134.449,92.931l0.531,42.034l175.125-42.917l175.125,42.917l0.531-42.034l-134.449-92.931l12.238-241.308L1705.06,1318.313z';

    echarts.registerMap('XJ', xinjiangMap)
    // let chartdata = xinjiangMap.features.map(item => {
    //   // 显示窗口的数据转换
    //   let num = 0
    //   return {
    //     fromName: '乌鲁木齐市',
    //     toName: '喀什地区',
    //     coords: [
    //       [87.617733, 43.792818],
    //       [75.989138, 39.467664]]

    //   }
    // })
    this.options = {
      tooltip: { trigger: 'item' },
      geo: {
        show: true,
        map: 'XJ',
        label: { normal: { show: false }, emphasis: { show: false } },
        roam: true,
        itemStyle: {
          normal: {
            borderColor: 'rgba(147, 235, 248, 1)',
            borderWidth: 1,
            areaColor: {
              type: 'radial',
              x: 0.5,
              y: 0.2,
              r: 0.5,
              colorStops: [
                {
                  offset: 0,
                  color: 'rgba(147, 235, 248, .3)' // 0% 处的颜色
                },
                {
                  offset: 1,
                  color: 'rgba(147, 235, 248, .3)' // 100% 处的颜色
                }
              ],
              globalCoord: false // 缺省为 false
            },
            shadowColor: 'rgba(128, 217, 248, 1)',
            // shadowColor: 'rgba(255, 255, 255, 1)',
            shadowOffsetX: -2,
            shadowOffsetY: 2,
            shadowBlur: 10
          },
          emphasis: {
            areaColor: 'rgba(147, 235, 248, 1)',
            borderWidth: 1
          }
        },
      },
      series: [
        {
          name: '城市',
          type: 'scatter',
          coordinateSystem: 'geo',
          symbol: 'circle',
          itemStyle: { normal: {} },
          zlevel: 9,
          data: [
            {
              name: '乌鲁木齐综合保障基地',
              value: [87.617733, 43.792818, '乌鲁木齐综合保障基地', '20.18'],
            },
            {
              name: '巴州区域配送中心',
              value: [86.150969, 41.768552, '巴州区域配送中心', '10.18'],
            },
            {
              name: '克拉玛依区域配送中心',
              value: [84.873946, 45.595886, '克拉玛依区域配送中心', '30.18'],
            },
            {
              name: '阿图什市骨干供应站',
              value: [76.172825, 39.713431, '阿图什市骨干供应站', '40.18'],
            },

            {
              name: '和田区域配送中心',
              value: [79.92533, 37.110687, '和田区域配送中心', '0.18'],
            },
            {
              name: '伊犁区域配送中心',
              value: [81.317946, 43.92186, '伊犁区域配送中心', '80.18'],
            },
            {
              name: '哈密市伊州区骨干供应站',
              value: [93.51316, 42.833248, '哈密市伊州区骨干供应站', '80.18'],
            },
            {
              name: '阿克苏区域配送中心',
              value: [80.265068, 41.170712, '阿克苏区域配送中心', '80.18'],
            },
            {
              name: '喀什综合保障基地',
              value: [75.989138, 39.467664, '喀什综合保障基地', '80.18'],
            },
            {
              name: '叶城县骨干供应站',
              value: [77.05810547, 37.12829590, '叶城县骨干供应站', '80.18'],
            },
            {
              name: '巴楚县骨干供应站',
              value: [78.57421875, 39.75402832, '巴楚县骨干供应站', '80.18'],
            },
            {
              name: '额敏县骨干供应站',
              value: [83.63342285,
                46.49963379, '额敏县骨干供应站', '80.18'],
            },
            {
              name: '阿勒泰区域配送中心',
              value: [83.63342285,
                46.49963379, '阿勒泰区域配送中心', '80.18'],
            },
          ],
          tooltip: {},
        },
        {
          type: 'effectScatter',
          coordinateSystem: 'geo',
          data: [
            {
              name: '乌鲁木齐综合保障基地',
              value: [87.617733, 43.792818, '乌鲁木齐综合保障基地', '20.18'],
            },
            {
              name: '巴州区域配送中心',
              value: [86.150969, 41.768552, '巴州区域配送中心', '10.18'],
            },
            {
              name: '克拉玛依区域配送中心',
              value: [84.873946, 45.595886, '克拉玛依区域配送中心', '30.18'],
            },
            {
              name: '阿图什市骨干供应站',
              value: [76.172825, 39.713431, '阿图什市骨干供应站', '40.18'],
            },

            {
              name: '和田区域配送中心',
              value: [79.92533, 37.110687, '和田区域配送中心', '0.18'],
            },
            {
              name: '伊犁区域配送中心',
              value: [81.317946, 43.92186, '伊犁区域配送中心', '80.18'],
            },
            {
              name: '哈密市伊州区骨干供应站',
              value: [93.51316, 42.833248, '哈密市伊州区骨干供应站', '80.18'],
            },
            {
              name: '阿克苏区域配送中心',
              value: [80.265068, 41.170712, '阿克苏区域配送中心', '80.18'],
            },
            {
              name: '喀什综合保障基地',
              value: [75.989138, 39.467664, '喀什综合保障基地', '80.18'],
            },
            {
              name: '叶城县骨干供应站',
              value: [77.05810547, 37.12829590, '叶城县骨干供应站', '80.18'],
            },
            {
              name: '巴楚县骨干供应站',
              value: [78.57421875, 39.75402832, '巴楚县骨干供应站', '80.18'],
            },
            {
              name: '额敏县骨干供应站',
              value: [83.80645752,
                46.60125732, '额敏县骨干供应站', '80.18'],
            },
            {
              name: '阿勒泰区域配送中心',
              value: [83.63342285,
                46.49963379, '阿勒泰区域配送中心', '80.18'],
            },
          ],
          symbolSize: 5,
          showEffectOn: 'render',
          rippleEffect: { brushType: 'stroke', scale: 10 },
          hoverAnimation: false,
          itemStyle: { normal: { shadowBlur: 20 } },
          zlevel: 5,
          label: {
            normal: {
              show: true,
              position: 'bottom',
              offset: [10, 20],
              textStyle: { color: '#fff', fontSize: 12 },
              formatter: function (value) {
                return value.name
              },
            },
          },
        },
        {
          type: 'lines',
          zlevel: 1,
          effect: {
            symbol: 'arrow',
            show: true,
            period: 6,
            trailLength: 0.5,
            color: '#fff',
            symbolSize: 8,
          },
          lineStyle: { normal: { color: '#c2f555', width: 0, curveness: 0.2 } },
          data: [
            {
              coords: [
                [86.150969, 41.768552],
                [87.617733, 43.792818],
              ],
              lineStyle: { color: '#00ffff' },
            },
            {
              coords: [
                [84.873946, 45.595886],
                [87.617733, 43.792818],
              ],
              lineStyle: { color: '#00ff00' },
            },
            {
              coords: [
                [76.172825, 39.713431],
                [87.617733, 43.792818],
              ],
              lineStyle: { color: '#ffff00' },
            },


            {
              coords: [
                [79.92533, 37.110687],
                [87.617733, 43.792818],
              ],
              lineStyle: { color: '#ff3333' },
            },
            {
              coords: [
                [81.317946, 43.92186],
                [87.617733, 43.792818],
              ],
              lineStyle: { color: '#ff3333' },
            },

            {
              coords: [
                [80.265068, 41.170712],
                [87.617733, 43.792818],
              ],
              lineStyle: { color: '#ff3333' },
            },
            {
              coords: [
                [75.989138, 39.467664],
                [87.617733, 43.792818],
              ],
              lineStyle: { color: '#ff3333' },
            },
            {
              coords: [
                [77.05810547, 37.12829590],
                [87.617733, 43.792818],
              ],
              lineStyle: { color: '#ff3333' },
            },
            {
              coords: [
                [78.57421875, 39.75402832],
                [87.617733, 43.792818],
              ],
              lineStyle: { color: '#ff3333' },
            },
            {
              coords: [
                [83.80645752,
                  46.60125732],
                [87.617733, 43.792818],
              ],
              lineStyle: { color: '#ff3333' },
            },
            {
              coords: [
                [83.63342285,
                  46.49963379],
                [87.617733, 43.792818],
              ],
              lineStyle: { color: '#ff3333' },
            },
          ],
        },
        {
          type: 'lines',
          zlevel: 2,
          symbol: 'none',
          symbolSize: 10,
          effect: {
            show: true,
            period: 6,
            trailLength: 0,
            symbol: 'arrow',
            symbolSize: 15,
          },
          lineStyle: {
            normal: {
              color: '#c2f555',
              width: 3,
              opacity: 0.6,
              curveness: 0.2,
            },
          },
          data: [
            {
              coords: [
                [86.150969, 41.768552],
                [87.617733, 43.792818],
              ],
              lineStyle: { color: '#00ffff' },
            },
            {
              coords: [
                [84.873946, 45.595886],
                [87.617733, 43.792818],
              ],
              lineStyle: { color: '#00ff00' },
            },
            {
              coords: [
                [76.172825, 39.713431],
                [87.617733, 43.792818],
              ],
              lineStyle: { color: '#ffff00' },
            },

            {
              coords: [
                [93.51316, 42.833248],
                [87.617733, 43.792818],
              ],
              lineStyle: { color: '#00ffff' },
            },
            {
              coords: [
                [79.92533, 37.110687],
                [87.617733, 43.792818],
              ],
              lineStyle: { color: '#ff3333' },
            },
            {
              coords: [
                [81.317946, 43.92186],
                [87.617733, 43.792818],
              ],
              lineStyle: { color: '#ff3333' },
            },

            {
              coords: [
                [80.265068, 41.170712],
                [87.617733, 43.792818],
              ],
              lineStyle: { color: '#ff3333' },
            },
            {
              coords: [
                [75.989138, 39.467664],
                [87.617733, 43.792818],
              ],
              lineStyle: { color: '#ff3333' },
            },
            {
              coords: [
                [77.05810547, 37.12829590],
                [87.617733, 43.792818],
              ],
              lineStyle: { color: '#ff3333' },
            },
            {
              coords: [
                [78.57421875, 39.75402832],
                [87.617733, 43.792818],
              ],
              lineStyle: { color: '#00edf4' },
            },
            {
              coords: [
                [83.80645752,
                  46.60125732],
                [87.617733, 43.792818],
              ],
              lineStyle: { color: '#3baaff' },
            },
            {
              coords: [
                [83.63342285,
                  46.49963379],
                [87.617733, 43.792818],
              ],
              lineStyle: { color: '#895cff' },
            },
          ],
        },
      ],
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
    },
  },
  beforeDestroy () {
    clearTimeout(this.timer)
    this.timer = null
  },
}
</script>
