<template>
  <div>
    <div id="bar" style="width: 600px;height:400px; float: left"></div>
    <div id="line" style="width: 600px;height:400px; float: left"></div>
  </div>
</template>

<script>
import * as echarts from 'echarts';
import axios from "axios";

export default {
  data() {
    return {
    }
  },
  methods: {
    getBarXY(){
      axios.get("user/bar").then(r=>{
        if (r.code == 200){
          var chartDom = document.getElementById('bar');
          var myChart = echarts.init(chartDom);
          var option;

          option = {
            xAxis: {
              type: 'category',
              data: r.data.x
            },
            yAxis: {
              type: 'value'
            },
            series: [
              {
                data: r.data.y,
                type: 'bar'
              }
            ]
          };

          option && myChart.setOption(option);
        }
      })
    },
    getLineXY(){
      axios.get("user/line").then(r=>{
        if (r.code == 200){
          var chartDom = document.getElementById('line');
          var myChart = echarts.init(chartDom);
          var option;

          option = {
            xAxis: {
              type: 'category',
              data: r.data.x
            },
            yAxis: {
              type: 'value'
            },
            series: [
              {
                data: r.data.y,
                type: 'line'
              }
            ]
          };

          option && myChart.setOption(option);
        }
      })
    }
  },
  mounted() {
    this.getBarXY();
    this.getLineXY();
  },
  created() {
  }
}
</script>

<style scoped>

</style>