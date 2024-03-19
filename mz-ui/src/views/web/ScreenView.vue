<template>
  <div>
    <!-- 假设这里有一个按钮触发发送请求的操作 -->
    <button @click="sendMessage">发送消息</button>
    <hr/>
    <!--柱状图-->
    <div id="main" style="width: 600px;height:400px;"></div>
<!--   <div id="main1" style="width: 600px;height:400px;"></div>-->
  </div>
</template>

<script>
import  * as echarts from 'echarts';
import axios from 'axios';
export default {
  data() {
    return {
      form:{
        x:[],
        y:[]
      },
      websocket: null,
      userId: 10  // 假设有一个 userId 数据
    };
  },
  methods: {
    //柱状图
    //报表柱状图
    zhuxing(date) {
      var chartDom = document.getElementById('main');
      var myChart = echarts.init(chartDom);
      var option;

      option = {
        tooltip: {
          trigger: 'axis',
          axisPointer: {
            type: 'shadow'
          }
        },
        grid: {
          left: '3%',
          right: '4%',
          bottom: '3%',
          containLabel: true
        },
        xAxis: [
          {
            type: 'category',
            data: date.x,
            axisTick: {
              alignWithLabel: true
            }
          }
        ],
        yAxis: [
          {
            type: 'value'
          }
        ],
        series: [
          {
            name: 'Direct',
            type: 'bar',
            barWidth: '60%',
            data: date.y,
          }
        ]
      };

      option && myChart.setOption(option);

    },
    connectWebSocket() {
      // 创建 WebSocket 连接
      this.websocket = new WebSocket("ws://localhost:8081/api/pushMessage/"+this.userId);

      // 监听 WebSocket 连接打开事件
      this.websocket.onopen = () => {
        console.log('WebSocket 连接已打开');
      };

      // 监听 WebSocket 接收消息事件
      this.websocket.onmessage = (event) => {
        if(event.data!=="连接成功"){
          let data = JSON.parse(event.data);
          console.log('接收到消息：',data);
          this.zhuxing(data)
        }
      };

      // 监听 WebSocket 关闭事件
      this.websocket.onclose = () => {
        console.log('WebSocket 连接已关闭');
      };

      // 监听 WebSocket 错误事件
      this.websocket.onerror = (error) => {
        console.error('WebSocket 出现错误:', error);
      };
    },
    sendMessage() {
      // 发送消息
      if (this.websocket.readyState === WebSocket.OPEN) {
        this.websocket.send("Your message here");
      } else {
        console.error('WebSocket 连接尚未建立');
      }
    }
  },


  mounted() {
    // 在 mounted 钩子中连接 WebSocket
    this.connectWebSocket();




  },
  beforeDestroy() {
    // 在组件销毁之前关闭 WebSocket 连接
    if (this.websocket) {
      this.websocket.close();
    }
  }
};
</script>
