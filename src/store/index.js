import Vue from 'vue'
import Vuex from 'vuex'
import { bgconfig } from './bigscreen.js'
import { userinfo } from './userinfo.js'
import getters from './getters'
Vue.use(Vuex)

const store = new Vuex.Store({
  modules: {
    bgconfig,
    userinfo,
  },
  getters,
})

export default store
