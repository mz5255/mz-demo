import Vue from 'vue'
import router from './router'
import ElementUI from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css'
import App from './App.vue'
import store from './store'
import dataV from '@jiaminghi/data-view'
import { commGetApi, commPostApi } from './api/index.js'
import './components/index.js' // 引入组件
Vue.use(dataV)
Vue.use(ElementUI)

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')

Vue.prototype.$ajaxget = commGetApi
Vue.prototype.$ajaxpost = commPostApi
