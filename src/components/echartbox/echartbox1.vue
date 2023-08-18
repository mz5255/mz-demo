<template>
    <div class="modular" :style="'height:' + h + 'px;'">
      <div class="modularhead" v-if="isshow !== false">{{ title }}<span v-if="unit" style="color: #fff; font-size: 14px;float: right;margin-right: 40px;">单位：{{unit}}</span></div>
      <slot></slot>
    </div>
  </template>
  <script>
  export default {
    props: ['h', 'isshow', 'title', 'unit'],
  }
  </script>
  <style scoped>
  .modular {
    width: 100%;
    position: relative;
    border: 1px solid #05b4fa;
    background: #0912337d;
    transition: all 1s;
  }
  .modular:before {
    content: '';
    position: absolute;
    width: 80%;
    height: 100%;
    bottom: -1px;
    top: -1px;
    left: 10%;
    border-bottom: 1px solid #112236;
    border-top: 1px solid #112236;
    transition: all 0.5s;
  }
  .modular:after {
    content: '';
    position: absolute;
    width: 100%;
    height: 80%;
    left: -1px;
    right: -1px;
    top: 10%;
    border-left: 1px solid #112236;
    border-right: 1px solid #112236;
    transition: all 0.5s;
  }
  .modularhead {
    width: 100%;
    height: 45px;
    /* border: 1px solid gold; */
    text-align: left;
    color: white;
    padding-left: 30px;
    line-height: 45px;
    font-size: 14px;
    position: relative;
  }
  .modularhead::before {
    width: 3px;
    height: 25px;
    top: 9px;
    left: 12px;
    position: absolute;
    content: '';
    background: #59ebe8;
    border-radius: 2px;
  }
  .modular:hover {
    box-shadow: -5px 0px 2px #0912330b, /*左边阴影*/ 0px -5px 2px #0912330b,
      /*上边阴影*/ 5px 0px 2px #0912330b, /*右边阴影*/ 0px 5px 2px #0912330b;
    background: #0912330b;
  }
  .modular:hover::before {
    width: 0%;
  }
  .modular:hover::after {
    height: 0%;
  }
  </style>
  