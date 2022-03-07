import Vue from 'vue'
import VueRouter from 'vue-router'
Vue.use(VueRouter)
const routes = [
  {
    path: '/',
    name: 'index',
    component: () => import('../views/bigjson2.vue'),
    meta: {
      title: '首页'
    }
  },


]
const router = new VueRouter({
  mode: 'history',
  routes
})

export default router