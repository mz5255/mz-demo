<template>
    <div class="mapbox-maps">
        <div id="map">
            <div class="drew">
                <el-tooltip content="图标" placement="bottom" popper-class="testtooltip">
                    <el-tag @click="drewMarker(0)" :type="index == 0 ? '' : 'info'"
                        :effect="index === 0 ? 'dark' : 'plain'">
                        <svg class="icon" aria-hidden="true" style="font-size:16px">
                            <use xlink:href="#icon-PointObjects"></use>
                        </svg>
                    </el-tag>
                </el-tooltip>
                <el-tooltip content="点" placement="bottom" popper-class="testtooltip">
                    <el-tag @click="drewPoint(1)" :type="index == 1 ? '' : 'info'" :effect="index === 1 ? 'dark' : 'plain'">
                        <svg class="icon" aria-hidden="true" style="font-size:16px">
                            <use xlink:href="#icon-Point"></use>
                        </svg>
                    </el-tag>
                </el-tooltip>
                <el-tooltip content="线" placement="bottom" popper-class="testtooltip ">
                    <el-tag @click="drewLine(2)" :type="index == 2 ? '' : 'info'" :effect="index === 2 ? 'dark' : 'plain'">
                        <span class="iconfont icon-line" style="color:#49D2FE"></span>
                    </el-tag>
                </el-tooltip>
                <el-tooltip content="矩形" placement="bottom" popper-class="testtooltip ">
                    <el-tag @click="drewRectangle(3)" :type="index == 3 ? '' : 'info'"
                        :effect="index === 3 ? 'dark' : 'plain'">
                        <span class="iconfont icon-tool-polygon" style="color:#49D2FE"></span>
                    </el-tag>
                </el-tooltip>
                <el-tooltip content="面" placement="bottom" popper-class="testtooltip ">
                    <el-tag @click="drewPolygon(4)" :type="index == 4 ? '' : 'info'"
                        :effect="index === 4 ? 'dark' : 'plain'">
                        <span class="iconfont icon-mian" style="color:#49D2FE"></span>
                    </el-tag>
                </el-tooltip>
                <el-tooltip content="圆" placement="bottom" popper-class="testtooltip ">
                    <el-tag @click="drewCircle(5)" :type="index == 5 ? '' : 'info'"
                        :effect="index === 5 ? 'dark' : 'plain'">
                        <span class="iconfont icon-pointer" style="color:#49D2FE"></span>
                    </el-tag>
                </el-tooltip>
                <el-tooltip content="导出" placement="bottom" popper-class="testtooltip ">
                    <el-tag @click="exportPng(6)" :type="index == 6 ? '' : 'info'" :effect="index === 6 ? 'dark' : 'plain'">
                        <svg class="icon" aria-hidden="true" style="font-size:16px">
                            <use xlink:href="#icon-daochu3"></use>
                        </svg>
                    </el-tag>
                </el-tooltip>
                <el-tooltip content="清除" placement="bottom" popper-class="testtooltip ">
                    <el-tag @click="clearLayerAndSource(7)" :type="dIndex == 7 ? '' : 'info'"
                        :effect="dIndex === 7 ? 'dark' : 'plain'">
                        <span class="iconfont icon-delete" style="color:#F71F19"></span>
                    </el-tag>
                </el-tooltip>
                <el-tooltip content="编辑" placement="bottom" popper-class="testtooltip ">
                    <el-tag @click="drewEdit(8)" :type="index == 8 ? '' : 'info'" :effect="index === 8 ? 'dark' : 'plain'">
                        <span class="iconfont icon-bianji" style="color:#49D2FE"></span>
                    </el-tag>
                </el-tooltip>
                <el-tooltip content="拖动" placement="bottom" popper-class="testtooltip ">
                    <el-tag @click="drewDrag(9)" :type="index == 9 ? '' : 'info'" :effect="index === 9 ? 'dark' : 'plain'">
                        <svg class="icon" aria-hidden="true" style="font-size:16px">
                            <use xlink:href="#icon-tuozhuai1"></use>
                        </svg>
                    </el-tag>
                </el-tooltip>

            </div>
        </div>
    </div>
