import Vue from 'vue'
import VueRouter from 'vue-router'
Vue.use(VueRouter)
const routes = [
    {
        path: '/test',
        name: 'test',
        // redirect: '/project',
        component: () => import('@/test.vue'),
    },
]
const router = new VueRouter({
    mode: 'history',
    routes
})

export default router