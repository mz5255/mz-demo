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
    {
        path: '/version',
        name: 'version',
        // redirect: '/project',
        component: () => import('@/version_01.vue'),
    }, {
        path: '/test2',
        name: 'test2',
        // redirect: '/project',
        component: () => import('@/test2.vue'),
    }, {
        path: '/test3',
        name: 'test3',
        // redirect: '/project',
        component: () => import('@/test3.vue'),
    },
    {
        path: '/test4',
        name: 'test4',
        // redirect: '/project',
        component: () => import('@/test4.vue'),
    },
    {
        path: '/test5',
        name: 'test5',
        // redirect: '/project',
        component: () => import('@/test5.vue'),
    },
    {
        path: '/',
        name: 'home',
        // redirect: '/project',
        component: () => import('@/home.vue'),
    },
]
const router = new VueRouter({
    mode: 'history',
    routes
})

export default router