</template>
<script>
import MapPop from './MapPop'
import Vue from "vue";
import mapboxgl from "mapbox-gl";
import "mapbox-gl/dist/mapbox-gl.css";
import * as turf from '@turf/turf'
export default {
    name: 'MapboxDrew',
    data() {
        return {
            mapMarkers: [],//地图标记集合
            marker: {},
            index: -1,
            dIndex: 0,
            map: {},
            layer_array: new Array,//用于图层拖动
            geojson: {
                type: 'geojson',
                data: {
                    "type": "FeatureCollection",
                    "features": []
                }
            },
            json_temporary_point: {
                'type': 'FeatureCollection',
                'features': []
            },//临时绘制添加点
            json_point: {
                'type': 'FeatureCollection',
                'features': []
            },//线绘制添加点
            json_line: {
                'type': 'FeatureCollection',
                'features': []
            },//绘制线，添加线样式数据
            json_line_move: {
                'type': 'FeatureCollection',
                'features': []
            },//绘制线，鼠标移动的样式数据
            json_polygon: {
                'type': 'FeatureCollection',
                'features': []
            },//绘制面，添加面样式
            popupTemp: "",
            popup: {},

        }
    },
    // components:{
    //   MapPop,

    // },
    beforeDestroy() {
        //离开页面，销毁地图实例
        this.map.remove()
        console.log(this.map)

    },
    mounted() {
        this.loadMap()
    },

    methods: {
        loadMap() {
            // 英文标注转换为中文   
            // mapboxgl.setRTLTextPlugin(
            //   "https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-rtl-text/v0.1.0/mapbox-gl-rtl-text.js"
            // );
            this.map = new mapboxgl.Map({
                accessToken: 'pk.eyJ1Ijoienh0d24iLCJhIjoiY2wzanV3bHduMTZwejNrcXcyd3B1bzBieiJ9.aW_TDqLomftwPvBu7OWqwQ',
                container: 'map',
                style: 'mapbox://styles/mapbox/outdoors-v10', // stylesheet location
                center: [116.779398421, 32.694871269], // starting position [lng, lat]
                zoom: 12, // starting zoom
                hash: false,
                //pitch: 45,  //地图的角度，不写默认是0，取值是0-60度，一般在3D中使用
                bearing: 0, //地图的初始方向，值是北的逆时针度数，默认是0，即是正北
                antialias: true, //抗锯齿，通过false关闭提升性能
                projection: "globe",
            })
            // 设置语言
            // var language = new MapboxLanguage({ defaultLanguage: "zh" });
            // this.map.addControl(language);

            //地图导航
            var nav = new mapboxgl.NavigationControl();
            this.map.addControl(nav, 'top-right');

            // 比例尺
            var scale = new mapboxgl.ScaleControl({
                maxWidth: 100,
                unit: "metric"
            });
            this.map.addControl(scale, "bottom-left");

            // 全图
            this.map.addControl(new mapboxgl.FullscreenControl());
            // 定位
            this.map.addControl(
                new mapboxgl.GeolocateControl({
                    positionOptions: {
                        enableHighAccuracy: true
                    },
                    trackUserLocation: true
                })
            );



            let that = this;
            this.map.on('load', function () {

                that.map.setFog({
                    color: "rgb(186, 210, 235)",
                    'high-color': 'rgb(36, 92, 223)',
                    'horizon-blend': 0.02,
                    'space-color': 'rgb(11, 11, 25)',
                    'star-intensity': 0.6
                });
                //------------------------------------------------------------------------------------
                //---------------------------绘制点、线，面 初始化source和layer-------------------------
                //------------------------------------------------------------------------------------
                that.map.addSource('drew_temporary_point', {
                    type: 'geojson',
                    data: that.json_temporary_point
                });
                that.map.addSource('drew_point', {
                    type: 'geojson',
                    data: that.json_point
                });
                that.map.addSource('drew_line', {
                    type: 'geojson',
                    data: that.json_line
                });
                that.map.addSource('drew_line_move', {
                    type: 'geojson',
                    data: that.json_line_move
                });
                that.map.addSource('drew_polygon', {
                    type: 'geojson',
                    data: that.json_polygon
                });
                that.map.addLayer({
                    id: 'drew_temporary_point',
                    type: 'circle',
                    source: 'drew_temporary_point',
                    paint: {
                        'circle-color': '#ffffff',
                        'circle-radius': 2,
                        'circle-stroke-width': 1,
                        'circle-stroke-color': '#ff0000'
                    }
                });
                that.map.addLayer({
                    id: 'drew_point',
                    type: 'circle',
                    source: 'drew_point',
                    paint: {
                        'circle-color': '#ffffff',
                        'circle-radius': 2,
                        'circle-stroke-width': 1,
                        'circle-stroke-color': '#ff0000'
                    }
                });

                that.map.addLayer({
                    id: 'drew_line',
                    type: 'line',
                    source: 'drew_line',
                    paint: {
                        'line-color': '#ff0000',
                        'line-width': 2,
                        'line-opacity': 0.65,
                    }
                });
                that.map.addLayer({
                    id: 'drew_line_move',
                    type: 'line',
                    source: 'drew_line_move',
                    paint: {
                        'line-color': '#ff0000',
                        'line-width': 2,
                        'line-opacity': 0.65
                    }
                });

                that.map.addLayer({
                    id: 'drew_polygon',
                    type: 'fill',
                    source: 'drew_polygon',
                    paint: {
                        'fill-color': '#ff0000',
                        'fill-opacity': 0.1
                    }
                });
                that.map.addLayer({
                    id: 'drew_polygon_line_move',
                    type: 'line',
                    source: 'drew_polygon',
                    paint: {
                        'line-color': '#ff0000',
                        'line-width': 2,
                        'line-opacity': 0.65
                    }
                });
                that.map.addLayer({
                    'id': 'pointlayerhighlight',
                    'type': 'circle',
                    'source': "drew_point",
                    'paint': {
                        'circle-color': '#ffffff',
                        'circle-radius': 4,
                        'circle-stroke-width': 1,
                        'circle-stroke-color': '#ff0000'
                    },
                    "filter": ["in", "id", ""]
                })
                //-------------------------------------------------------------------
                //------------------------------结束---------------------------------
                //-------------------------------------------------------------------
                that.map.addSource('large_grid', {
                    type: 'vector',
                    tiles: [`http://172.17.13.88:11280/dynamic/large_grid/{z}/{x}/{y}.pbf`],
                    minzoom: 0,
                    maxzoom: 8
                });

                that.map.addLayer({
                    "id": "large_grid_line",
                    "type": "line",
                    "source": "large_grid",
                    "source-layer": "large_grid",
                    "layout": {
                        "visibility": "visible",
                    },
                    "paint": {
                        "line-opacity": 1,
                        "line-color": "#000000",
                        "line-width": 1,
                    },
                    "maxzoom": 8,
                    "minzoom": 0,
                })
                that.map.addSource("sourceId", {
                    type: 'vector',
                    tiles: ['http://172.21.5.176:9100/layer/get/{z}/{x}/{y}.pbf']
                })
                that.map.addLayer({
                    id: "sourceId",
                    layout: {
                        visibility: "visible",
                    },
                    type: "fill",
                    source: "sourceId",
                    "source-layer": "sourceId",
                    paint: {
                        "fill-color": "#ABC6EF",
                        "fill-outline-color": "#3bb2d0",
                        "fill-opacity": 0.6,
                    },
                })
                that.map.addSource('national-park', that.geojson);

                that.map.addLayer({
                    'id': 'park-boundary',
                    'type': 'fill',
                    'source': 'national-park',
                    'paint': {
                        'fill-color': '#e6141c',
                        'fill-opacity': 0.4
                    },
                });
                that.getGeobuf()
            })
            this.popup = new mapboxgl.Popup({
                // closeButton: false,
                closeOnClick: false
            });
            /**
             * 大网格鼠标触摸事件触发
             */
            this.map.on('click', 'park-boundary', (e) => {
                this.details(e)
            })
            //-----鼠标移动改变点的样式------------------
            // this.map.on('mousedown','drew_point', (e) => {
            //   var feature = e.features[0];
            //   that.map.setFilter('pointlayerhighlight', ['in', 'id', feature.properties.id]);
            //   console.log(e);
            // });

        },
        details(e) {

            console.log(e)
            let _this = this
            this.popupTemp = "";
            /**
             * 创建map地图弹框组件
             * 
             */
            const p = Vue.extend(MapPop);
            let vm = new p({
                propsData: {
                    objes: {
                        map: _this.map,
                        id: 2,
                        that: _this
                    }
                }, //传参
            });
            vm.$mount(); //挂载
            _this.popupTemp = vm.$el;
            if (_this.popup) {
                _this.popup.remove();
            }
            // 添加信息框
            _this.popup.setLngLat(new mapboxgl.LngLat(e.lngLat.lng, e.lngLat.lat))
                .setDOMContent(vm.$el)//插入节点
                .addTo(_this.map);
        },
        /**
         * 
         * 加载geobuf数据
         * 
         */
        getGeobuf() {
            this.map.getSource("national-park").setData({
                "type": "FeatureCollection",
                "features": []
            })


            //Make a request for a user with a given ID


        },
        /**
         * 添加图标
         */
        drewMarker(key) {
            let that = this
            that.index = key
            that.clearLayerAndSource(0)
            that.map.getCanvas().style.cursor = 'crosshair';
            // 禁止双击缩放
            that.map.doubleClickZoom.disable();

            that.map.on('click', that.clickEvent)
            // that.map.off('click',clickEvent)

        },
        clickEvent(_e) {
            let that = this
            that.marker = {}
            // if(that.marker != {}){
            //    that.map.remove(that.marker)
            // } 
            var starCoords = [];
            starCoords = [];
            starCoords.push(_e.lngLat.lat);
            starCoords.unshift(_e.lngLat.lng);
            that.marker = new mapboxgl.Marker()
                .setLngLat(starCoords)
                .addTo(that.map);
            that.mapMarkers.push(that.marker)
            that.$notify({
                title: '成功',
                message: starCoords,
                type: 'success',
            });

        },
        /**
         * 绘制点
         */
        drewPoint(key) {
            //改变鼠标光圈
            let that = this
            that.map.off('click', that.clickEvent)
            that.index = key
            that.clearLayerAndSource(0)
            that.map.getCanvas().style.cursor = 'crosshair';
            // 禁止双击缩放
            that.map.doubleClickZoom.disable();
            var isDraw = true;
            var points = [];
            var starCoords = [];
            that.map.on('click', clickEvent)
            function clickEvent(_e) {
                if (isDraw) {
                    starCoords = [];
                    starCoords.push(_e.lngLat.lat);
                    starCoords.unshift(_e.lngLat.lng);
                    points.push(starCoords);
                }
            }
            that.map.on('dblclick', dblclickEvent)
            function dblclickEvent(_e) {
                if (isDraw) {
                    that.map.getCanvas().style.cursor = 'grab'
                    that.map.off('click', clickEvent)
                    that.map.off('dblclick', dblclickEvent)
                    isDraw = false;
                    var endCoords = [_e.lngLat.lng, _e.lngLat.lat];
                    that.json_point.features = []
                    that.json_point.features.push({
                        type: 'Feature',
                        geometry: {
                            type: 'Point',
                            coordinates: endCoords
                        }
                    })
                    that.map.getSource('drew_point').setData(that.json_point);
                    that.$notify({
                        title: '成功',
                        message: that.json_point,
                        type: 'success',
                    });
                    that.resetBtnStyle()
                }
            }
        },
        /**
         * 
         * 绘制线
         * 
         */
        drewLine(key) {
            let that = this;
            that.map.off('click', that.clickEvent)
            that.index = key;
            that.clearLayerAndSource(0)
            that.map.getCanvas().style.cursor = 'crosshair';
            let isMeasure = true;
            that.json_point.features = []
            that.json_line.features = []
            // 禁止双击缩放
            that.map.doubleClickZoom.disable();
            function addPointOrLine(coords) {
                if (that.json_point.features.length > 0) {
                    let prev = that.json_point.features[that.json_point.features.length - 1];
                    that.json_line.features.push({
                        type: 'Feature',
                        geometry: {
                            type: 'LineString',
                            coordinates: [prev.geometry.coordinates, coords]
                        },
                        properties: {
                            id: that.json_line.features.length + 1,
                            start: prev.geometry.coordinates,//起始线端坐标
                            end: coords,//线末端坐标
                            now: coords,//当前坐标
                            distance: [0, 0], //鼠标拖动时与各端点的距离
                            angle: [0, 0]//鼠标拖动时与各端点的角度
                        }
                    });
                    that.map.getSource('drew_line').setData(that.json_line);
                }
                that.json_point.features.push({
                    type: 'Feature',
                    geometry: {
                        type: 'Point',
                        coordinates: coords
                    },
                    properties: {
                        id: that.json_point.features.length,//that.json_point.features.length+1,
                        start: that.json_point.length == 0 ? coords : [],
                        line_index: that.json_point.features.length,//用于编辑线要素使用的
                        regular: true //固定点
                    }
                });
                that.map.getSource('drew_point').setData(that.json_point);
            }
            that.map.on('click', clickEvent);
            function clickEvent(_e) {
                if (isMeasure) {
                    let coords = [_e.lngLat.lng, _e.lngLat.lat];
                    addPointOrLine(coords);
                }
            }
            that.map.on('mousemove', mousemoveEvent)
            function mousemoveEvent(_e) {
                if (isMeasure) {
                    let coords = [_e.lngLat.lng, _e.lngLat.lat];
                    if (that.json_point.features.length > 0) {
                        var prev = that.json_point.features[that.json_point.features.length - 1];
                        that.json_line_move.features = []
                        that.json_line_move.features.push({
                            type: 'Feature',
                            geometry: {
                                type: 'LineString',
                                coordinates: [prev.geometry.coordinates, coords]
                            }
                        });
                        that.map.getSource('drew_line_move').setData(that.json_line_move);
                    }
                }
            }
            that.map.on('dblclick', dblclickEvent)
            function dblclickEvent(_e) {
                if (isMeasure) {
                    isMeasure = false;
                    console.log(_e)
                    // let coords = [_e.lngLat.lng, _e.lngLat.lat];
                    // addPointOrLine(coords);
                    that.json_point.features.pop()
                    that.map.getSource('drew_point').setData(that.json_point)
                    that.json_line.features.pop()
                    that.map.getSource('drew_line').setData(that.json_line)
                    console.log(that.json_line)
                    that.map.getCanvas().style.cursor = 'grab'
                    that.map.off('click', clickEvent)
                    that.map.off('mousemove', mousemoveEvent)
                    that.map.off('dblclick', dblclickEvent)
                    that.json_line_move.features = []
                    that.map.getSource('drew_line_move').setData(that.json_line_move);
                    that.resetBtnStyle()
                }
            }
        },
        /**
         * 
         * 绘制面
         * 
         */
        drewPolygon(key) {
            let that = this;
            that.map.off('click', that.clickEvent)
            that.index = key;
            that.clearLayerAndSource(0)
            that.map.getCanvas().style.cursor = 'crosshair';
            var isMeasure = true;
            // 禁止双击缩放
            that.map.doubleClickZoom.disable();
            var points = [];
            that.json_point.features = []
            that.json_line.features = []
            function addPoint(coords) {
                that.json_point.features.push({
                    type: 'Feature',
                    geometry: {
                        type: 'Point',
                        coordinates: coords
                    }
                });
                that.map.getSource('drew_point').setData(that.json_point);
            }
            that.map.on('click', clickEvent);
            function clickEvent(_e) {
                if (isMeasure) {
                    var coords = [_e.lngLat.lng, _e.lngLat.lat];
                    points.push(coords);
                    addPoint(coords);
                }
            }
            that.map.on('mousemove', mousemoveEvent)
            function mousemoveEvent(_e) {
                if (isMeasure) {
                    var coords = [_e.lngLat.lng, _e.lngLat.lat];
                    var len = that.json_point.features.length;
                    if (len != 0 && len != 1) {
                        var pts = points.concat([coords]);
                        pts = pts.concat([points[0]]);
                        that.json_polygon.features = []
                        that.json_polygon.features.push({
                            type: 'Feature',
                            geometry: {
                                type: 'Polygon',
                                coordinates: [pts]
                            },
                            properties: {
                                id: that.json_polygon.features.length + 1,
                                distance: new Array,
                                angle: new Array
                            }
                        })

                        that.map.getSource('drew_polygon').setData(that.json_polygon);
                    }
                }
            }
            that.map.on('dblclick', dblclickEvent)
            function dblclickEvent(_e) {
                if (isMeasure) {
                    that.map.off('click', clickEvent);
                    that.map.off('mousemove', mousemoveEvent)
                    that.map.off('dblclick', dblclickEvent)
                    var coords = [_e.lngLat.lng, _e.lngLat.lat];
                    points.push(coords);
                    isMeasure = false;
                    that.map.getCanvas().style.cursor = 'grab'
                    that.json_point.features = []
                    that.map.getSource('drew_point').setData(that.json_point)
                    that.resetBtnStyle()
                }
            }

        },
        /**
         * 
         * 绘制矩形
         * 
         */
        drewRectangle(key) {
            let that = this;
            that.map.off('click', that.clickEvent)
            that.index = key;
            var isDraw = true;
            that.clearLayerAndSource(0)
            that.map.getCanvas().style.cursor = 'crosshair';
            // 禁止双击缩放
            that.map.doubleClickZoom.disable();
            var starCoords = [];
            let isMousemove = false;
            that.map.on('click', clickEvent)
            function clickEvent(_e) {
                if (isDraw) {
                    starCoords = [_e.lngLat.lng, _e.lngLat.lat];
                    isMousemove = true;
                }
            }
            that.map.on('mousemove', mousemoveEvent)
            function mousemoveEvent(_e) {
                if (isDraw && isMousemove) {
                    var moveCoords = [];
                    moveCoords = [_e.lngLat.lng, _e.lngLat.lat];
                    var rightTopCoords = [];
                    rightTopCoords = [moveCoords[0], starCoords[1]];
                    var buttomLeftCoords = [];
                    buttomLeftCoords = [starCoords[0], moveCoords[1]];
                    var coords = [];
                    coords = [starCoords, rightTopCoords, moveCoords, buttomLeftCoords, starCoords]
                    that.json_polygon.features = []
                    that.json_polygon.features.push({
                        type: 'Feature',
                        geometry: {
                            type: 'Polygon',
                            coordinates: [coords]
                        }
                    })
                    that.map.getSource('drew_polygon').setData(that.json_polygon);
                }

            }
            that.map.on('dblclick', dblclickEvent)
            function dblclickEvent(_e) {
                if (isDraw) {
                    that.map.off('click', clickEvent);
                    that.map.off('mousemove', mousemoveEvent)
                    that.map.off('dblclick', dblclickEvent)
                    isMousemove = false;
                    isDraw = false;
                    that.map.getCanvas().style.cursor = 'grab'
                    var endCoords = [_e.lngLat.lng, _e.lngLat.lat];
                    var rightTopCoords = [];
                    rightTopCoords = [endCoords[0], starCoords[1]];
                    var buttomLeftCoords = [];
                    buttomLeftCoords = [starCoords[0], endCoords[1]];
                    var coords = [];
                    coords = [starCoords, rightTopCoords, endCoords, buttomLeftCoords]
                    that.json_polygon.features.push({
                        type: 'Feature',
                        geometry: {
                            type: 'Polygon',
                            coordinates: coords
                        }
                    })
                    that.map.getSource('drew_polygon').setData(that.json_polygon);
                    that.resetBtnStyle()
                }
            }
        },
        /**
         * 
         * 绘制圆
         * 
         */
        drewCircle(key) {
            let that = this;
            that.map.off('click', that.clickEvent)
            that.index = key;
            that.clearLayerAndSource(0)
            that.map.getCanvas().style.cursor = 'crosshair';
            var isDraws = true;
            // 禁止双击缩放
            that.map.doubleClickZoom.disable();
            let _pixelRadius = 0;
            console.log(_pixelRadius)
            var points = [];
            var starCoords = [];
            let isMousemove = false;
            let isFilst = true;
            let filstCoords = [];
            that.map.on('click', clickEvent)
            function clickEvent(_e) {
                if (isDraws) {
                    starCoords = [];
                    starCoords.push(_e.lngLat.lat);
                    starCoords.unshift(_e.lngLat.lng);
                    if (isFilst) {
                        filstCoords = starCoords;
                        isFilst = false
                    }
                    points.push(starCoords);
                    that.json_polygon.features = []
                    that.json_polygon.features.push(that.createGeoJSONCircle(starCoords, 0))
                    that.map.getSource('drew_polygon').setData(that.json_polygon);
                    isMousemove = true;
                    isDraws = true;
                }
            }
            var moveCoords = []
            that.map.on('mousemove', mousemoveEvent)
            function mousemoveEvent(_e) {
                if (isDraws && isMousemove) {
                    isDraws = true;
                    var centerCoords = []
                    moveCoords = [_e.lngLat.lng, _e.lngLat.lat];
                    if (filstCoords.length != 0) {
                        // eslint-disable-next-line no-unused-vars
                        centerCoords = [(parseFloat(filstCoords[0]) + parseFloat(moveCoords[0])) / 2, (parseFloat(filstCoords[1]) + parseFloat(moveCoords[1])) / 2];
                        var _points = [];
                        _points.push(moveCoords)
                        _points.unshift(filstCoords);
                        var line = turf.lineString(_points);
                        var len = turf.length(line);
                        if (len < 1) {
                            _pixelRadius = len

                        } else {
                            len = len.toFixed(2);
                            _pixelRadius = len
                            that.json_polygon.features = []
                            that.json_polygon.features.push(that.createGeoJSONCircle(filstCoords, len))
                            that.map.getSource('drew_polygon').setData(that.json_polygon);
                        }
                    }
                }
            }
            that.map.on('dblclick', dblclickEvent)
            function dblclickEvent(_e) {
                console.log(_e)
                if (isDraws) {
                    that.map.off('click', clickEvent);
                    that.map.off('mousemove', mousemoveEvent)
                    that.map.off('dblclick', dblclickEvent)
                    that.map.getCanvas().style.cursor = 'grab'
                    isMousemove = false
                    isDraws = false;
                    that.map.getCanvas().style.cursor = '';
                    if (filstCoords.length != 0) {
                        var _points = [];
                        _points.push(moveCoords)
                        _points.unshift(filstCoords);
                        var line = turf.lineString(_points);
                        var len = turf.length(line);
                        if (len < 1) {
                            _pixelRadius = len
                        } else {
                            len = len.toFixed(2);
                            _pixelRadius = len
                            that.json_polygon.features = []
                            that.json_polygon.features.push(that.createGeoJSONCircle(filstCoords, len))
                            that.map.getSource('drew_polygon').setData(that.json_polygon);
                            that.resetBtnStyle()
                        }
                    }
                }
            }
        },
        /**
         * 根据中心点坐标，半径， 圆的点点坐标获取圆的geojson
         * 
         * @param {*} center 
         * @param {*} radiusInKm 
         * @param {*} points 
         */
        createGeoJSONCircle(center, radiusInKm, points) {
            if (!points) points = 64;
            var coords = {
                latitude: center[1],
                longitude: center[0]
            };
            var km = radiusInKm;
            var ret = [];
            var distanceX = km / (111.320 * Math.cos(coords.latitude * Math.PI / 180));
            var distanceY = km / 110.574;

            var theta, x, y;
            for (var i = 0; i < points; i++) {
                theta = (i / points) * (2 * Math.PI);
                x = distanceX * Math.cos(theta);
                y = distanceY * Math.sin(theta);
                ret.push([coords.longitude + x, coords.latitude + y]);
            }
            ret.push(ret[0]);
            return {
                "type": "Feature",
                "geometry": {
                    "type": "Polygon",
                    "coordinates": [ret]
                }
            };

        },
        /**
         * 
         * 导出
         * 
         */
        exportPng(key) {
            this.index = key;
            this.map.off('click', this.clickEvent)
            var image = document.createElement('a');
            //image.href = canvas.toDataURL("image/jpeg").replace("image/jpeg", "image/octet-stream"); 
            image.href = this.map.getCanvas().toDataURL('image/png');
            image.download = 'map.png';
            image.click();
            this.resetBtnStyle()

        },
        /**
         * 
         * 图层编辑
         * 
         */
        drewEdit(key) {
            let that = this;
            that.index = key;
            let layerId = 'drew_point'
            let obj = {}
            that.map.getCanvas().style.cursor = 'crosshair';
            //添加鼠标按下事件
            that.map.on('mousedown', layerId, mousedownEvent);
            //添加触控启动事件
            that.map.on('touchstart', layerId, touchstartEvent)

            function mousemoveEvent(e) {

                console.log(e);
                //把点加入json_point
                that.json_point.features.forEach((_e) => {
                    if (_e.properties.id == obj.properties.id) {
                        _e.geometry.coordinates[0] = e.lngLat.lng
                        _e.geometry.coordinates[1] = e.lngLat.lat
                    }
                })

                //起始端点移动鼠标修改线开始节点数据
                if (obj.properties.id == 0) {
                    that.json_line.features[0].geometry.coordinates[0][0] = e.lngLat.lng
                    that.json_line.features[0].geometry.coordinates[0][1] = e.lngLat.lat
                }
                if (obj.properties.id > 0 && obj.properties.id < that.json_point.features.length - 1) {
                    //相连的左边json_line
                    that.json_line.features[obj.properties.id - 1].geometry.coordinates[1][0] = e.lngLat.lng
                    that.json_line.features[obj.properties.id - 1].geometry.coordinates[1][1] = e.lngLat.lat
                    //相连的右边json_line数组
                    that.json_line.features[obj.properties.id].geometry.coordinates[0][0] = e.lngLat.lng
                    that.json_line.features[obj.properties.id].geometry.coordinates[0][1] = e.lngLat.lat
                }
                //末端点鼠标移动修改线数据
                if (obj.properties.id == that.json_point.features.length - 1) {
                    that.json_line.features[obj.properties.id - 1].geometry.coordinates[1][0] = e.lngLat.lng
                    that.json_line.features[obj.properties.id - 1].geometry.coordinates[1][1] = e.lngLat.lat
                }
                that.map.getSource('drew_point').setData(that.json_point)
                that.map.getSource('drew_line').setData(that.json_line)
            }

            function onUp(e) {
                that.map.off('mousemove', mousemoveEvent);
                that.map.off('touchmove', mousemoveEvent);
                that.map.off('mousedown', mousedownEvent);
                that.map.off('touchstart', touchstartEvent);
                that.map.off('touchend', onUp);
                that.resetBtnStyle()
                console.log(e)
            }

            function mousedownEvent(e) {
                that.json_temporary_point.features = []
                obj = e.features[0] //获取鼠标按下的当前点数据，用来进行鼠标移动时修改线或者面相交线的末端点和起始端点坐标
                e.preventDefault();//防止默认地图拖动行为。
                that.json_point.features[obj.properties.id].properties.regular = true//regular


                let _index = obj.properties.id;
                let midpoint_left = "";//左线中点坐标
                let midpoint_right = ""//右线中点坐标
                if (obj.properties.id == 0) {
                    let line_feature = that.json_line.features[_index]
                    midpoint_right = turf.midpoint(turf.point(line_feature.geometry.coordinates[0]), turf.point(line_feature.geometry.coordinates[1]));
                }
                if (obj.properties.id > 0 && obj.properties.id < that.json_point.features.length - 1) {
                    let line_left_feature = that.json_line.features[_index - 1]
                    let line_right_feature = that.json_line.features[_index]
                    midpoint_left = turf.midpoint(turf.point(line_left_feature.geometry.coordinates[0]),
                        turf.point(line_left_feature.geometry.coordinates[1]));
                    // eslint-disable-next-line no-unused-vars
                    midpoint_right = turf.midpoint(turf.point(line_right_feature.geometry.coordinates[0]),
                        turf.point(line_right_feature.geometry.coordinates[1]));

                }
                if (obj.properties.id == that.json_point.features.length - 1) {
                    let line_feature = that.json_line.features[_index - 1]
                    // eslint-disable-next-line no-unused-vars
                    midpoint_left = turf.midpoint(turf.point(line_feature.geometry.coordinates[0]), turf.point(line_feature.geometry.coordinates[1]));
                }
                // //把计算出的中心点加入json_point数组中，记住顺序是关键
                let arry = {
                    'type': 'FeatureCollection',
                    'features': []
                };
                let line_array = {
                    'type': 'FeatureCollection',
                    'features': []
                }
                let isNewCenter_left = false;//是否新增左节点
                let isNewCenter_rigth = false;//是否新增右节点
                if (obj.properties.id == 0) {
                    that.json_point.features[obj.properties.id + 1].properties.regular ? isNewCenter_rigth = true : isNewCenter_rigth = false
                    if (isNewCenter_rigth) {
                        that.json_point.features[0].properties.id = arry.features.length
                        arry.features.push(that.json_point.features[0])
                        midpoint_right.properties["regular"] = false
                        midpoint_right.properties["id"] = arry.features.length
                        arry.features.push(midpoint_right)
                        for (let i = obj.properties.id + 1; i < that.json_point.features.length; i++) {
                            that.json_point.features[i].properties.id = arry.features.length
                            arry.features.push(that.json_point.features[i])
                        }
                        //把中心点插入到json_line中
                        line_array.features.push({
                            type: 'Feature',
                            geometry: {
                                type: 'LineString',
                                coordinates: [that.json_line.features[obj.properties.id].geometry.coordinates[0], midpoint_right.geometry.coordinates]
                            },
                            properties: {
                                id: line_array.features.length,
                                start: that.json_line.features[obj.properties.id].geometry.coordinates[0],//起始线端坐标
                                end: midpoint_right.geometry.coordinates,//线末端坐标
                                now: midpoint_right.geometry.coordinates,//当前坐标
                                distance: [0, 0], //鼠标拖动时与各端点的距离
                                angle: [0, 0]//鼠标拖动时与各端点的角度
                            }

                        })
                        line_array.features.push({
                            type: 'Feature',
                            geometry: {
                                type: 'LineString',
                                coordinates: [midpoint_right.geometry.coordinates, that.json_line.features[obj.properties.id].geometry.coordinates[1]]
                            },
                            properties: {
                                id: line_array.features.length,
                                start: midpoint_right.geometry.coordinates,//起始线端坐标
                                end: that.json_line.features[obj.properties.id].geometry.coordinates[1],//线末端坐标
                                now: that.json_line.features[obj.properties.id].geometry.coordinates[1],//当前坐标
                                distance: [0, 0], //鼠标拖动时与各端点的距离
                                angle: [0, 0]//鼠标拖动时与各端点的角度
                            }

                        })
                        that.json_line.features.forEach((_e, index) => {
                            if (index >= 1) {
                                _e.properties.id = line_array.features.length
                                line_array.features.push(_e)
                            }
                        })
                        that.json_point.features = []
                        that.json_point.features = arry.features
                        that.json_line.features = []
                        that.json_line.features = line_array.features
                        that.map.getSource('drew_point').setData(that.json_point)
                        that.map.getSource('drew_line').setData(that.json_line)
                    }
                } else if (obj.properties.id > 0 && obj.properties.id < that.json_point.features.length - 1) {
                    that.json_point.features[obj.properties.id + 1].properties.regular ? isNewCenter_rigth = true : isNewCenter_rigth = false
                    that.json_point.features[obj.properties.id - 1].properties.regular ? isNewCenter_left = true : isNewCenter_left = false
                    if (isNewCenter_left && isNewCenter_rigth) {
                        //中心点插入到that.json_point中
                        for (let i = 0; i < obj.properties.id; i++) {
                            that.json_point.features[i].properties.id = arry.features.length
                            arry.features.push(that.json_point.features[i])
                        }
                        //插入左边的中心点
                        midpoint_left.properties["id"] = arry.features.length
                        midpoint_left.properties["regular"] = false
                        arry.features.push(midpoint_left)
                        that.json_point.features[obj.properties.id].properties.id = arry.features.length
                        arry.features.push(that.json_point.features[obj.properties.id])
                        midpoint_right.properties["id"] = arry.features.length
                        midpoint_right.properties["regular"] = false
                        arry.features.push(midpoint_right)
                        for (let i = obj.properties.id + 1; i < that.json_point.features.length; i++) {
                            that.json_point.features[i].properties.id = i + 2
                            arry.features.push(that.json_point.features[i])
                        }
                        //中心点插入that.json_line
                        //先添加左边线
                        if (obj.properties.id == 1) {
                            //左边
                            line_array.features.push({
                                type: 'Feature',
                                geometry: {
                                    type: 'LineString',
                                    coordinates: [that.json_line.features[0].geometry.coordinates[0], midpoint_left.geometry.coordinates]
                                },
                                properties: {
                                    id: that.json_line.features[0].properties.id,
                                    start: that.json_line.features[0].geometry.coordinates[0],//起始线端坐标
                                    end: midpoint_left.geometry.coordinates,//线末端坐标
                                    now: midpoint_left.geometry.coordinates,//当前坐标
                                    distance: [0, 0], //鼠标拖动时与各端点的距离
                                    angle: [0, 0]//鼠标拖动时与各端点的角度
                                }
                            })
                            line_array.features.push({
                                type: 'Feature',
                                geometry: {
                                    type: 'LineString',
                                    coordinates: [midpoint_left.geometry.coordinates, that.json_line.features[0].geometry.coordinates[1]]
                                },
                                properties: {
                                    id: line_array.features.length,
                                    start: midpoint_left.geometry.coordinates,//起始线端坐标
                                    end: that.json_line.features[0].geometry.coordinates[1],//线末端坐标
                                    now: that.json_line.features[0].geometry.coordinates[1],//当前坐标
                                    distance: [0, 0], //鼠标拖动时与各端点的距离
                                    angle: [0, 0]//鼠标拖动时与各端点的角度
                                }
                            })
                            //右边
                            if (that.json_line.features.length > 1) {
                                line_array.features.push({
                                    type: 'Feature',
                                    geometry: {
                                        type: 'LineString',
                                        coordinates: [that.json_line.features[1].geometry.coordinates[0], midpoint_right.geometry.coordinates]
                                    },
                                    properties: {
                                        id: line_array.features.length,
                                        start: that.json_line.features[1].geometry.coordinates[0],//起始线端坐标
                                        end: midpoint_right.geometry.coordinates,//线末端坐标
                                        now: midpoint_right.geometry.coordinates,//当前坐标
                                        distance: [0, 0], //鼠标拖动时与各端点的距离
                                        angle: [0, 0]//鼠标拖动时与各端点的角度
                                    }
                                })
                                line_array.features.push({
                                    type: 'Feature',
                                    geometry: {
                                        type: 'LineString',
                                        coordinates: [midpoint_right.geometry.coordinates, that.json_line.features[1].geometry.coordinates[1]]
                                    },
                                    properties: {
                                        id: line_array.features.length,
                                        start: midpoint_left.geometry.coordinates,//起始线端坐标
                                        end: that.json_line.features[1].geometry.coordinates[1],//线末端坐标
                                        now: that.json_line.features[1].geometry.coordinates[1],//当前坐标
                                        distance: [0, 0], //鼠标拖动时与各端点的距离
                                        angle: [0, 0]//鼠标拖动时与各端点的角度
                                    }
                                })
                            }
                            //往线添加新的中心点线段
                            for (let j = obj.properties.id + 1; j < that.json_line.features.length; j++) {
                                line_array.features.push({
                                    type: 'Feature',
                                    geometry: {
                                        type: 'LineString',
                                        coordinates: that.json_line.features[j].geometry.coordinates
                                    },
                                    properties: {
                                        id: line_array.features.length,
                                        start: that.json_line.features[j].geometry.coordinates[0],//起始线端坐标
                                        end: that.json_line.features[j].geometry.coordinates[1],//线末端坐标
                                        now: that.json_line.features[j].geometry.coordinates[1],//当前坐标
                                        distance: [0, 0], //鼠标拖动时与各端点的距离
                                        angle: [0, 0]//鼠标拖动时与各端点的角度
                                    }
                                })
                            }
                        } else {
                            //往线添加新的中心点线段
                            for (let i = 0; i < obj.properties.id - 1; i++) {
                                line_array.features.push({
                                    type: 'Feature',
                                    geometry: {
                                        type: 'LineString',
                                        coordinates: that.json_line.features[i].geometry.coordinates
                                    },
                                    properties: {
                                        id: line_array.features.length,
                                        start: that.json_line.features[i].geometry.coordinates[0],//起始线端坐标
                                        end: that.json_line.features[i].geometry.coordinates[1],//线末端坐标
                                        now: that.json_line.features[i].geometry.coordinates[1],//当前坐标
                                        distance: [0, 0], //鼠标拖动时与各端点的距离
                                        angle: [0, 0]//鼠标拖动时与各端点的角度
                                    }
                                })
                            }
                            line_array.features.push({
                                type: 'Feature',
                                geometry: {
                                    type: 'LineString',
                                    coordinates: [that.json_line.features[obj.properties.id - 1].geometry.coordinates[0], midpoint_left.geometry.coordinates]
                                },
                                properties: {
                                    id: line_array.features.length,
                                    start: that.json_line.features[obj.properties.id - 1].geometry.coordinates[0],//起始线端坐标
                                    end: midpoint_left.geometry.coordinates,//线末端坐标
                                    now: midpoint_left.geometry.coordinates,//当前坐标
                                    distance: [0, 0], //鼠标拖动时与各端点的距离
                                    angle: [0, 0]//鼠标拖动时与各端点的角度
                                }
                            })
                            line_array.features.push({
                                type: 'Feature',
                                geometry: {
                                    type: 'LineString',
                                    coordinates: [midpoint_left.geometry.coordinates, that.json_line.features[obj.properties.id - 1].geometry.coordinates[1]]
                                },
                                properties: {
                                    id: line_array.features.length,
                                    start: midpoint_left.geometry.coordinates,//起始线端坐标
                                    end: that.json_line.features[obj.properties.id - 1].geometry.coordinates[1],//线末端坐标
                                    now: that.json_line.features[obj.properties.id - 1].geometry.coordinates[1],//当前坐标
                                    distance: [0, 0], //鼠标拖动时与各端点的距离
                                    angle: [0, 0]//鼠标拖动时与各端点的角度
                                }
                            })
                            line_array.features.push({
                                type: 'Feature',
                                geometry: {
                                    type: 'LineString',
                                    coordinates: [that.json_line.features[obj.properties.id].geometry.coordinates[0], midpoint_right.geometry.coordinates]
                                },
                                properties: {
                                    id: line_array.features.length,
                                    start: that.json_line.features[obj.properties.id].geometry.coordinates[0],//起始线端坐标
                                    end: midpoint_right.geometry.coordinates,//线末端坐标
                                    now: midpoint_right.geometry.coordinates,//当前坐标
                                    distance: [0, 0], //鼠标拖动时与各端点的距离
                                    angle: [0, 0]//鼠标拖动时与各端点的角度
                                }
                            })
                            line_array.features.push({
                                type: 'Feature',
                                geometry: {
                                    type: 'LineString',
                                    coordinates: [midpoint_right.geometry.coordinates, that.json_line.features[obj.properties.id].geometry.coordinates[1]]
                                },
                                properties: {
                                    id: line_array.features.length,
                                    start: midpoint_right.geometry.coordinates,//起始线端坐标
                                    end: that.json_line.features[obj.properties.id].geometry.coordinates[1],//线末端坐标
                                    now: that.json_line.features[obj.properties.id].geometry.coordinates[1],//当前坐标
                                    distance: [0, 0], //鼠标拖动时与各端点的距离
                                    angle: [0, 0]//鼠标拖动时与各端点的角度
                                }
                            })
                            for (let i = obj.properties.id + 1; i < that.json_line.features.length; i++) {

                                line_array.features.push({
                                    type: 'Feature',
                                    geometry: {
                                        type: 'LineString',
                                        coordinates: that.json_line.features[i].geometry.coordinates
                                    },
                                    properties: {
                                        id: line_array.features.length,
                                        start: that.json_line.features[i].geometry.coordinates[0],//起始线端坐标
                                        end: that.json_line.features[i].geometry.coordinates[1],//线末端坐标
                                        now: that.json_line.features[i].geometry.coordinates[1],//当前坐标
                                        distance: [0, 0], //鼠标拖动时与各端点的距离
                                        angle: [0, 0]//鼠标拖动时与各端点的角度
                                    }
                                })
                            }

                        }
                        that.json_point.features = []
                        that.json_point.features = arry.features
                        that.json_line.features = []
                        that.json_line.features = line_array.features
                        that.map.getSource('drew_point').setData(that.json_point)
                        that.map.getSource('drew_line').setData(that.json_line)
                    } else if (isNewCenter_left && !isNewCenter_rigth) {
                        //中心点插入到that.json_point中
                        for (let i = 0; i < obj.properties.id; i++) {
                            that.json_point.features[i].properties.id = arry.features.length
                            arry.features.push(that.json_point.features[i])
                        }
                        //插入左边的中心点
                        midpoint_left.properties["id"] = arry.features.length
                        midpoint_left.properties["regular"] = false
                        arry.features.push(midpoint_left)
                        that.json_point.features[obj.properties.id].properties.id = arry.features.length
                        arry.features.push(that.json_point.features[obj.properties.id])
                        // midpoint_right.properties["id"]= arry.features.length 
                        // midpoint_right.properties["regular"] = false
                        // arry.features.push(midpoint_right)
                        for (let i = obj.properties.id + 1; i < that.json_point.features.length; i++) {
                            that.json_point.features[i].properties.id = arry.features.length
                            arry.features.push(that.json_point.features[i])
                        }
                        //中心点插入that.json_line
                        //先添加左边线
                        if (obj.properties.id == 1) {
                            //左边
                            line_array.features.push({
                                type: 'Feature',
                                geometry: {
                                    type: 'LineString',
                                    coordinates: [that.json_line.features[0].geometry.coordinates[0], midpoint_left.geometry.coordinates]
                                },
                                properties: {
                                    id: that.json_line.features[0].properties.id,
                                    start: that.json_line.features[0].geometry.coordinates[0],//起始线端坐标
                                    end: midpoint_left.geometry.coordinates,//线末端坐标
                                    now: midpoint_left.geometry.coordinates,//当前坐标
                                    distance: [0, 0], //鼠标拖动时与各端点的距离
                                    angle: [0, 0]//鼠标拖动时与各端点的角度
                                }
                            })
                            line_array.features.push({
                                type: 'Feature',
                                geometry: {
                                    type: 'LineString',
                                    coordinates: [midpoint_left.geometry.coordinates, that.json_line.features[0].geometry.coordinates[1]]
                                },
                                properties: {
                                    id: line_array.features.length,
                                    start: midpoint_left.geometry.coordinates,//起始线端坐标
                                    end: that.json_line.features[0].geometry.coordinates[1],//线末端坐标
                                    now: that.json_line.features[0].geometry.coordinates[1],//当前坐标
                                    distance: [0, 0], //鼠标拖动时与各端点的距离
                                    angle: [0, 0]//鼠标拖动时与各端点的角度
                                }
                            })
                            //右边
                            // if(that.json_line.features.length>1){
                            //   line_array.features.push({
                            //     type: 'Feature',
                            //     geometry: {
                            //       type: 'LineString',
                            //       coordinates: [that.json_line.features[1].geometry.coordinates[0], midpoint_right.geometry.coordinates]
                            //     },
                            //     properties: {
                            //       id: line_array.features.length,
                            //       start:that.json_line.features[1].geometry.coordinates[0],//起始线端坐标
                            //       end:midpoint_right.geometry.coordinates,//线末端坐标
                            //       now:midpoint_right.geometry.coordinates,//当前坐标
                            //       distance:[0,0], //鼠标拖动时与各端点的距离
                            //       angle:[0,0]//鼠标拖动时与各端点的角度
                            //     }
                            //   })
                            //   line_array.features.push({
                            //     type: 'Feature',
                            //     geometry: {
                            //       type: 'LineString',
                            //       coordinates: [midpoint_right.geometry.coordinates, that.json_line.features[1].geometry.coordinates[1]]
                            //     },
                            //     properties: {
                            //       id: line_array.features.length,
                            //       start:midpoint_left.geometry.coordinates,//起始线端坐标
                            //       end:that.json_line.features[1].geometry.coordinates[1],//线末端坐标
                            //       now:that.json_line.features[1].geometry.coordinates[1],//当前坐标
                            //       distance:[0,0], //鼠标拖动时与各端点的距离
                            //       angle:[0,0]//鼠标拖动时与各端点的角度
                            //     }
                            //   })
                            // }
                            //往线添加新的中心点线段
                            for (let j = obj.properties.id; j < that.json_line.features.length; j++) {
                                line_array.features.push({
                                    type: 'Feature',
                                    geometry: {
                                        type: 'LineString',
                                        coordinates: that.json_line.features[j].geometry.coordinates
                                    },
                                    properties: {
                                        id: line_array.features.length,
                                        start: that.json_line.features[j].geometry.coordinates[0],//起始线端坐标
                                        end: that.json_line.features[j].geometry.coordinates[1],//线末端坐标
                                        now: that.json_line.features[j].geometry.coordinates[1],//当前坐标
                                        distance: [0, 0], //鼠标拖动时与各端点的距离
                                        angle: [0, 0]//鼠标拖动时与各端点的角度
                                    }
                                })
                            }
                        } else {
                            //往线添加新的中心点线段
                            for (let i = 0; i < obj.properties.id - 1; i++) {
                                line_array.features.push({
                                    type: 'Feature',
                                    geometry: {
                                        type: 'LineString',
                                        coordinates: that.json_line.features[i].geometry.coordinates
                                    },
                                    properties: {
                                        id: line_array.features.length,
                                        start: that.json_line.features[i].geometry.coordinates[0],//起始线端坐标
                                        end: that.json_line.features[i].geometry.coordinates[1],//线末端坐标
                                        now: that.json_line.features[i].geometry.coordinates[1],//当前坐标
                                        distance: [0, 0], //鼠标拖动时与各端点的距离
                                        angle: [0, 0]//鼠标拖动时与各端点的角度
                                    }
                                })
                            }
                            line_array.features.push({
                                type: 'Feature',
                                geometry: {
                                    type: 'LineString',
                                    coordinates: [that.json_line.features[obj.properties.id - 1].geometry.coordinates[0], midpoint_left.geometry.coordinates]
                                },
                                properties: {
                                    id: line_array.features.length,
                                    start: that.json_line.features[obj.properties.id - 1].geometry.coordinates[0],//起始线端坐标
                                    end: midpoint_left.geometry.coordinates,//线末端坐标
                                    now: midpoint_left.geometry.coordinates,//当前坐标
                                    distance: [0, 0], //鼠标拖动时与各端点的距离
                                    angle: [0, 0]//鼠标拖动时与各端点的角度
                                }
                            })
                            line_array.features.push({
                                type: 'Feature',
                                geometry: {
                                    type: 'LineString',
                                    coordinates: [midpoint_left.geometry.coordinates, that.json_line.features[obj.properties.id - 1].geometry.coordinates[1]]
                                },
                                properties: {
                                    id: line_array.features.length,
                                    start: midpoint_left.geometry.coordinates,//起始线端坐标
                                    end: that.json_line.features[obj.properties.id - 1].geometry.coordinates[1],//线末端坐标
                                    now: that.json_line.features[obj.properties.id - 1].geometry.coordinates[1],//当前坐标
                                    distance: [0, 0], //鼠标拖动时与各端点的距离
                                    angle: [0, 0]//鼠标拖动时与各端点的角度
                                }
                            })
                            // line_array.features.push({
                            //   type: 'Feature',
                            //   geometry: {
                            //     type: 'LineString',
                            //     coordinates: [that.json_line.features[obj.properties.id].geometry.coordinates[0],midpoint_right.geometry.coordinates]
                            //   },
                            //   properties: {
                            //     id: line_array.features.length,
                            //     start:that.json_line.features[obj.properties.id].geometry.coordinates[0],//起始线端坐标
                            //     end:midpoint_right.geometry.coordinates,//线末端坐标
                            //     now:midpoint_right.geometry.coordinates,//当前坐标
                            //     distance:[0,0], //鼠标拖动时与各端点的距离
                            //     angle:[0,0]//鼠标拖动时与各端点的角度
                            //   }
                            // })
                            // line_array.features.push({
                            //   type: 'Feature',
                            //   geometry: {
                            //     type: 'LineString',
                            //     coordinates: [midpoint_right.geometry.coordinates,that.json_line.features[obj.properties.id].geometry.coordinates[1]]
                            //   },
                            //   properties: {
                            //     id: line_array.features.length,
                            //     start:midpoint_right.geometry.coordinates,//起始线端坐标
                            //     end:that.json_line.features[obj.properties.id].geometry.coordinates[1],//线末端坐标
                            //     now:that.json_line.features[obj.properties.id].geometry.coordinates[1],//当前坐标
                            //     distance:[0,0], //鼠标拖动时与各端点的距离
                            //     angle:[0,0]//鼠标拖动时与各端点的角度
                            //   }
                            // })
                            for (let i = obj.properties.id; i < that.json_line.features.length; i++) {

                                line_array.features.push({
                                    type: 'Feature',
                                    geometry: {
                                        type: 'LineString',
                                        coordinates: that.json_line.features[i].geometry.coordinates
                                    },
                                    properties: {
                                        id: line_array.features.length,
                                        start: that.json_line.features[i].geometry.coordinates[0],//起始线端坐标
                                        end: that.json_line.features[i].geometry.coordinates[1],//线末端坐标
                                        now: that.json_line.features[i].geometry.coordinates[1],//当前坐标
                                        distance: [0, 0], //鼠标拖动时与各端点的距离
                                        angle: [0, 0]//鼠标拖动时与各端点的角度
                                    }
                                })
                            }

                        }
                        that.json_point.features = []
                        that.json_point.features = arry.features
                        that.json_line.features = []
                        that.json_line.features = line_array.features
                        that.map.getSource('drew_point').setData(that.json_point)
                        that.map.getSource('drew_line').setData(that.json_line)

                    } else if (!isNewCenter_left && isNewCenter_rigth) {
                        //中心点插入到that.json_point中
                        for (let i = 0; i < obj.properties.id; i++) {
                            that.json_point.features[i].properties.id = arry.features.length
                            arry.features.push(that.json_point.features[i])
                        }
                        //插入左边的中心点
                        // midpoint_left.properties["id"]= arry.features.length
                        // midpoint_left.properties["regular"] = false
                        // arry.features.push(midpoint_left)
                        that.json_point.features[obj.properties.id].properties.id = arry.features.length
                        arry.features.push(that.json_point.features[obj.properties.id])
                        midpoint_right.properties["id"] = arry.features.length
                        midpoint_right.properties["regular"] = false
                        arry.features.push(midpoint_right)
                        for (let i = obj.properties.id + 1; i < that.json_point.features.length; i++) {
                            that.json_point.features[i].properties.id = arry.features.length
                            arry.features.push(that.json_point.features[i])
                        }
                        //中心点插入that.json_line
                        //先添加左边线
                        if (obj.properties.id == 1) {
                            //左边
                            line_array.features.push(that.json_line.features[0])
                            // line_array.features.push({
                            //   type: 'Feature',
                            //   geometry: {
                            //     type: 'LineString',
                            //     coordinates: [that.json_line.features[0].geometry.coordinates[0], midpoint_left.geometry.coordinates]
                            //   },
                            //   properties: {
                            //     id: that.json_line.features[0].properties.id,
                            //     start:that.json_line.features[0].geometry.coordinates[0],//起始线端坐标
                            //     end:midpoint_left.geometry.coordinates,//线末端坐标
                            //     now:midpoint_left.geometry.coordinates,//当前坐标
                            //     distance:[0,0], //鼠标拖动时与各端点的距离
                            //     angle:[0,0]//鼠标拖动时与各端点的角度
                            //   }
                            // })
                            // line_array.features.push({
                            //   type: 'Feature',
                            //   geometry: {
                            //     type: 'LineString',
                            //     coordinates: [midpoint_left.geometry.coordinates, that.json_line.features[0].geometry.coordinates[1]]
                            //   },
                            //   properties: {
                            //     id: line_array.features.length,
                            //     start:midpoint_left.geometry.coordinates,//起始线端坐标
                            //     end:that.json_line.features[0].geometry.coordinates[1],//线末端坐标
                            //     now:that.json_line.features[0].geometry.coordinates[1],//当前坐标
                            //     distance:[0,0], //鼠标拖动时与各端点的距离
                            //     angle:[0,0]//鼠标拖动时与各端点的角度
                            //   }
                            // })
                            //右边
                            if (that.json_line.features.length > 1) {
                                line_array.features.push({
                                    type: 'Feature',
                                    geometry: {
                                        type: 'LineString',
                                        coordinates: [that.json_line.features[1].geometry.coordinates[0], midpoint_right.geometry.coordinates]
                                    },
                                    properties: {
                                        id: line_array.features.length,
                                        start: that.json_line.features[1].geometry.coordinates[0],//起始线端坐标
                                        end: midpoint_right.geometry.coordinates,//线末端坐标
                                        now: midpoint_right.geometry.coordinates,//当前坐标
                                        distance: [0, 0], //鼠标拖动时与各端点的距离
                                        angle: [0, 0]//鼠标拖动时与各端点的角度
                                    }
                                })
                                line_array.features.push({
                                    type: 'Feature',
                                    geometry: {
                                        type: 'LineString',
                                        coordinates: [midpoint_right.geometry.coordinates, that.json_line.features[1].geometry.coordinates[1]]
                                    },
                                    properties: {
                                        id: line_array.features.length,
                                        start: midpoint_left.geometry.coordinates,//起始线端坐标
                                        end: that.json_line.features[1].geometry.coordinates[1],//线末端坐标
                                        now: that.json_line.features[1].geometry.coordinates[1],//当前坐标
                                        distance: [0, 0], //鼠标拖动时与各端点的距离
                                        angle: [0, 0]//鼠标拖动时与各端点的角度
                                    }
                                })
                            }
                            //往线添加新的中心点线段
                            for (let j = obj.properties.id + 1; j < that.json_line.features.length; j++) {
                                line_array.features.push({
                                    type: 'Feature',
                                    geometry: {
                                        type: 'LineString',
                                        coordinates: that.json_line.features[j].geometry.coordinates
                                    },
                                    properties: {
                                        id: line_array.features.length,
                                        start: that.json_line.features[j].geometry.coordinates[0],//起始线端坐标
                                        end: that.json_line.features[j].geometry.coordinates[1],//线末端坐标
                                        now: that.json_line.features[j].geometry.coordinates[1],//当前坐标
                                        distance: [0, 0], //鼠标拖动时与各端点的距离
                                        angle: [0, 0]//鼠标拖动时与各端点的角度
                                    }
                                })
                            }
                        } else {
                            //往线添加新的中心点线段
                            for (let i = 0; i <= obj.properties.id - 1; i++) {
                                line_array.features.push({
                                    type: 'Feature',
                                    geometry: {
                                        type: 'LineString',
                                        coordinates: that.json_line.features[i].geometry.coordinates
                                    },
                                    properties: {
                                        id: line_array.features.length,
                                        start: that.json_line.features[i].geometry.coordinates[0],//起始线端坐标
                                        end: that.json_line.features[i].geometry.coordinates[1],//线末端坐标
                                        now: that.json_line.features[i].geometry.coordinates[1],//当前坐标
                                        distance: [0, 0], //鼠标拖动时与各端点的距离
                                        angle: [0, 0]//鼠标拖动时与各端点的角度
                                    }
                                })
                            }
                            // line_array.features.push({
                            //   type: 'Feature',
                            //   geometry: {
                            //     type: 'LineString',
                            //     coordinates: [that.json_line.features[obj.properties.id-1].geometry.coordinates[0],midpoint_left.geometry.coordinates]
                            //   },
                            //   properties: {
                            //     id: line_array.features.length,
                            //     start:that.json_line.features[obj.properties.id-1].geometry.coordinates[0],//起始线端坐标
                            //     end:midpoint_left.geometry.coordinates,//线末端坐标
                            //     now:midpoint_left.geometry.coordinates,//当前坐标
                            //     distance:[0,0], //鼠标拖动时与各端点的距离
                            //     angle:[0,0]//鼠标拖动时与各端点的角度
                            //   }
                            // })
                            // line_array.features.push({
                            //   type: 'Feature',
                            //   geometry: {
                            //     type: 'LineString',
                            //     coordinates: [midpoint_left.geometry.coordinates,that.json_line.features[obj.properties.id-1].geometry.coordinates[1]]
                            //   },
                            //   properties: {
                            //     id: line_array.features.length,
                            //     start:midpoint_left.geometry.coordinates,//起始线端坐标
                            //     end:that.json_line.features[obj.properties.id-1].geometry.coordinates[1],//线末端坐标
                            //     now:that.json_line.features[obj.properties.id-1].geometry.coordinates[1],//当前坐标
                            //     distance:[0,0], //鼠标拖动时与各端点的距离
                            //     angle:[0,0]//鼠标拖动时与各端点的角度
                            //   }
                            // })
                            line_array.features.push({
                                type: 'Feature',
                                geometry: {
                                    type: 'LineString',
                                    coordinates: [that.json_line.features[obj.properties.id].geometry.coordinates[0], midpoint_right.geometry.coordinates]
                                },
                                properties: {
                                    id: line_array.features.length,
                                    start: that.json_line.features[obj.properties.id].geometry.coordinates[0],//起始线端坐标
                                    end: midpoint_right.geometry.coordinates,//线末端坐标
                                    now: midpoint_right.geometry.coordinates,//当前坐标
                                    distance: [0, 0], //鼠标拖动时与各端点的距离
                                    angle: [0, 0]//鼠标拖动时与各端点的角度
                                }
                            })
                            line_array.features.push({
                                type: 'Feature',
                                geometry: {
                                    type: 'LineString',
                                    coordinates: [midpoint_right.geometry.coordinates, that.json_line.features[obj.properties.id].geometry.coordinates[1]]
                                },
                                properties: {
                                    id: line_array.features.length,
                                    start: midpoint_right.geometry.coordinates,//起始线端坐标
                                    end: that.json_line.features[obj.properties.id].geometry.coordinates[1],//线末端坐标
                                    now: that.json_line.features[obj.properties.id].geometry.coordinates[1],//当前坐标
                                    distance: [0, 0], //鼠标拖动时与各端点的距离
                                    angle: [0, 0]//鼠标拖动时与各端点的角度
                                }
                            })
                            for (let i = obj.properties.id + 1; i < that.json_line.features.length; i++) {

                                line_array.features.push({
                                    type: 'Feature',
                                    geometry: {
                                        type: 'LineString',
                                        coordinates: that.json_line.features[i].geometry.coordinates
                                    },
                                    properties: {
                                        id: line_array.features.length,
                                        start: that.json_line.features[i].geometry.coordinates[0],//起始线端坐标
                                        end: that.json_line.features[i].geometry.coordinates[1],//线末端坐标
                                        now: that.json_line.features[i].geometry.coordinates[1],//当前坐标
                                        distance: [0, 0], //鼠标拖动时与各端点的距离
                                        angle: [0, 0]//鼠标拖动时与各端点的角度
                                    }
                                })
                            }

                        }
                        that.json_point.features = []
                        that.json_point.features = arry.features
                        that.json_line.features = []
                        that.json_line.features = line_array.features
                        that.map.getSource('drew_point').setData(that.json_point)
                        that.map.getSource('drew_line').setData(that.json_line)

                    }

                } else if (obj.properties.id == that.json_point.features.length - 1) {
                    that.json_point.features[obj.properties.id - 1].properties.regular ? isNewCenter_left = true : isNewCenter_left = false
                    if (isNewCenter_left) {
                        if (that.json_line.features.length > 1) {
                            //添加点
                            for (let i = 0; i <= obj.properties.id - 1; i++) {
                                that.json_point.features[i].properties.id = arry.features.length
                                arry.features.push(that.json_point.features[i])
                            }
                            //插入左边的中心点
                            midpoint_left.properties["id"] = arry.features.length
                            midpoint_left.properties["regular"] = false
                            arry.features.push(midpoint_left)
                            that.json_point.features[obj.properties.id].properties.id = arry.features.length
                            arry.features.push(that.json_point.features[obj.properties.id])

                            //添加线 
                            for (let i = 0; i < obj.properties.id - 1; i++) {
                                that.json_line.features[i].properties.id = line_array.features.length
                                line_array.features.push(that.json_line.features[i])
                            }
                            line_array.features.push({
                                type: 'Feature',
                                geometry: {
                                    type: 'LineString',
                                    coordinates: [that.json_line.features[obj.properties.id - 1].geometry.coordinates[0], midpoint_left.geometry.coordinates]
                                },
                                properties: {
                                    id: line_array.features.length,
                                    start: that.json_line.features[obj.properties.id - 1].geometry.coordinates[0],//起始线端坐标
                                    end: midpoint_left.geometry.coordinates,//线末端坐标
                                    now: midpoint_left.geometry.coordinates,//当前坐标
                                    distance: [0, 0], //鼠标拖动时与各端点的距离
                                    angle: [0, 0]//鼠标拖动时与各端点的角度
                                }
                            })
                            line_array.features.push({
                                type: 'Feature',
                                geometry: {
                                    type: 'LineString',
                                    coordinates: [midpoint_left.geometry.coordinates, that.json_line.features[obj.properties.id - 1].geometry.coordinates[1]]
                                },
                                properties: {
                                    id: line_array.features.length,
                                    start: midpoint_left.geometry.coordinates,//起始线端坐标
                                    end: that.json_line.features[obj.properties.id - 1].geometry.coordinates[1],//线末端坐标
                                    now: that.json_line.features[obj.properties.id - 1].geometry.coordinates[1],//当前坐标
                                    distance: [0, 0], //鼠标拖动时与各端点的距离
                                    angle: [0, 0]//鼠标拖动时与各端点的角度
                                }
                            })
                        } else {
                            //插入json_point
                            arry.features.push(that.json_point.features[obj.properties.id - 1])
                            //插入左边的中心点
                            midpoint_left.properties["id"] = arry.features.length
                            midpoint_left.properties["regular"] = false
                            arry.features.push(midpoint_left)
                            that.json_point.features[obj.properties.id].properties.id = arry.features.length
                            arry.features.push(that.json_point.features[obj.properties.id])
                            //插入json_line
                            line_array.features.push({
                                type: 'Feature',
                                geometry: {
                                    type: 'LineString',
                                    coordinates: [that.json_line.features[obj.properties.id - 1].geometry.coordinates[0], midpoint_left.geometry.coordinates]
                                },
                                properties: {
                                    id: line_array.features.length,
                                    start: that.json_line.features[obj.properties.id - 1].geometry.coordinates[0],//起始线端坐标
                                    end: midpoint_left.geometry.coordinates,//线末端坐标
                                    now: midpoint_left.geometry.coordinates,//当前坐标
                                    distance: [0, 0], //鼠标拖动时与各端点的距离
                                    angle: [0, 0]//鼠标拖动时与各端点的角度
                                }
                            })
                            //插入中心线段
                            line_array.features.push({
                                type: 'Feature',
                                geometry: {
                                    type: 'LineString',
                                    coordinates: [midpoint_left.geometry.coordinates, that.json_line.features[obj.properties.id - 1].geometry.coordinates[1]]
                                },
                                properties: {
                                    id: line_array.features.length,
                                    start: midpoint_left.geometry.coordinates,//起始线端坐标
                                    end: that.json_line.features[obj.properties.id - 1].geometry.coordinates[1],//线末端坐标
                                    now: that.json_line.features[obj.properties.id - 1].geometry.coordinates[1],//当前坐标
                                    distance: [0, 0], //鼠标拖动时与各端点的距离
                                    angle: [0, 0]//鼠标拖动时与各端点的角度
                                }
                            })
                        }
                        that.json_point.features = []
                        that.json_point.features = arry.features
                        that.json_line.features = []
                        that.json_line.features = line_array.features
                        that.map.getSource('drew_point').setData(that.json_point)
                        that.map.getSource('drew_line').setData(that.json_line)

                    }

                }


                let feature = e.features[0];
                if (obj.properties.id != 0 && isNewCenter_left) {
                    obj.properties.id = obj.properties.id + 1
                }
                that.map.setFilter('pointlayerhighlight', ['in', 'id', feature.properties.id]);
                //鼠标移动
                that.map.on('mousemove', mousemoveEvent);
                //鼠标抬起
                that.map.once('mouseup', onUp);
                console.log(e);
            }


            function touchstartEvent(e) {
                //防止默认地图拖动行为
                e.preventDefault();
                //触控移动
                that.map.on('touchmove', mousemoveEvent);
                //触控端起
                that.map.once('touchend', onUp);
                console.log(e)
            }


        },
        /**
         * 
         *线、面拖动
         * 
         */
        drewDrag(key) {
            let that = this;
            that.index = key;
            that.map.getCanvas().style.cursor = 'crosshair';
            //let layerId = 'drew_polygon'  //drew_polygon  drew_line
            that.layer_array = new Array
            that.layer_array.push('drew_line')
            that.layer_array.push('drew_polygon')
            for (let index in that.layer_array) {
                if (that.layer_array[index] == "drew_polygon") {
                    that.drewPolygonDrag(that.layer_array[index]);  //移动面
                } else {
                    that.drewLineDreag(that.layer_array[index]); //移动线
                }
            }
        },
        /**
         * 
         * 拖动线原理的实现
         * ① 首先实现需要三个个鼠标事件  mousedown   ， mousemove ，mouseup,还有turf.js（turf）工具（辅助计算长度和距离）,其实这里我有一个大胆想法不用turf直接把放在二维直角坐标系中使用三角公式一样可以做
         *    1：mousedown 用来计算初始layer 各个点到鼠标点的距离和夹角，这是在后续拖动图层可以计算新的各个点的坐标
         *    2：mousemove 使用拖动的坐标点来计算各个点的坐标
         *    3: mouseup   结束拖动  ， 关闭鼠标事件  
         * 
         */
        drewLineDreag(layerId) {
            let that = this;
            //添加鼠标按下事件
            that.map.on('mousedown', layerId, mousedownEvent);
            //添加触控启动事件
            that.map.on('touchstart', layerId, touchstartEvent)

            function mousemoveEvent(e) {
                let coords = [e.lngLat.lng, e.lngLat.lat] //当前坐标 

                //根据点，距离和角度计算目标点
                that.json_line.features.forEach((_e) => {
                    var s_destination = turf.destination(
                        turf.point([e.lngLat.lng, e.lngLat.lat]),
                        _e.properties.distance[0],
                        _e.properties.angle[0], { units: 'degrees' });
                    console.log(s_destination)
                    var e_destination = turf.destination(
                        turf.point([e.lngLat.lng, e.lngLat.lat]),
                        _e.properties.distance[1],
                        _e.properties.angle[1], { units: 'degrees' });
                    console.log(e_destination)
                    _e.geometry.coordinates = [s_destination.geometry.coordinates, e_destination.geometry.coordinates]
                })
                that.map.getSource('drew_line').setData(that.json_line)


                console.log(e + coords);

            }

            function onUp(e) {
                that.map.off('mousemove', mousemoveEvent);
                that.map.off('touchmove', mousemoveEvent);
                that.map.off('mousedown', layerId, mousedownEvent);
                that.map.off('touchstart', layerId, touchstartEvent);
                that.map.off('touchend', onUp);
                that.map.getCanvas().style.cursor = 'grab'
                that.resetBtnStyle()
                console.log(e)
            }

            function mousedownEvent(e) {
                // that.map.getCanvas().style.cursor = 'crosshair';      
                e.preventDefault();//防止默认地图拖动行为。
                //使用turf 计算各个坐标点的长度 和角度
                let data = that.map.getSource('drew_line')._data.features
                console.log(data)
                that.json_point.features = []
                that.json_line.features = []
                data.forEach((_e, index, row) => {
                    console.log(index + row)
                    //计算距离
                    var start_distance = turf.rhumbDistance(
                        turf.point([e.lngLat.lng, e.lngLat.lat]),
                        turf.point(_e.properties.start), { units: 'degrees' });
                    var end_distance = turf.rhumbDistance(
                        turf.point([e.lngLat.lng, e.lngLat.lat]),
                        turf.point(_e.properties.end), { units: 'degrees' });
                    console.log(start_distance + "--" + end_distance)
                    _e.properties.distance[0] = start_distance
                    _e.properties.distance[1] = end_distance

                    // 计算两点间的夹角
                    var s_bearing = turf.bearing(turf.point([e.lngLat.lng, e.lngLat.lat]), turf.point(_e.properties.start));
                    var e_bearing = turf.bearing(turf.point([e.lngLat.lng, e.lngLat.lat]), _e.properties.end);
                    _e.properties.angle[0] = s_bearing
                    _e.properties.angle[1] = e_bearing
                    that.json_line.features.push({
                        type: _e.type,
                        geometry: _e.geometry,
                        properties: _e.properties
                    });
                })

                //鼠标移动
                that.map.on('mousemove', mousemoveEvent);
                //鼠标抬起
                that.map.once('mouseup', onUp);
                console.log(e);
            }

            function touchstartEvent(e) {
                //防止默认地图拖动行为
                e.preventDefault();
                //触控移动
                that.map.on('touchmove', mousemoveEvent);
                //触控端起
                that.map.once('touchend', onUp);
                console.log(e)
            }

        },
        /**
         * 
         * 拖动polygon原理的实现
         * ① 首先实现需要三个个鼠标事件  mousedown   ， mousemove ，mouseup,还有turf.js（turf）工具（辅助计算长度和距离）,其实这里我有一个大胆想法不用turf直接把放在二维直角坐标系中使用三角公式一样可以做
         *    1：mousedown 用来计算初始layer 各个点到鼠标点的距离和夹角，这是在后续拖动图层可以计算新的各个点的坐标
         *    2：mousemove 使用拖动的坐标点来计算各个点的坐标
         *    3: mouseup   结束拖动  ， 关闭鼠标事件  
         * 
         */
        drewPolygonDrag(layerId) {
            let that = this
            //添加鼠标按下事件
            that.map.on('mousedown', layerId, mousedownEvent);
            //添加触控启动事件
            that.map.on('touchstart', layerId, touchstartEvent)

            function mousedownEvent(e) {
                // that.map.getCanvas().style.cursor = 'crosshair';      
                e.preventDefault();//防止默认地图拖动行为。
                //使用turf 计算各个坐标点的长度 和角度
                let data = that.map.getSource('drew_polygon')._data.features
                console.log(data)
                data[0].geometry.coordinates[0].forEach((_e, index, row) => {
                    console.log(index + row)
                    //计算距离
                    var distance = turf.rhumbDistance(
                        turf.point([e.lngLat.lng, e.lngLat.lat]),
                        turf.point(_e), { units: 'degrees' });
                    console.log(distance)

                    // 计算两点间的夹角
                    var bearing = turf.bearing(turf.point([e.lngLat.lng, e.lngLat.lat]),
                        turf.point(_e));
                    that.json_polygon.features[0].properties.distance.push(distance)
                    that.json_polygon.features[0].properties.angle.push(bearing)
                })

                //鼠标移动
                that.map.on('mousemove', mousemoveEvent);
                //鼠标抬起
                that.map.once('mouseup', onUp);
                console.log(e);
            }
            function touchstartEvent(e) {
                //防止默认地图拖动行为
                e.preventDefault();
                //触控移动
                that.map.on('touchmove', mousemoveEvent);
                //触控端起
                that.map.once('touchend', onUp);
                console.log(e)
            }
            function mousemoveEvent(e) {
                let coords = [e.lngLat.lng, e.lngLat.lat] //当前坐标 
                e.preventDefault();//防止默认地图拖动行为。
                //根据点，距离和角度计算目标点
                that.json_polygon.features[0].geometry.coordinates[0].forEach((_e, index) => {
                    var destination = turf.destination(
                        turf.point([e.lngLat.lng, e.lngLat.lat]),
                        that.json_polygon.features[0].properties.distance[index],
                        that.json_polygon.features[0].properties.angle[index], { units: 'degrees' });
                    console.log(destination)
                    that.json_polygon.features[0].geometry.coordinates[0][index] = destination.geometry.coordinates
                })
                that.map.getSource('drew_polygon').setData(that.json_polygon)
                console.log(e + coords);
            }
            function onUp(e) {
                that.map.off('mousemove', mousemoveEvent);
                that.map.off('touchmove', mousemoveEvent);
                that.map.off('mousedown', layerId, mousedownEvent);
                that.map.off('touchstart', layerId, touchstartEvent);
                that.map.off('touchend', onUp);
                that.map.getCanvas().style.cursor = 'grab'
                that.resetBtnStyle()
                console.log(e)
            }

        },
        /**
         * 
         * 清空地图图层和资源
         * 
         */
        clearLayerAndSource(key) {
            let that = this
            key == 7 ? that.index = -1 : ''
            that.dIndex = key;
            that.map.off('click', that.clickEvent)
            that.map.getCanvas().style.cursor = 'pointer';
            that.mapMarkers.forEach((marker) => marker.remove())
            that.mapMarkers = []
            that.json_point.features = []
            that.map.getSource('drew_point').setData(that.json_point);
            that.json_line.features = []
            that.map.getSource('drew_line').setData(that.json_line);
            that.json_line_move.features = []
            that.map.getSource('drew_line_move').setData(that.json_line_move);
            that.json_polygon.features = []
            that.map.getSource('drew_polygon').setData(that.json_polygon);
            that.resetBtnStyle()
            that.json_temporary_point.features = []
            that.map.getSource('drew_temporary_point').setData(that.json_temporary_point)
        },
        /**
         * 
         * 重置按钮样式
         * 
         */
        resetBtnStyle() {
            let that = this
            setTimeout(() => {
                that.dIndex = 0
                that.index = -1
            }, 2000)
        },

    }
}

