/* eslint-disable */
// const apiUrl = "http://bg.kyform.cn:8086";
// const echartUrl = "http://f.kyform.cn";
const apiUrl = "http://211.101.232.227:802/bigapi/";
const echartUrl = "http://211.101.232.227:803/";
export default {
  apiUrl: apiUrl,
  echartUrl: echartUrl,
  echartWebUrl: "http://bg.kyform.cn/",
  getechartImg: (code) => {
    return echartUrl + "/echartdb/" + code + "/" + code + ".png";
  },
  getechartjson: (code, fun) => {
    window.$.get(echartUrl + "/echartdb/" + code + "/contex.json", function(
      geoJson
    ) {
      fun({ data: geoJson.jscode, code: 0 });
    });
  },
  getmapjson: (mapJsonPath, fun) => {
    window.$.get(
      echartUrl + "/echartdb/" + mapJsonPath.replace("\\", "/"),
      function(geoJson) {
        fun({ data: geoJson, code: 0 });
      }
    );
  },
  isDemo: true,
  // apiUrl: 'http://localhost:8086',
};
