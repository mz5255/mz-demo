<template>
  <div :style="{ width: '100%', height: '100%' }">
    <div v-if="isError !== true" class="echart" :id="controlid" :style="{
    float: 'left',
    width: '100%',
    height: '100%',
  }"></div>
    <div v-else class="logmsg">{{ logmsg }}</div>
  </div>
</template>
<script>
import * as echarts from "echarts";
import tdTheme from "./theme.json"; // 引入默认主题
import "echarts-gl";
import "echarts-liquidfill/src/liquidFill.js"; //在这里引入
import { commGetApi, commPostApi } from "@/views/api/index.js";
import elementResizeDetectorMaker from "element-resize-detector";
import configs from "../../configs";
export default {
  props: ["options", "isDrillingIn", "mapcity", "mapcode"],
  data() {
    return {
      mychart: undefined,
      controlid: "",
      optionconfig: {},
      isError: false,
      logmsg: "",
      ajaxget: null,
      ajaxpost: null,
    };
  },
  methods: {
    initChart() {
      // this.$echarts.registerTheme('tdTheme', tdTheme) // 覆盖默认主题
      this.mychart = echarts.init(
        document.getElementById(this.controlid),
        tdTheme
      );
      this.loadOption(this.options);
      const _this = this;
      const erd = elementResizeDetectorMaker();
      erd.listenTo(document.getElementById(this.controlid), () => {
        _this.$nextTick(() => {
          this.resize();
        });
      });
      // // 随着屏幕大小调节图表
      // document.getElementById(this.controlid).addEventListener('resize', () => {
      //   debugger;
      //   this.resize()
      // })

      this.mychart.off("click"); //图表渲染前销毁点击事件

      this.mychart.on("click", function (event) {
        if (this.isDrillingIn === true) {
          let mapname = "";
          let echartoptions = _this.mychart.getOption();
          let findResult = kylinjson.kylinjson({
            path: "$..map",
            json: echartoptions,
          });
          if (findResult.length > 0) {
            findResult.forEach((element) => {
              if (typeof element === "string" && element !== "") {
                mapname = element;
              }
            });
          } else {
            let findResult2 = kylinjson.kylinjson({
              path: "$..mapType",
              json: echartoptions,
            });
            if (findResult2.length > 0) {
              findResult2.forEach((element) => {
                if (typeof element === "string" && element !== "") {
                  mapname = element;
                }
              });
            }
          }
          let mapjson = echarts.getMap(mapname);
          let item = mapjson.geoJSON.features.findLast(
            (ee) => ee.properties.name.indexOf(event.name) >= 0
          );
          if (item != null) {
            let code = item.properties.id;
            for (let i = item.properties.id.length; i < 6; i++) {
              code = code + "0";
            }
            _this.registerMapJson(code, mapname);
          }
        }
        _this.$emit("clickEchart", event);
      });
      // this.mychart.getZr().off("click");
      // this.mychart.getZr().on("click", (params) => {
      //   debugger;
      // });
      this.$emit("initChartAfter");
    },
    resize() {
      this.mychart.resize();
    },
    loadOption(options) {
      let app = {};
      if (typeof options === "function") {
        try {
          options(this.mychart, echarts, app, this);
          // this.optionconfig = options(this.mychart, echarts, app, this)
          // if (this.optionconfig === undefined) {
          //   this.optionconfig = {}
          // }
          // this.mychart.setOption(this.optionconfig, true)
          this.isError = false;
        } catch (ex) {
          this.isError = true;
          this.logmsg = "option函数方法语法错误，具体错误：" + ex;
        }
      } else if (
        typeof options === "string" &&
        options.indexOf("function") >= 0
      ) {
        let fun = undefined;
        try {
          eval("fun=" + options);
          fun(this.mychart, echarts, app, this);
          // this.optionconfig = fun(this.mychart, echarts, app, this)
          // if (this.optionconfig === undefined) {
          //   this.optionconfig = {}
          // }
          // this.mychart.setOption(this.optionconfig, true)
          this.isError = false;
        } catch (ex) {
          this.isError = true;
          this.logmsg = "option函数方法语法错误，具体错误：" + ex;
        }
      } else if (
        typeof options === "string" &&
        options.indexOf("function") < 0
      ) {
        this.isError = false;
        this.optionconfig = eval("(" + options + ")");
        if (options !== null && options !== undefined) {
          this.mychart.clear(); // 每次重绘之前，先清除一下
          this.mychart.setOption(this.optionconfig);
        }
      } else if (options !== null && options !== undefined) {
        this.isError = false;
        this.optionconfig = options;
        if (options !== null && options !== undefined) {
          this.mychart.clear(); // 每次重绘之前，先清除一下
          this.mychart.setOption(options);
        }
      } else {
        this.isError = false;
        this.optionconfig = {};
        if (options !== null && options !== undefined) {
          this.mychart.clear(); // 每次重绘之前，先清除一下
          this.mychart.setOption(options);
        }
      }
    },
    getMychart() {
      return this.mychart;
    },
    loadMapJson(mapname) {
      configs.getmapjson("mapjson/" + mapname + ".json", (res) => {
        if (res.code == 0) {
          if (typeof res.data !== "string") {
            echarts.registerMap(mapname, res.data);
          } else {
            echarts.registerMap(
              mapname,
              JSON.parse(res.data.replace(/[\r\n]/g, "").trim())
            );
          }
        }
      });
    },
    registerMapJson(citycode, mapname) {
      if (citycode === "world" || citycode === "china") {
        configs.getmapjson("mapjson/" + citycode + ".json", (res) => {
          if (res.code == 0) {
            if (typeof res.data !== "string") {
              echarts.registerMap(mapname, res.data);
              this.loadOption(this.options);
            } else {
              echarts.registerMap(
                mapname,
                JSON.parse(res.data.replace(/[\r\n]/g, "").trim())
              );
              this.loadOption(this.options);
            }
          }
        });
      } else {
        debugger
        configs.getmapjson(
          "mapjson/geometryCouties/" + citycode + ".json",
          (res) => {
            if (res.code == 0) {
              if (typeof res.data !== "string") {
                echarts.registerMap(mapname, res.data);
                this.loadOption(this.options);
              } else {
                echarts.registerMap(
                  mapname,
                  JSON.parse(res.data.replace(/[\r\n]/g, "").trim())
                );
                this.loadOption(this.options);
              }
            }
          }
        );
      }
    },
    loadMapCity() {
      if (this.mapcity != null) {
        this.registerMapJson(this.mapcity[this.mapcity.length - 1], this.mapcode)
      }
    },
  },
  created() {
    this.$event.registerMapJson = this.registerMapJson;
    this.controlid =
      "div" + Date.parse(new Date()) + "_" + Math.ceil(Math.random() * 99999);
    if (echarts.getMap("china") === null) {
      this.loadMapJson("china");
    }
    if (echarts.getMap("world") === null) {
      this.loadMapJson("world");
    }
    this.ajaxget = commGetApi;
    this.ajaxpost = commPostApi;
    this.loadMapCity();
  },
  mounted() {
    this.$nextTick(() => {
      this.initChart();
    });
  },
  watch: {
    options(val) {
      if (this.mychart != null) {
        this.loadOption(val);
      }
    },
    mapcity: {
      handler() {
        if (this.mychart !== undefined) {
          this.loadMapCity()

        }
      }, deep: true
    }
  },
  beforeDestroy() {
    if (this.mychart) {
      this.mychart.dispose();
    }
  },
};
</script>
<style scoped>
.logmsg {
  color: red;
  font-size: 25px;
}
</style>
