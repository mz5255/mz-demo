import { setUser } from '../views/utils/auth.js'
export const userinfo = {
  state: {
    userName: '',
    userAccount: '',
    userId: '',
    userPhone: '',
    userTheme: '',
  },
  mutations: {
    //设置层是否显示
    setUser: (state, user) => {
      state.userName = user.userName
      state.userAccount = user.userAccount
      state.userId = user.userId
      state.userPhone = user.userPhone
      state.userTheme = user.userTheme
    },
  },
  actions: {
    setUser({ commit }, user) {
      setUser('User', user)
      commit('setUser', user)
    },
  },
}
