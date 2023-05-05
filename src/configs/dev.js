// import { getechartdetail } from "@/views/api/echart.js"
const apiUrl = "http://bg.kyform.cn/prod-api"
const echartUrl = "http://f.kyform.cn"
export default {
    apiUrl: apiUrl,
    echartUrl: echartUrl,
    getechartImg: (code) => {
        return echartUrl + "/echartdb/" + code + "/" + code + ".png"
    },
    getechartjson: (code, fun) => {
        window.$.get(echartUrl + "/echartdb/" + code + "/contex.json", function (
            geoJson
        ) {
            fun({ data: geoJson.jscode, code: 0 })
        })
    },
    getmapjson: (mapJsonPath, fun) => {
        window.$.get(
            echartUrl + "/echartdb/" + mapJsonPath.replace("\\", "/"),
            function (geoJson) {
                fun({ data: geoJson, code: 0 })
            }
        )
    },
    // apiUrl: 'http://localhost:8086',
}
