<template>
  <div>
    <img src="http://localhost:8081/user/getTwoCode?content='大傻逼'" style="width:100px;height: 100px;">
    <el-form :inline="true" :model="form">
      <el-form-item label="查询归属地和当地天气">
        <el-input v-model="form.tel" placeholder="手机号" @keydown.enter.native="onSubmit"></el-input>
      </el-form-item>
      <el-button type="primary" @click="onSubmit">查询</el-button>
    </el-form>

    <div v-loading="cityLoad">
      <p v-if="city">归属地：{{city}}</p>
      <p v-if="weather.info">天气：{{weather.info}}</p>
      <p v-if="weather.temperature">温度：{{weather.temperature}}</p>
      <p v-if="weather.humidity">湿度：{{weather.humidity}}</p>
      <p v-if="weather.direct">风向：{{weather.direct}}</p>
      <p v-if="weather.power">风力：{{weather.power}}</p>
      <p v-if="weather.api">空气质量：{{weather.api}}</p>
    </div>
  </div>
</template>

<script>

import axios from "axios";

export default {
  data() {
    return {
      form: {},
      city:"",
      weather: {},
      cityLoad:false
    }
  },
  methods: {
    onSubmit(){
      this.cityLoad=true;
      axios.get("user/queryForm?tel="+this.form.tel).then(r=>{
        this.city=r.data.city;
        this.getWeather();
      })
    },
    getWeather(){
      axios.get("user/getWeather?city="+this.city).then(r=>{
        this.weather=r.data
        this.cityLoad=false;
      })
    }
  },
  created() {

  }
}
</script>
