<template>
  <div id="app">
    <nav>
      <router-link to="/user">用户</router-link> |
      <router-link to="/echarts">报表</router-link> |
      <router-link to="/dept">部门</router-link> |
      <router-link to="/screen">数据大屏</router-link> |
      <router-link to="/student">学生多对多</router-link> |
      <router-link to="/tel">手机号查询</router-link>
    </nav>
    <router-view/>
  </div>
</template>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

nav {
  padding: 30px;
}

nav a {
  font-weight: bold;
  color: #2c3e50;
}

nav a.router-link-exact-active {
  color: #42b983;
}
</style>
