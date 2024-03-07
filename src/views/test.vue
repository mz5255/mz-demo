<template>
    <div _tmplitem="22" class="dv-full-screen-container" :style="css">
        <div _tmplitem="22"
            :style="'position: absolute;width:1920px;height:1080px; background-image: url(' + bg + ') !important;background-size:cover;    background-repeat:no-repeat;'"
            class="div-full-screen">
            <div _tmplitem="22" class="bigitem" title="温度仪表盘"
                style="top: 444px; left: 18px; width: 543px; height: 286px; transform: translate(0px, 0px); z-index: 1021;">
                <div _tmplitem="22" class="itemcontent "
                    style="opacity:1;border-radius:0px;border-width:0px ;border-style:solid ;--animation:2s;--animation-flash:0.2s;transform:  rotateX(0deg) rotateY(0deg) rotateZ(0deg);">
                    <myechart _tmplitem="1" ref="sel170979521232111" :options="fromData.sel170979521232111">
                    </myechart>
                </div>
            </div>
            <div _tmplitem="22" class="bigitem" title="供回温度曲线"
                style="top: 95px; left: 1361px; width: 544px; height: 630px; transform: translate(0px, 0px); z-index: 1020;">
                <div _tmplitem="22" class="itemcontent "
                    style="opacity:1;border-radius:0px;border-width:0px ;border-style:solid ;--animation:2s;--animation-flash:0.2s;transform:  rotateX(0deg) rotateY(0deg) rotateZ(0deg);">
                    <myechart _tmplitem="2" ref="sel17097944633195" :options="fromData.sel17097944633195"></myechart>
                </div>
            </div>
            <div _tmplitem="22" class="bigitem" title="双y轴柱图"
                style="top: 756px; left: 23px; width: 533px; height: 304px; transform: translate(0px, 0px); z-index: 1019;">
                <div _tmplitem="22" class="itemcontent "
                    style="opacity:1;border-radius:0px;border-width:0px ;border-style:solid ;--animation:2s;--animation-flash:0.2s;transform:  rotateX(0deg) rotateY(0deg) rotateZ(0deg);">
                    <myechart _tmplitem="3" ref="sel170978902641357" :options="fromData.sel170978902641357">
                    </myechart>
                </div>
            </div>
            <div _tmplitem="22" class="bigitem" title="多线图"
                style="top: 755px; left: 1370px; width: 533px; height: 310px; transform: translate(0px, 0px); z-index: 1018;">
                <div _tmplitem="22" class="itemcontent "
                    style="opacity:1;border-radius:0px;border-width:0px ;border-style:solid ;--animation:2s;--animation-flash:0.2s;transform:  rotateX(0deg) rotateY(0deg) rotateZ(0deg);">
                    <myechart _tmplitem="4" ref="sel170977481111783" :options="fromData.sel170977481111783">
                    </myechart>
                </div>
            </div>
            <div _tmplitem="22" class="bigitem" title="散点图"
                style="top: 80px; left: 27px; width: 530px; height: 303px; transform: translate(0px, 0px); z-index: 1017;">
                <div _tmplitem="22" class="itemcontent "
                    style="opacity:1;border-radius:0px;border-width:0px ;border-style:solid ;--animation:2s;--animation-flash:0.2s;transform:  rotateX(0deg) rotateY(0deg) rotateZ(0deg);">
                    <myechart _tmplitem="5" ref="sel170977468542701" :options="fromData.sel170977468542701">
                    </myechart>
                </div>
            </div>
            <div _tmplitem="22" class="bigitem" title="热力图"
                style="top: 109px; left: 588px; width: 751px; height: 629px; transform: translate(0px, 0px); z-index: 1016;">
                <div _tmplitem="22" class="itemcontent "
                    style="opacity:1;border-radius:0px;border-width:0px ;border-style:solid ;--animation:2s;--animation-flash:0.2s;transform:  rotateX(0deg) rotateY(0deg) rotateZ(0deg);">
                    <myechart _tmplitem="6" ref="sel17097745459446" :options="fromData.sel17097745459446"></myechart>
                </div>
            </div>
            <div _tmplitem="22" class="bigitem" title="渐变折线、柱状图"
                style="top: 759px; left: 583px; width: 761px; height: 312px; transform: translate(0px, 0px); z-index: 1015;">
                <div _tmplitem="22" class="itemcontent "
                    style="opacity:1;border-radius:0px;border-width:0px ;border-style:solid ;--animation:2s;--animation-flash:0.2s;transform:  rotateX(0deg) rotateY(0deg) rotateZ(0deg);">
                    <myechart _tmplitem="7" ref="sel17093681435888" :options="fromData.sel17093681435888"></myechart>
                </div>
            </div>
            <div _tmplitem="22" class="bigitem" title="日期"
                style="top: 45px; left: 1632px; width: 243px; height: 40px; transform: translate(0px, 0px); z-index: 1014;">
                <div _tmplitem="22" class="itemcontent "
                    style="opacity:1;font-size:20px ;color:rgb(255, 255, 255) ;border-radius:0px;border-width:0px ;border-style:solid ;text-align:center;font-family:'Microsoft YaHei';--animation:2s;--animation-flash:0.2s;line-height:40px ;transform:  rotateX(0deg) rotateY(0deg) rotateZ(0deg);">
                    <comdatetime _tmplitem="8" ref="sel169124140557162" w="243" h="40" format="YYYY-MM-DD HH:mm:ss"
                        cssstyle="opacity:1;font-size:20px ;color:rgb(255, 255, 255) ;border-radius:0px;border-width:0px ;border-style:solid ;text-align:center;font-family:'Microsoft YaHei';--animation:2s;--animation-flash:0.2s;line-height:40px ;transform:  rotateX(0deg) rotateY(0deg) rotateZ(0deg);">
                    </comdatetime>
                </div>
            </div>
            <div _tmplitem="22" class="bigitem" title="跑马灯"
                style="top: 46px; left: 58px; width: 496px; height: 40px; transform: translate(0px, 0px); z-index: 1013;">
                <div _tmplitem="22" class="itemcontent "
                    style="opacity:1;font-size:14px ;color:rgb(255, 255, 255) ;border-radius:0px;border-width:0px ;border-style:solid ;font-family:'Microsoft YaHei';line-height:18px ;--animation:2s;--animation-flash:0.2s;transform:  rotateX(0deg) rotateY(0deg) rotateZ(0deg);">
                    <horseindex _tmplitem="9" ref="sel167826175649789" :w="496" :h="40"
                        :val="fromData.sel167826175649789"
                        cssstyle="opacity:1;font-size:14px ;color:rgb(255, 255, 255) ;border-radius:0px;border-width:0px ;border-style:solid ;font-family:'Microsoft YaHei';line-height:18px ;--animation:2s;--animation-flash:0.2s;transform:  rotateX(0deg) rotateY(0deg) rotateZ(0deg);"
                        @click="sel167826175649789_click()"></horseindex>
                </div>
            </div>
            <div _tmplitem="22" class="bigitem" title="通用标题"
                style="top: 21px; left: 814px; width: 300px; height: 38px; transform: translate(0px, 0px); z-index: 1012;">
                <div _tmplitem="22" class="itemcontent "
                    style="opacity:1;font-size:26px ;color:rgba(16, 209, 231, 1) ;border-radius:0px;border-width:0px ;border-style:solid ;line-height:40px ;text-align:center;font-family:'Microsoft YaHei';--animation:2s;--animation-flash:0.2s;transform:  rotateX(0deg) rotateY(0deg) rotateZ(0deg);">
                    <titlecontrol _tmplitem="10" ref="sel167283549375372" :w="300" :h="38"
                        :val="fromData.sel167283549375372"
                        cssstyle="opacity:1;font-size:26px ;color:rgba(16, 209, 231, 1) ;border-radius:0px;border-width:0px ;border-style:solid ;line-height:40px ;text-align:center;font-family:'Microsoft YaHei';--animation:2s;--animation-flash:0.2s;transform:  rotateX(0deg) rotateY(0deg) rotateZ(0deg);">
                    </titlecontrol>
                </div>
            </div>
            <div _tmplitem="22" class="bigitem" title="挂件10"
                style="top: -68px; left: 46px; width: 540px; height: 200px; transform: translate(0px, 0px); z-index: 1011;">
                <div _tmplitem="22" class="itemcontent "
                    style="opacity:1;transform:  rotateX(0deg) rotateY(0deg) rotateZ(0deg);">
                    <dv-decoration-10 style="width:540px;height:200px" :color="[]"></dv-decoration-10>
                </div>
            </div>
            <div _tmplitem="22" class="bigitem" title="挂件10"
                style="top: -68px; left: 1282px; width: 640px; height: 200px; transform: translate(0px, 0px); z-index: 1010;">
                <div _tmplitem="22" class="itemcontent "
                    style="opacity:1;transform:  rotateX(0deg) rotateY(0deg) rotateZ(0deg);">
                    <dv-decoration-10 style="width:640px;height:200px" :color="[]"></dv-decoration-10>
                </div>
            </div>
            <div _tmplitem="22" class="bigitem" title="边框12"
                style="top: 747px; left: 580px; width: 765px; height: 324px; transform: translate(0px, 0px); z-index: 109;">
                <div _tmplitem="22" class="itemcontent "
                    style="opacity:1;transform:  rotateX(0deg) rotateY(0deg) rotateZ(0deg);">
                    <dv-border-box-12 style="width:765px;height:324px" backgroundcolor=""
                        :color="[]"></dv-border-box-12>
                </div>
            </div>
            <div _tmplitem="22" class="bigitem" title="边框2"
                style="top: 105px; left: 580px; width: 765px; height: 640px; transform: translate(0px, 0px); z-index: 108;">
                <div _tmplitem="22" class="itemcontent "
                    style="opacity:1;background-color:transparent;transform:  rotateX(0deg) rotateY(0deg) rotateZ(0deg);">
                    <dv-border-box-2 style="width:765px;height:640px" backgroundcolor="" :color="[]"></dv-border-box-2>
                </div>
            </div>
            <div _tmplitem="22" class="bigitem" title="边框12"
                style="top: 411px; left: 15px; width: 550px; height: 320px; transform: translate(0px, 0px); z-index: 107;">
                <div _tmplitem="22" class="itemcontent "
                    style="opacity:1;transform:  rotateX(0deg) rotateY(0deg) rotateZ(0deg);">
                    <dv-border-box-12 style="width:550px;height:320px" backgroundcolor=""
                        :color="[]"></dv-border-box-12>
                </div>
            </div>
            <div _tmplitem="22" class="bigitem" title="挂件5"
                style="top: 10px; left: 574px; width: 765px; height: 110px; transform: translate(0px, 0px); z-index: 106;">
                <div _tmplitem="22" class="itemcontent "
                    style="opacity:1;transform:  rotateX(0deg) rotateY(0deg) rotateZ(0deg);">
                    <dv-decoration-5 style="width:765px;height:110px" :color="[]"></dv-decoration-5>
                </div>
            </div>
            <div _tmplitem="22" class="bigitem" title="挂件10"
                style="top: -68px; left: 46px; width: 540px; height: 200px; transform: translate(0px, 0px); z-index: 105;">
                <div _tmplitem="22" class="itemcontent "
                    style="opacity:1;transform:  rotateX(0deg) rotateY(0deg) rotateZ(0deg);">
                    <dv-decoration-10 style="width:540px;height:200px" :color="[]"></dv-decoration-10>
                </div>
            </div>
            <div _tmplitem="22" class="bigitem" title="边框12"
                style="top: 87px; left: 1360px; width: 544px; height: 648px; transform: translate(0px, 0px); z-index: 104;">
                <div _tmplitem="22" class="itemcontent "
                    style="opacity:1;transform:  rotateX(0deg) rotateY(0deg) rotateZ(0deg);">
                    <dv-border-box-12 style="width:544px;height:648px" backgroundcolor=""
                        :color="[]"></dv-border-box-12>
                </div>
            </div>
            <div _tmplitem="22" class="bigitem" title="边框12"
                style="top: 72px; left: 17px; width: 550px; height: 320px; transform: translate(0px, 0px); z-index: 103;">
                <div _tmplitem="22" class="itemcontent "
                    style="opacity:1;transform:  rotateX(0deg) rotateY(0deg) rotateZ(0deg);">
                    <dv-border-box-12 style="width:550px;height:320px" backgroundcolor=""
                        :color="[]"></dv-border-box-12>
                </div>
            </div>
            <div _tmplitem="22" class="bigitem" title="边框12"
                style="top: 748px; left: 14px; width: 550px; height: 320px; transform: translate(0px, 0px); z-index: 102;">
                <div _tmplitem="22" class="itemcontent "
                    style="opacity:1;transform:  rotateX(0deg) rotateY(0deg) rotateZ(0deg);">
                    <dv-border-box-12 style="width:550px;height:320px" backgroundcolor=""
                        :color="[]"></dv-border-box-12>
                </div>
            </div>
            <div _tmplitem="22" class="bigitem" title="边框12"
                style="top: 747px; left: 1360px; width: 550px; height: 327px; transform: translate(0px, 0px); z-index: 101;">
                <div _tmplitem="22" class="itemcontent "
                    style="opacity:1;transform:  rotateX(0deg) rotateY(0deg) rotateZ(0deg);">
                    <dv-border-box-12 style="width:550px;height:327px" backgroundcolor=""
                        :color="[]"></dv-border-box-12>
                </div>
            </div>
        </div>
        <fromdialog _tmplitem="22" ref="reffromdialog"></fromdialog>
    </div>
