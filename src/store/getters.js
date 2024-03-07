const getters = {
  isleft1: (state) => state.bgconfig.isleft1,
  isleft2: (state) => state.bgconfig.isleft2,
  isleft3: (state) => state.bgconfig.isleft3,
  left: (state) => state.bgconfig.left,
  top: (state) => state.bgconfig.top,
  activeid: (state) => state.bgconfig.activeid,
  isrigth: (state) => state.bgconfig.isrigth,
  width: (state) => state.bgconfig.width,
  height: (state) => state.bgconfig.height,
  userName: (state) => state.userinfo.userName,
  userAccount: (state) => state.userinfo.userAccount,
  userId: (state) => state.userinfo.userId,
  userPhone: (state) => state.userinfo.userPhone,
  userTheme: (state) => state.userinfo.userTheme,
  layoutrigth: (state) => state.bgconfig.layoutrigth,
}
export default getters