</script>
<style  lang="scss">
.icon {
    width: 1em;
    height: 1em;
    vertical-align: -0.15em;
    fill: currentColor;
    overflow: hidden;
}

.mapbox-maps {
    width: 100%;
    height: calc(100vh - 50px);
    position: relative;

}

#map {
    width: 100%;
    height: 100%;
    position: absolute;
    top: 0;
    left: 0;
    bottom: 0;
    right: 0;

}

.mapboxgl-canvas {
    outline: none;
}

/* 隐藏mapbox商标 */
.mapboxgl-ctrl-logo {
    display: none;
}

.drew {
    // width: 316px;
    height: 34px;
    border-radius: 0px;
    z-index: 4;
    position: absolute;
    left: 10px;
    top: 10px;
    display: flex;
    flex-direction: row;
    justify-content: space-around;
    align-items: center;
    background: rgba(255, 255, 255, 0.8);
    box-shadow: 0 0 0 2pxrgba 0, 0, 0, 0.1;
}

.text {
    font-size: 14px;
}

//修改文字提示样式
.el-tooltip__popper[x-placement^="bottom"] .popper__arrow {
    border-bottom-color: rgba(148, 147, 147, 0.877) !important;
}

.el-tooltip__popper[x-placement^="bottom"] .popper__arrow:after {
    border-bottom-color: rgba(148, 147, 147, 0.877) !important;
}

.testtooltip {
    background: rgba(148, 147, 147, 0.877) !important;
    box-shadow: 1px 1px 10px 3px #D3D3D6;

}

//修改地图比例尺样式
.mapboxgl-ctrl.mapboxgl-ctrl-scale {
    height: 10px;
    background-color: transparent;
    line-height: 10%;
    text-align: center
}
</style>