</template>
<script>
import myechart from '@/components/myechart/newindex.vue'
import horseindex from '@/components/horseindex.vue'
import titlecontrol from '@/components/titlecontrol.vue'
export default {
    data() {
        return {
            echartWebUrl: "http://bg.kyform.cn/",
            "w": 1920,
            "css": "",
            "h": 1080,
            "bg": this.echartWebUrl + "/temp/5ffa560b6145e930184c675bb497c00d.png",
            "bgColor": "rgba(13, 42, 67)",
            "fromData": {
                "sel170979521232111": {
                    "series": [{
                        "name": "指标",
                        "type": "gauge",
                        "detail": {
                            "formatter": "{value}℃ 舒适",
                            "color": "#222222"
                        },
                        "axisLine": {
                            "lineStyle": {
                                "width": 24,
                                "color": [
                                    [0.45, "#2e95f7"],
                                    [0.6, "#5abf39"],
                                    [1, "#f6aa3f"]
                                ]
                            },
                            "show": true
                        },
                        "axisTick": {
                            "show": false,
                            "splitNumber": 4
                        },
                        "axisLabel": {
                            "show": true,
                            "distance": 12
                        },
                        "splitLine": {
                            "show": true,
                            "length": 40,
                            "lineStyle": {
                                "color": "auto"
                            }
                        },
                        "pointer": {
                            "show": true,
                            "length": "50%",
                            "width": "10"
                        },
                        "itemStyle": {
                            "color": "#17324d"
                        },
                        "radius": "100%",
                        "startAngle": 185,
                        "endAngle": -5,
                        "min": 0,
                        "max": 40,
                        "animation": true,
                        "data": [{
                            "value": 30
                        }]
                    }, {
                        "name": "小圆形",
                        "type": "pie",
                        "hoverAnimation": false,
                        "legendHoverLink": false,
                        "tooltip": {
                            "show": false
                        },
                        "center": ["50%", "50%"],
                        "radius": ["3%"],
                        "z": 20,
                        "label": {
                            "normal": {
                                "show": false,
                                "position": "center"
                            },
                            "emphasis": {
                                "show": false
                            }
                        },
                        "labelLine": {
                            "normal": {
                                "show": false
                            }
                        },
                        "animation": false,
                        "data": [{
                            "value": 0,
                            "name": "1",
                            "itemStyle": {
                                "normal": {
                                    "color": "red"
                                }
                            }
                        }, {
                            "value": 100,
                            "name": "2",
                            "itemStyle": {
                                "normal": {
                                    "color": "#17324d"
                                }
                            }
                        }]
                    }]
                },
                "sel17097944633195": {
                    "title": {
                        "text": "",
                        "x": "center",
                        "y": 0,
                        "textStyle": {
                            "color": "#B4B4B4",
                            "fontSize": 16,
                            "fontWeight": "normal"
                        }
                    },
                    "tooltip": {
                        "trigger": "axis",
                        "backgroundColor": "rgba(0,0,0,0.6)"
                    },
                    "legend": {
                        "itemHeight": 5,
                        "itemWidth": 24,
                        "data": [{
                            "name": "供温",
                            "icon": "rect"
                        }, {
                            "name": "回温",
                            "icon": "rect"
                        }, {
                            "name": "压力值(Mpa)",
                            "icon": "rect"
                        }],
                        "textStyle": {
                            "color": "#B4B4B4"
                        },
                        "top": "7%",
                        "selected": {
                            "回温": false
                        }
                    },
                    "grid": {
                        "x": "8%",
                        "width": "82%",
                        "y": "12%"
                    },
                    "xAxis": [{
                        "data": ["1km", "2km", "3km", "4km", "5km", "6km"],
                        "boundaryGap": true,
                        "axisLine": {
                            "lineStyle": {
                                "color": "#B4B4B4"
                            }
                        },
                        "axisTick": {
                            "show": false
                        }
                    }],
                    "yAxis": [{
                        "name": "供回温度(℃）",
                        "nameLocation": "middle",
                        "nameTextStyle": {
                            "padding": [3, 4, 50, 6]
                        },
                        "splitLine": {
                            "show": true,
                            "lineStyle": {
                                "type": "dashed",
                                "color": "#eee"
                            }
                        },
                        "axisLine": {
                            "show": false
                        },
                        "axisTick": {
                            "show": false
                        },
                        "axisLabel": {
                            "textStyle": {
                                "color": "#333"
                            },
                            "formatter": "{value} "
                        }
                    }, {
                        "name": "压力值(Mpa)",
                        "nameLocation": "middle",
                        "nameTextStyle": {
                            "padding": [50, 4, 5, 6]
                        },
                        "splitLine": {
                            "show": false
                        },
                        "axisLine": {
                            "show": false
                        },
                        "axisTick": {
                            "show": false
                        },
                        "axisLabel": {
                            "textStyle": {
                                "color": "#333"
                            },
                            "formatter": "{value} "
                        }
                    }],
                    "series": [{
                        "name": "供温",
                        "type": "line",
                        "smooth": true,
                        "showSymbol": true,
                        "symbol": "path://M150 0 L80 175 L250 75 L50 75 L220 175 Z",
                        "symbolSize": 12,
                        "yAxisIndex": 0,
                        "areaStyle": {
                            "normal": {
                                "color": {
                                    "colorStops": [{
                                        "offset": 0,
                                        "color": "rgba(250,180,101,0.3)"
                                    }, {
                                        "offset": 1,
                                        "color": "rgba(250,180,101,0)"
                                    }],
                                    "x": 0,
                                    "y": 0,
                                    "x2": 0,
                                    "y2": 1,
                                    "type": "linear",
                                    "global": false
                                },
                                "shadowColor": "rgba(250,180,101,0.2)",
                                "shadowBlur": 20
                            }
                        },
                        "itemStyle": {
                            "normal": {
                                "color": "#FF8000"
                            }
                        },
                        "data": [{
                            "value": 1,
                            "stationName": "s1"
                        }, {
                            "value": 3,
                            "stationName": "s2"
                        }, {
                            "value": 4,
                            "stationName": "s3"
                        }, {
                            "value": 9,
                            "stationName": "s4"
                        }, {
                            "value": 3,
                            "stationName": "s5"
                        }, {
                            "value": 2,
                            "stationName": "s6"
                        }]
                    }, {
                        "name": "回温",
                        "type": "line",
                        "smooth": true,
                        "showSymbol": true,
                        "symbol": "emptyCircle",
                        "symbolSize": 12,
                        "yAxisIndex": 0,
                        "areaStyle": {
                            "normal": {
                                "color": {
                                    "colorStops": [{
                                        "offset": 0,
                                        "color": "rgba(199, 237, 250,0.5)"
                                    }, {
                                        "offset": 1,
                                        "color": "rgba(199, 237, 250,0.2)"
                                    }],
                                    "x": 0,
                                    "y": 0,
                                    "x2": 0,
                                    "y2": 1,
                                    "type": "linear",
                                    "global": false
                                }
                            }
                        },
                        "itemStyle": {
                            "normal": {
                                "color": "#3bbc86"
                            }
                        },
                        "data": [{
                            "value": 31,
                            "stationName": "s1"
                        }, {
                            "value": 36,
                            "stationName": "s2"
                        }, {
                            "value": 54,
                            "stationName": "s3"
                        }, {
                            "value": 89,
                            "stationName": "s4"
                        }, {
                            "value": 73,
                            "stationName": "s5"
                        }, {
                            "value": 22,
                            "stationName": "s6"
                        }]
                    }, {
                        "name": "压力值(Mpa)",
                        "type": "bar",
                        "barWidth": 30,
                        "yAxisIndex": 1,
                        "itemStyle": {
                            "normal": {
                                "color": {
                                    "colorStops": [{
                                        "offset": 0,
                                        "color": "rgba(108,80,243,0.3)"
                                    }, {
                                        "offset": 1,
                                        "color": "rgba(108,80,243,0)"
                                    }],
                                    "x": 0,
                                    "y": 0,
                                    "x2": 0,
                                    "y2": 1,
                                    "type": "linear",
                                    "global": false
                                },
                                "barBorderRadius": [30, 30, 0, 0]
                            }
                        },
                        "data": [{
                            "value": 11,
                            "stationName": "s1"
                        }, {
                            "value": 34,
                            "stationName": "s2"
                        }, {
                            "value": 54,
                            "stationName": "s3"
                        }, {
                            "value": 39,
                            "stationName": "s4"
                        }, {
                            "value": 63,
                            "stationName": "s5"
                        }, {
                            "value": 24,
                            "stationName": "s6"
                        }]
                    }]
                },
                "sel170978902641357": {
                    "grid": {
                        "left": "5%",
                        "right": "5%",
                        "bottom": "5%",
                        "top": "10%",
                        "containLabel": true
                    },
                    "tooltip": {
                        "trigger": "axis",
                        "axisPointer": {
                            "type": "none"
                        }
                    },
                    "backgroundColor": "rgb(20,28,52)",
                    "xAxis": {
                        "show": false,
                        "type": "value"
                    },
                    "yAxis": [{
                        "type": "category",
                        "inverse": true,
                        "axisLabel": {
                            "show": true,
                            "textStyle": {
                                "color": "#fff"
                            }
                        },
                        "splitLine": {
                            "show": false
                        },
                        "axisTick": {
                            "show": false
                        },
                        "axisLine": {
                            "show": false
                        },
                        "data": ["大米", "玉米", "蔬菜", "鸡蛋", "坚果"]
                    }, {
                        "type": "category",
                        "inverse": true,
                        "axisTick": "none",
                        "axisLine": "none",
                        "show": true,
                        "axisLabel": {
                            "textStyle": {
                                "color": "#ffffff",
                                "fontSize": "12"
                            }
                        },
                        "data": [50000000, 22000000, 10000000, 5000000, 1]
                    }],
                    "series": [{
                        "name": "金额",
                        "type": "bar",
                        "zlevel": 1,
                        "itemStyle": {
                            "normal": {
                                "barBorderRadius": 30,
                                "color": {
                                    "colorStops": [{
                                        "offset": 0,
                                        "color": "rgb(57,89,255,1)"
                                    }, {
                                        "offset": 1,
                                        "color": "rgb(46,200,207,1)"
                                    }],
                                    "x": 0,
                                    "y": 0,
                                    "x2": 1,
                                    "y2": 0,
                                    "type": "linear",
                                    "global": false
                                }
                            }
                        },
                        "barWidth": 20,
                        "data": [50000000, 22000000, 10000000, 5000000, 1]
                    }, {
                        "name": "背景",
                        "type": "bar",
                        "barWidth": 20,
                        "barGap": "-100%",
                        "data": [50000000, 50000000, 50000000, 50000000, 1],
                        "itemStyle": {
                            "normal": {
                                "color": "rgba(24,31,68,1)",
                                "barBorderRadius": 30
                            }
                        }
                    }]
                },
                "sel170977481111783": {
                    "backgroundColor": "#080b30",
                    "title": {
                        "text": "多线图",
                        "textStyle": {
                            "align": "center",
                            "color": "#fff",
                            "fontSize": 20
                        },
                        "top": "5%",
                        "left": "center"
                    },
                    "tooltip": {
                        "trigger": "axis",
                        "axisPointer": {
                            "lineStyle": {
                                "color": {
                                    "type": "linear",
                                    "x": 0,
                                    "y": 0,
                                    "x2": 0,
                                    "y2": 1,
                                    "colorStops": [{
                                        "offset": 0,
                                        "color": "rgba(0, 255, 233,0)"
                                    }, {
                                        "offset": 0.5,
                                        "color": "rgba(255, 255, 255,1)"
                                    }, {
                                        "offset": 1,
                                        "color": "rgba(0, 255, 233,0)"
                                    }],
                                    "global": false
                                }
                            }
                        }
                    },
                    "grid": {
                        "top": "15%",
                        "left": "5%",
                        "right": "5%",
                        "bottom": "15%"
                    },
                    "xAxis": [{
                        "type": "category",
                        "axisLine": {
                            "show": true
                        },
                        "splitArea": {
                            "color": "#f00",
                            "lineStyle": {
                                "color": "#f00"
                            }
                        },
                        "axisLabel": {
                            "color": "#fff"
                        },
                        "splitLine": {
                            "show": false
                        },
                        "boundaryGap": false,
                        "data": ["A", "B", "C", "D", "E", "F"]
                    }],
                    "yAxis": [{
                        "type": "value",
                        "min": 0,
                        "splitNumber": 4,
                        "splitLine": {
                            "show": true,
                            "lineStyle": {
                                "color": "rgba(255,255,255,0.1)"
                            }
                        },
                        "axisLine": {
                            "show": false
                        },
                        "axisLabel": {
                            "show": false,
                            "margin": 20,
                            "textStyle": {
                                "color": "#d1e6eb"
                            }
                        },
                        "axisTick": {
                            "show": false
                        }
                    }],
                    "series": [{
                        "name": "注册总量",
                        "type": "line",
                        "smooth": true,
                        "showAllSymbol": true,
                        "symbol": "circle",
                        "symbolSize": 15,
                        "lineStyle": {
                            "normal": {
                                "color": "#00b3f4",
                                "shadowColor": "rgba(0, 0, 0, .3)",
                                "shadowBlur": 0,
                                "shadowOffsetY": 5,
                                "shadowOffsetX": 5
                            }
                        },
                        "label": {
                            "show": true,
                            "position": "top",
                            "textStyle": {
                                "color": "#00b3f4"
                            }
                        },
                        "itemStyle": {
                            "color": "#00b3f4",
                            "borderColor": "#fff",
                            "borderWidth": 3,
                            "shadowColor": "rgba(0, 0, 0, .3)",
                            "shadowBlur": 0,
                            "shadowOffsetY": 2,
                            "shadowOffsetX": 2
                        },
                        "tooltip": {
                            "show": false
                        },
                        "areaStyle": {
                            "normal": {
                                "color": {
                                    "colorStops": [{
                                        "offset": 0,
                                        "color": "rgba(0,179,244,0.3)"
                                    }, {
                                        "offset": 1,
                                        "color": "rgba(0,179,244,0)"
                                    }],
                                    "x": 0,
                                    "y": 0,
                                    "x2": 0,
                                    "y2": 1,
                                    "type": "linear",
                                    "global": false
                                },
                                "shadowColor": "rgba(0,179,244, 0.9)",
                                "shadowBlur": 20
                            }
                        },
                        "data": [502.84, 205.97, 332.79, 281.55, 398.35, 214.02]
                    }, {
                        "name": "注册总量",
                        "type": "line",
                        "smooth": true,
                        "showAllSymbol": true,
                        "symbol": "circle",
                        "symbolSize": 15,
                        "lineStyle": {
                            "normal": {
                                "color": "#00ca95",
                                "shadowColor": "rgba(0, 0, 0, .3)",
                                "shadowBlur": 0,
                                "shadowOffsetY": 5,
                                "shadowOffsetX": 5
                            }
                        },
                        "label": {
                            "show": true,
                            "position": "top",
                            "textStyle": {
                                "color": "#00ca95"
                            }
                        },
                        "itemStyle": {
                            "color": "#00ca95",
                            "borderColor": "#fff",
                            "borderWidth": 3,
                            "shadowColor": "rgba(0, 0, 0, .3)",
                            "shadowBlur": 0,
                            "shadowOffsetY": 2,
                            "shadowOffsetX": 2
                        },
                        "tooltip": {
                            "show": false
                        },
                        "areaStyle": {
                            "normal": {
                                "color": {
                                    "colorStops": [{
                                        "offset": 0,
                                        "color": "rgba(0,202,149,0.3)"
                                    }, {
                                        "offset": 1,
                                        "color": "rgba(0,202,149,0)"
                                    }],
                                    "x": 0,
                                    "y": 0,
                                    "x2": 0,
                                    "y2": 1,
                                    "type": "linear",
                                    "global": false
                                },
                                "shadowColor": "rgba(0,202,149, 0.9)",
                                "shadowBlur": 20
                            }
                        },
                        "data": [281.55, 398.35, 214.02, 179.55, 289.57, 356.14]
                    }]
                },
                "sel170977468542701": {
                    "color": ["#e8b828", "#1c95b4"],
                    "backgroundColor": "#031f2d",
                    "legend": {
                        "orient": "horizontal",
                        "right": "9%",
                        "y": "top",
                        "itemWidth": 15,
                        "itemHeight": 15,
                        "itemGap": 40,
                        "icon": "roundRect",
                        "selectedMode": true,
                        "textStyle": {
                            "color": "#fff",
                            "fontSize": 13
                        },
                        "data": ["公立", "民办"]
                    },
                    "grid": {
                        "left": "5%",
                        "right": "5%",
                        "bottom": "5%",
                        "containLabel": true
                    },
                    "xAxis": {
                        "axisLabel": {
                            "textStyle": {
                                "color": "#189cbb",
                                "fontSize": 13
                            }
                        },
                        "axisTick": {
                            "lineStyle": {
                                "color": "#189cbb"
                            }
                        },
                        "axisLine": {
                            "lineStyle": {
                                "color": "#189cbb"
                            }
                        },
                        "splitLine": {
                            "lineStyle": {
                                "color": "rgba(80,224,255,0.3)",
                                "type": "dashed"
                            }
                        }
                    },
                    "yAxis": {
                        "axisLabel": {
                            "textStyle": {
                                "color": "#189cbb",
                                "fontSize": 13
                            }
                        },
                        "axisTick": {
                            "lineStyle": {
                                "color": "#189cbb"
                            }
                        },
                        "axisLine": {
                            "lineStyle": {
                                "color": "#189cbb"
                            }
                        },
                        "splitLine": {
                            "lineStyle": {
                                "color": "rgba(80,224,255,0.3)",
                                "type": "dashed"
                            }
                        },
                        "name": "通过率(%)",
                        "nameTextStyle": {
                            "color": "#189cbb",
                            "fontSize": 13,
                            "padding": [0, 0, 20, 0]
                        }
                    },
                    "visualMap": {
                        "show": false,
                        "max": 100,
                        "inRange": {
                            "symbolSize": [14, 14]
                        }
                    },
                    "series": [{
                        "name": "公立",
                        "type": "scatter",
                        "data": [
                            [62, 13, 10],
                            [75, 27, 20],
                            [10, 18, 8],
                            [20, 71, 13],
                            [26, 52, 39],
                            [88, 28, 36],
                            [71, 70, 30],
                            [9, 55, 18],
                            [17, 15, 30],
                            [37, 32, 10],
                            [78, 80, 26],
                            [56, 0, 22],
                            [61, 53, 14],
                            [14, 60, 20],
                            [81, 14, 4]
                        ],
                        "symbolSize": 20
                    }, {
                        "name": "民办",
                        "type": "scatter",
                        "data": [
                            [32, 3, 31],
                            [57, 89, 85],
                            [40, 68, 2],
                            [10, 27, 65],
                            [83, 91, 9],
                            [6, 30, 41],
                            [96, 17, 64],
                            [89, 52, 100],
                            [55, 39, 100],
                            [81, 80, 55],
                            [95, 75, 60],
                            [57, 53, 92],
                            [78, 8, 8],
                            [72, 44, 36],
                            [34, 48, 82]
                        ],
                        "symbolSize": 30
                    }],
                    "animationEasing": "elasticOut"
                },
                "sel17097745459446": {
                    "title": {
                        "text": "热力图",
                        "subtext": "",
                        "sublink": "http://www.pm25.in",
                        "left": "center",
                        "textStyle": {
                            "color": "#fff"
                        }
                    },
                    "backgroundColor": "#404a59",
                    "visualMap": {
                        "min": 0,
                        "max": 500,
                        "splitNumber": 5,
                        "inRange": {
                            "color": ["#50a3ba", "#eac736", "#d94e5d"]
                        },
                        "textStyle": {
                            "color": "#fff"
                        }
                    },
                    "geo": {
                        "map": "china",
                        "label": {
                            "emphasis": {
                                "show": false
                            }
                        },
                        "roam": true,
                        "itemStyle": {
                            "normal": {
                                "areaColor": "#323c48",
                                "borderColor": "#111"
                            },
                            "emphasis": {
                                "areaColor": "#2a333d"
                            }
                        }
                    },
                    "series": [{
                        "name": "AQI",
                        "type": "heatmap",
                        "coordinateSystem": "geo",
                        "data": [
                            [121.15, 31.89, 100],
                            [109.781327, 39.608266, 112],
                            [120.38, 37.35, 112],
                            [122.207216, 29.985295, 112],
                            [123.97, 47.33, 114],
                            [120.13, 33.38, 100],
                            [118.87, 42.28, 16],
                            [120.33, 36.07, 450],
                            [121.52, 36.89, 118],
                            [102.188043, 38.520089, 119],
                            [118.58, 24.93, 21],
                            [120.53, 36.86, 300],
                            [119.46, 35.42, 121],
                            [119.97, 35.88, 125],
                            [121.05, 32.08, 23],
                            [91.11, 29.97, 321],
                            [112.02, 22.93, 444],
                            [116.1, 24.55, 25],
                            [122.05, 37.2, 456],
                            [121.48, 31.22, 125],
                            [101.718637, 26.582347, 125],
                            [122.1, 37.5, 25],
                            [117.93, 40.97, 25],
                            [118.1, 24.46, 126],
                            [115.375279, 22.786211, 26],
                            [116.63, 23.68, 247],
                            [124.37, 40.13, 227],
                            [121.1, 31.45, 427],
                            [103.79, 25.51, 327],
                            [121.39, 37.52, 28],
                            [119.3, 26.08, 29],
                            [121.979603, 39.627114, 30],
                            [120.45, 36.38, 30],
                            [123.97, 41.97, 31],
                            [102.52, 24.35, 31],
                            [114.87, 40.82, 31],
                            [113.57, 37.85, 31],
                            [119.942327, 37.177017, 32],
                            [120.1, 30.86, 32],
                            [116.69, 23.39, 32],
                            [120.95, 31.39, 33],
                            [121.56, 29.86, 33],
                            [110.359377, 21.270708, 33],
                            [116.35, 23.55, 34],
                            [122.41, 37.16, 34],
                            [119.16, 34.59, 35],
                            [120.836932, 40.711052, 35],
                            [120.74, 31.64, 236],
                            [113.75, 23.04, 336],
                            [114.68, 23.73, 36],
                            [119.15, 33.5, 436],
                            [119.9, 32.49, 236],
                            [108.33, 22.84, 437],
                            [122.18, 40.65, 37],
                            [114.4, 23.09, 337],
                            [120.26, 31.91, 37],
                            [120.75, 37.8, 37],
                            [113.62, 24.84, 38],
                            [98.289152, 39.77313, 38],
                            [113.23, 23.16, 138],
                            [109.47, 36.6, 138],
                            [112.53, 37.87, 139],
                            [113.01, 23.7, 139],
                            [113.38, 22.52, 139],
                            [102.73, 25.04, 139],
                            [118.73, 36.86, 440],
                            [122.070714, 41.119997, 40],
                            [113.08, 36.18, 41],
                            [114.07, 22.62, 41],
                            [113.52, 22.3, 42],
                            [118.3, 33.96, 43],
                            [108.72, 34.36, 43],
                            [109.11, 35.09, 44],
                            [119.97, 36.77, 44],
                            [113.11, 23.05, 44],
                            [110.35, 20.02, 44],
                            [113.06, 22.61, 45],
                            [117.53, 36.72, 45],
                            [112.44, 23.05, 46],
                            [121.62, 38.92, 47],
                            [111.5, 36.08, 47],
                            [120.63, 31.16, 47],
                            [106.39, 39.04, 49],
                            [123.38, 41.8, 50],
                            [120.62, 31.32, 50],
                            [110.88, 21.68, 50],
                            [120.76, 30.77, 51],
                            [125.35, 43.88, 51],
                            [120.03336, 36.264622, 52],
                            [106.27, 38.47, 52],
                            [120.555821, 31.875428, 52],
                            [111.19, 34.76, 53],
                            [121.15, 41.13, 154],
                            [115.89, 28.68, 154],
                            [109.4, 24.33, 154],
                            [109.511909, 18.252847, 154],
                            [104.778442, 29.33903, 156],
                            [126.57, 43.87, 156],
                            [111.95, 21.85, 257],
                            [105.39, 28.91, 157],
                            [101.74, 36.56, 157],
                            [104.56, 29.77, 258],
                            [111.65, 40.82, 58],
                            [104.06, 30.67, 58],
                            [113.3, 40.12, 58],
                            [119.44, 32.2, 59],
                            [110.28, 25.29, 59],
                            [110.479191, 29.117096, 59],
                            [119.82, 31.36, 59],
                            [109.12, 21.49, 60],
                            [108.95, 34.27, 61],
                            [119.56, 31.74, 62],
                            [118.49, 37.46, 62],
                            [129.58, 44.6, 63],
                            [106.9, 27.7, 63],
                            [120.58, 30.01, 63],
                            [119.42, 32.39, 64],
                            [119.95, 31.79, 64],
                            [119.1, 36.62, 65],
                            [106.54, 29.59, 66],
                            [121.420757, 28.656386, 67],
                            [118.78, 32.04, 67],
                            [118.03, 37.36, 70],
                            [106.71, 26.57, 71],
                            [120.29, 31.59, 71],
                            [123.73, 41.3, 71],
                            [84.77, 45.59, 72],
                            [109.5, 34.52, 72],
                            [118.48, 31.56, 72],
                            [107.15, 34.38, 72],
                            [113.21, 35.24, 75],
                            [119.16, 31.95, 75],
                            [116.46, 39.92, 79],
                            [117.2, 34.26, 79],
                            [115.72, 37.72, 80],
                            [110, 40.58, 80],
                            [104.73, 31.48, 80],
                            [87.68, 43.77, 84],
                            [117.57, 34.86, 84],
                            [120.19, 30.26, 84],
                            [118.05, 36.78, 85],
                            [122.85, 41.12, 86],
                            [119.48, 31.43, 86],
                            [86.06, 41.68, 86],
                            [114.35, 36.1, 190],
                            [114.35, 34.79, 390],
                            [117, 36.65, 292],
                            [104.37, 31.13, 393],
                            [120.65, 28.01, 95],
                            [115.97, 29.71, 96],
                            [114.47, 36.6, 98],
                            [119.72, 30.23, 99],
                            [103.73, 36.03, 99],
                            [116.83, 38.33, 100],
                            [118.35, 35.05, 103],
                            [106.110698, 30.837793, 104],
                            [117.2, 39.13, 105],
                            [119.95, 30.07, 106],
                            [117.13, 36.18, 112],
                            [120.23, 29.71, 112],
                            [113.65, 34.76, 113],
                            [126.63, 45.75, 114],
                            [115.97, 36.45, 116],
                            [118.38, 31.33, 117],
                            [118.02, 39.63, 119],
                            [113.29, 33.75, 119],
                            [114.48, 37.05, 119],
                            [116.29, 37.45, 120],
                            [116.59, 35.38, 120],
                            [112.239741, 30.335165, 127],
                            [111.3, 30.7, 130],
                            [120.06, 29.32, 132],
                            [119.92, 28.45, 133],
                            [112.44, 34.7, 134],
                            [119.57, 39.95, 136],
                            [113.16, 27.83, 143],
                            [114.48, 38.03, 147],
                            [117.67, 36.19, 148],
                            [111.69, 29.05, 152],
                            [115.48, 38.85, 153],
                            [112.91, 27.87, 154],
                            [119.64, 29.12, 157],
                            [113.09, 29.37, 169],
                            [113, 28.21, 175],
                            [118.88, 28.97, 177],
                            [116.7, 39.53, 193],
                            [115.480656, 35.23375, 194],
                            [117.27, 31.86, 229],
                            [114.31, 30.52, 273],
                            [125.03, 46.58, 279]
                        ]
                    }]
                },
                "sel17093681435888": {
                    "tooltip": {},
                    "grid": {
                        "top": "8%",
                        "left": "1%",
                        "right": "1%",
                        "bottom": "8%",
                        "containLabel": true
                    },
                    "title": {
                        "text": "2023下半年-2024上半年客户新增数量",
                        "textStyle": {
                            "fontSize": 14,
                            "fontWeight": 400,
                            "color": "#fff"
                        },
                        "left": "center",
                        "top": "5%"
                    },
                    "legend": {
                        "icon": "circle",
                        "top": "5%",
                        "left": "5%",
                        "itemWidth": 6,
                        "itemGap": 20,
                        "textStyle": {
                            "color": "#fff"
                        }
                    },
                    "xAxis": [{
                        "type": "category",
                        "boundaryGap": true,
                        "axisLine": {
                            "show": true,
                            "lineStyle": {
                                "color": "#f9f9f9"
                            }
                        },
                        "axisLabel": {
                            "textStyle": {
                                "color": "#d1e6eb",
                                "margin": 15
                            }
                        },
                        "axisTick": {
                            "show": false
                        },
                        "data": ["2023年9月", "2023年10月", "2023年11月", "2023年12月", "2024年1月", "2024年2月", "2024年3月"]
                    }],
                    "yAxis": [{
                        "type": "value",
                        "min": 0,
                        "splitNumber": 7,
                        "splitLine": {
                            "show": true,
                            "lineStyle": {
                                "color": "#0a3256"
                            }
                        },
                        "axisLine": {
                            "show": false
                        },
                        "axisLabel": {
                            "margin": 20,
                            "textStyle": {
                                "color": "#d1e6eb"
                            }
                        },
                        "axisTick": {
                            "show": false
                        }
                    }],
                    "series": [{
                        "name": "注册总量",
                        "type": "line",
                        "showAllSymbol": true,
                        "symbol": "emptyCircle",
                        "symbolSize": 6,
                        "lineStyle": {
                            "normal": {
                                "color": "#28ffb3"
                            },
                            "borderColor": "#f0f"
                        },
                        "label": {
                            "show": true,
                            "position": "top",
                            "textStyle": {
                                "color": "#fff"
                            }
                        },
                        "itemStyle": {
                            "normal": {
                                "color": "#28ffb3"
                            }
                        },
                        "tooltip": {
                            "show": false
                        },
                        "areaStyle": {
                            "normal": {
                                "color": {
                                    "colorStops": [{
                                        "offset": 0,
                                        "color": "rgba(0,154,120,1)"
                                    }, {
                                        "offset": 1,
                                        "color": "rgba(0,0,0, 0)"
                                    }],
                                    "x": 0,
                                    "y": 0,
                                    "x2": 0,
                                    "y2": 1,
                                    "type": "linear",
                                    "global": false
                                },
                                "shadowColor": "rgba(53,142,215, 0.9)",
                                "shadowBlur": 20
                            }
                        },
                        "data": [393, 438, 485, 631, 689, 824, 987]
                    }, {
                        "name": "最新注册量",
                        "type": "bar",
                        "barWidth": 20,
                        "tooltip": {
                            "show": false
                        },
                        "label": {
                            "show": true,
                            "position": "top",
                            "textStyle": {
                                "color": "#fff"
                            }
                        },
                        "itemStyle": {
                            "normal": {}
                        },
                        "data": [200, 382, 102, 267, 186, 315, 316]
                    }]
                },
                "sel167826175649789": "公告：三维铁沟",
                "sel167283549375372": "智慧炼钢"
            },
            "controlTimer": {},
            "controlData": {},
            "screentype": "w",
            "readDataPermission": {
                "sel170979521232111": true,
                "sel17097944633195": true,
                "sel170978902641357": true,
                "sel170977481111783": true,
                "sel170977468542701": true,
                "sel17097745459446": true,
                "sel17093681435888": true,
                "sel169124140557162": true,
                "sel167826175649789": true,
                "sel167283549375372": true,
                "sel167283541839800": true,
                "sel167283545441970": true,
                "sel167283534958280": true,
                "sel167283533018962": true,
                "sel167283547689923": true,
                "sel16728352765660": true,
                "sel170927189560003": true,
                "sel170977384929504": true,
                "sel170977387122984": true,
                "sel170977405488833": true,
                "sel170977414967537": true
            }
        }
    },
    methods: {
        // [undefinedloadfunmounted]事件方法 
        loadfunmounted() { },
        created_sys() {
            ///系统方法 判断页面大小 使其自动适应
            let $this = this;
            this.w = this.w === undefined ? 1920 : this.w;
            $this.css = $this.fullScreenCss($this, this.screentype);

            window.addEventListener("resize", () => {
                $this.css = $this.fullScreenCss($this, this.screentype);
            });

            if (this.loadfunmounted_sys !== undefined) {
                this.loadfunmounted_sys();
            }
        },
        fullScreenCss($this, screentype) {
            if (screentype === "none") {
                return `  width: ${$this.w}px;height: ${$this.h}px; ${$this.bg === ""
                    ? ""
                    : "background-image:url(" +
                    $this.bg +
                    ");    background-repeat: no-repeat;background-size: cover;"
                    }    ${$this.bgColor === "" ? "" : "background-color:" + $this.bgColor + ";"
                    }`;
            } else if (screentype === "w") {
                return `  width: ${$this.w}px;height: ${$this.h}px; ${$this.bg === ""
                    ? ""
                    : "background-image:url(" +
                    $this.bg +
                    ");    background-repeat: no-repeat;background-size: cover;"
                    }  transform: scale(${document.body.clientWidth / $this.w});  ${$this.bgColor === "" ? "" : "background-color:" + $this.bgColor + ";"
                    }`;
            } else if (screentype === "h") {
                return `  width: ${$this.w}px;height: ${$this.h}px; ${$this.bg === ""
                    ? ""
                    : "background-image:url(" +
                    $this.bg +
                    ");    background-repeat: no-repeat;background-size: cover;"
                    }  transform: scale(${document.body.clientHeight / $this.h});  ${$this.bgColor === "" ? "" : "background-color:" + $this.bgColor + ";"
                    }`;
            } else if (screentype === "full") {
                return `  width: ${$this.w}px;height: ${$this.h}px; ${$this.bg === ""
                    ? ""
                    : "background-image:url(" +
                    $this.bg +
                    ");    background-repeat: no-repeat;background-size: cover;"
                    }  transform: scale(${document.body.clientWidth / $this.w},${document.body
                        .clientHeight / $this.h});  ${$this.bgColor === "" ? "" : "background-color:" + $this.bgColor + ";"
                    }`;
            } else {
                let scalew = document.body.clientHeight / $this.h;
                let scaleh = document.body.clientWidth / $this.w;
                let scale = scalew > scaleh ? scaleh : scalew;
                let left = (document.body.clientWidth - scale * $this.w) / 2;
                left = left > 0 ? "left:" + left + "px;" : "";
                return (
                    left +
                    ` transform: scale(${scale}); width: ${$this.w}px;height: ${$this.h}px; ${$this.bg === ""
                        ? ""
                        : "background-image:url(" +
                        $this.bg +
                        ");    background-repeat: no-repeat;background-size: cover;"
                    } ${$this.bgColor === "" ? "" : "background-color:" + $this.bgColor + ";"
                    }`
                );
            }
        },
        // [跑马灯click]事件方法 
        sel167826175649789_click() { },
        loadfunmounted_sys() { }
    },
    created() {
        this.created_sys();

        if (this.loadfunmounted !== undefined) {
            this.$nextTick(() => {
                this.loadfunmounted();
            });
        }
    },
    components: {
        myechart,
        horseindex,
        titlecontrol
    }
}
</script>
<style scoped>
.dv-full-screen-container {
    transform: scale(1);
    position: absolute;
    top: 0px;
    left: 0px;
    overflow: hidden;
    transform-origin: left top;
    z-index: 499;
    font-family: Avenir, Helvetica, Arial, sans-serif;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    width: 1920px;
    height: 1080px;
    background-color: '#040404';
    background-size: cover;
    background-repeat: no-repeat;
}

.div-full-screen {
    background-size: cover;
    background-repeat: no-repeat;
}

.bigitem {
    position: absolute;
    will-change: transform;
    overflow: hidden;
}

.layouttable {
    height: 100%;
    display: flex;
}

.layouttable .layouttable-item {
    height: 100%;
    position: relative;
    float: left;
}

.itemcontent {
    width: 100%;
    height: 100%;
}
</style>
<style scoped></style>