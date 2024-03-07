import Vue from "vue";
import router from "./router";
import ElementUI from "element-ui";
import "element-ui/lib/theme-chalk/index.css";
import App from "./App.vue";
import store from "./store";
import dataV from "@jiaminghi/data-view";
import {
  commGetApi,
  commPostApi,
  ajaxComm,
  testExecuteApi,
} from "./views/api/index.js";
import configs from "./configs/index.js";
import "@/icons/index.js"; // icon
import "font-awesome/css/font-awesome.min.css";
import "@/styles/index.css";
import "@/styles/cuIcon.css";

import Cookies from "js-cookie";
import { Icon, Tree } from "ant-design-vue";
import "ant-design-vue/dist/antd.css";
import "./styles/comm.css";
Vue.use(dataV);
Vue.use(ElementUI, {
  size: Cookies.get("size") || "small", // set element-ui default size
});
Vue.component(Tree.name, Tree);
Vue.component(Icon.name, Icon);

new Vue({
  router,
  store,
  render: (h) => h(App),
}).$mount("#app");
Vue.prototype.$transformUrl = (url, isbool) => {
  let urlhead = configs.echartUrl + "/echartdb";
  if (isbool === true) {
    return urlhead + url;
  } else {
    return url.replace("_@web", urlhead);
  }
};
Vue.prototype.$event = {};
Vue.prototype.$ajaxget = commGetApi;
Vue.prototype.$newAjaxPost = commPostApi;
Vue.prototype.$ajaxComm = ajaxComm;
Vue.prototype.$ajaxpost = testExecuteApi;
