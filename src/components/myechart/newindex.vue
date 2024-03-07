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
import * as echarts from 'echarts'
import tdTheme from './theme.json' // 引入默认主题
import 'echarts-gl'
import 'echarts-liquidfill/src/liquidFill.js' //在这里引入
import { commGetApi, commPostApi } from "@/views/api/index.js";
import elementResizeDetectorMaker from 'element-resize-detector'
import configs from '../../configs'
export default {
    props: ['options', 'mapcity', 'mapcode'],
    data() {
        return {
            mychart: undefined,
            controlid: '',
            optionconfig: {},
            isError: false,
            logmsg: '',
            ajaxget: null,
            ajaxpost: null,
        }
    },
    methods: {
        initChart() {
            // this.$echarts.registerTheme('tdTheme', tdTheme) // 覆盖默认主题
            this.mychart = echarts.init(
                document.getElementById(this.controlid),
                tdTheme
            )
            let app = {}
            this.$emit('loadoptions', this.mychart, echarts, app, this)
            if (this.options !== undefined && this.options !== null) {
                this.mychart.clear() // 每次重绘之前，先清除一下
                this.mychart.setOption(this.options, true)
            }
            const _this = this
            const erd = elementResizeDetectorMaker()
            erd.listenTo(document.getElementById(this.controlid), () => {
                _this.$nextTick(() => {
                    this.resize()
                })
            })
            // // 随着屏幕大小调节图表
            // document.getElementById(this.controlid).addEventListener('resize', () => {
            //   debugger;
            //   this.resize()
            // })
            this.$emit('initChartAfter')
            this.mychart.on("Click", param => {
                this.$emit("click", param);
            });
            this.mychart.getZr().on("click", params => {
                if (!params.target) {
                    this.$emit("zrclick", params);
                }
            });
        },
        resize() {
            this.mychart.resize()
        },
        getMychart() {
            return this.mychart
        },
        loadMapJson(mapname) {
            configs.getmapjson('mapjson/' + mapname + '.json', (res) => {
                if (res.code == 0) {
                    if (typeof res.data !== 'string') {
                        echarts.registerMap(mapname, res.data)
                    } else {
                        echarts.registerMap(
                            mapname,
                            JSON.parse(res.data.replace(/[\r\n]/g, '').trim())
                        )
                    }
                }
            })
        },
        loadOption(options) {
            if (options !== null) {
                this.mychart.setOption(options)
            } else {
                this.mychart.setOption({})
            }
        },
        loadMapCity() {
            if (this.mapcity != null) {
                let citys = this.mapcity.indexOf(",") >= 0 ? this.mapcity.split(",") : [this.mapcity]
                this.registerMapJson(citys[citys.length - 1], this.mapcode)
            }
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
    },
    created() {
        this.controlid =
            'div' +
            Date.parse(new Date()) +
            '_' +
            Math.ceil(Math.random() * 99999)
        if (echarts.getMap('china') === null) {
            this.loadMapJson('china')
        }
        if (echarts.getMap('world') === null) {
            this.loadMapJson('world')
        }
        this.ajaxget = commGetApi
        this.ajaxpost = commPostApi
        this.loadMapCity()
    },
    mounted() {
        this.$nextTick(() => {
            this.initChart()
        })
    },
    watch: {
        options: {
            handler(val) {
                if (this.mychart !== undefined) {
                    if (this.options !== undefined) {
                        this.mychart.setOption(val, true)
                    }
                }
            },
            deep: true
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
}
</script>
<style scoped>
.logmsg {
    color: red;
    font-size: 25px;
}
</style>
