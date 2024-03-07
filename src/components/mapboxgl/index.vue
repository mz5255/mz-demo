<template>
  <div id="mapBox" :style="getcss" v-loading="loading"></div>
</template>

<script>
import mapboxgl from "mapbox-gl";
import "mapbox-gl/dist/mapbox-gl.css";
export default {
  props: {
    w: {
      type: Number,
      default: 500,
    },
    h: {
      type: Number,
      default: 500,
    },
    center: {
      type: Array,
      default() {
        return [114.298572, 30.584355];
      },
    },
    pitch: {
      type: Number,
      default: 0,
    },
    defaultzoom: {
      type: Number,
      default: 14,
    },
    mapurl: {
      type: String,
      default:
        "https://ibasemaps-api.arcgis.com/arcgis/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}?token=Your%20apiKey",
    },
    isreadonly: {
      type: Boolean,
      default: false
    },
    isload3d: {
      type: Boolean,
      default: false
    },
    city3durl: {
      type: String,
      default: "/FeaturesToJSON5.json"
    },
    markerdatalist: {
      type: Array,
      default() {
        return [];
      },
    },
    textdatalist: {
      type: Array,
      default() {
        return [];
      },
    }
  },
  computed: {
    getcss() {
      if (this.map != null) {
        this.$nextTick(() => {
          this.map.resize();
        });
      }
      return `width:${this.w}px;height:${this.h}px; `;
    },
  },
  data() {
    return {
      loading: false,
      layers: [],
      sources: [],
      map: {},
      markerPopuplist: [],
      titlePopuplist: []
    };
  },
  mounted() {
    this.loadMap();
  },
  methods: {
    loadMap() {
      mapboxgl.accessToken =
        "pk.eyJ1IjoieGlhb3poYW5naiIsImEiOiJjbDVwNm9zN2owdTgxM2RuemVobm51Nzd3In0.8qLyL04Wpoir1_YutPa7kw";
      var attribution = "";
      var map = new mapboxgl.Map({
        container: document.getElementById("mapBox"), // 容器必须有明确的宽和高
        style: {
          version: 8,
          sources: {
            "raster-tiles": {
              attribution: attribution,
              type: "raster",
              tiles: [this.mapurl],
              tileSize: 256,
            },
          },
          layers: [
            {
              id: "simple-tiles",
              type: "raster",
              source: "raster-tiles",
              minzoom: 0,
              maxzoom: 22,
            },
          ],
        },
        center: this.center,
        zoom: this.defaultzoom,
        pitch: this.pitch,
        bearing: 0,
        renderingMode: "3d",
      });
      this.map = map;
      var nav = new mapboxgl.NavigationControl();
      this.map.addControl(nav, "bottom-right");
      let $this = this;
      map.on("style.load", function () {
        $this.loadCity3D();
        $this.loadText();
        $this.loadMarker();
      });
      this.setReadOnly();

    },
    switchMapimg() {
      this.map.setStyle({
        version: 8,
        sources: {
          "raster-tiles": {
            attribution: "",
            type: "raster",
            tiles: [this.mapurl],
            tileSize: 256,
          },
        },
        layers: [
          {
            id: "simple-tiles",
            type: "raster",
            source: "raster-tiles",
            minzoom: 0,
            maxzoom: 22,
          },
        ],
      });
    },
    loadCity3D() {
      if (this.isload3d && this.city3durl != '') {
        this.loading = true;
        let that = this
        window.$.get(this.city3durl, (res) => {
          this.loading = false;
          that.addBoxLayer(res)
        })
      }
    },
    setReadOnly() {
      if (this.isreadonly === false) {
        this.map.dragPan._inertiaOptions = true;
        this.map.dragPan._mousePan._enabled = true;
        this.map.dragPan._touchPan._enabled = true;
        this.map.dragRotate._pitchWithRotate = true;
        this.map.dragRotate._mouseRotate._enabled = true;
        this.map.dragRotate._mousePitch._enabled = true;
        this.map.scrollZoom._enabled = true;
      } else {
        this.map.dragPan._inertiaOptions = false;
        this.map.dragPan._mousePan._enabled = false;
        this.map.dragPan._touchPan._enabled = false;
        this.map.dragRotate._pitchWithRotate = false;
        this.map.dragRotate._mouseRotate._enabled = false;
        this.map.dragRotate._mousePitch._enabled = false;
        this.map.scrollZoom._enabled = false;
      }
    },
    async addBoxLayer(feature) {
      let that = this;

      if (this.map.getLayer("entity_layer")) {
        this.map.removeLayer("entity_layer");
      }

      feature.features.forEach((item) => {
        let he = ""; //默认建筑物高度
        if (item.properties.height == "") {
          he = "5";
        } else {
          he = item.properties.height;
        }
        //模拟数据
        item.properties.pkid = parseInt(item.properties.FID);
        item.properties.height = parseInt(he);
        item.properties.base_height = parseInt(0);
      });

      let geojson = {
        type: "FeatureCollection",
        features: feature.features,
      };
      if (this.map.getSource("states")) {
        this.map.getSource("states").setData(geojson);
      } else {
        this.map.addSource("states", {
          type: "geojson",
          data: geojson,
        });
      }

      this.map.addLayer({
        id: "entity_layer",
        source: "states",
        type: "fill-extrusion",
        layout: {},
        minzoom: 14,
        paint: {
          "fill-extrusion-color": "#123984",
          // use an 'interpolate' expression to add a smooth transition effect to the
          // buildings as the user zooms in
          // 'fill-extrusion-height': ['get', 'height'],
          // 'fill-extrusion-base': ['get', 'base_height'],
          "fill-extrusion-height": [
            "interpolate",
            ["linear"],
            ["zoom"],
            14,
            0,
            14.05,
            ["get", "height"],
          ],
          "fill-extrusion-base": [
            "interpolate",
            ["linear"],
            ["zoom"],
            14,
            0,
            14.05,
            ["get", "base_height"],
          ],
          "fill-extrusion-opacity": 1,
          // 'fill-extrusion-pattern': 'catcat',
        },
        callback: {},
      });
      let popups = new mapboxgl.Popup({
        closeButton: false,
        closeOnClick: false,
      });

      this.map.on("mousemove", "entity_layer", function (e) {
        that.map.getCanvas().style.cursor = "pointer";
        let feature = e.features[0];
        //建筑物弹窗信息
        let xmmc = "";
        if (
          feature.properties.XMMC !== undefined &&
          feature.properties.XMMC.length > 35
        ) {
          let a1 = feature.properties.XMMC.substring(0, 35);
          let a2 = feature.properties.XMMC.substring(
            35,
            feature.properties.XMMC.length
          );
          xmmc =
            "<h1 style='color: white'><a style='color: orange'>" +
            a1 +
            "<br>" +
            a2 +
            " (" +
            feature.properties.JZWMC +
            ")</a></h1>";
        } else {
          xmmc =
            "<h1 style='color: white'><a style='color: orange'>" +
            feature.properties.XMMC +
            " (" +
            feature.properties.JZWMC +
            ")</a></h1>";
        }
        //建筑物弹窗信息
        let html =
          xmmc +
          "<h2 style='color: white'> 建筑物用途：<a style='color: orange'>" +
          feature.properties.JZWJBYT +
          "</a> </h2>" +
          "<h2 style='color: white'> 建筑物高度：<a style='color: orange'>" +
          feature.properties.JZWGD +
          " 米</a></h2>" +
          "<h2 style='color: white'> 维修单位：<a style='color: orange'>" +
          feature.properties.WXDW +
          "</a> </h2>" +
          "<h2 style='color: white'> 物业公司：<a style='color: orange'>" +
          feature.properties.WYGSMC +
          "</a></h2>" +
          "<h2 style='color: white'> 坐落：<a style='color: orange'>" +
          feature.properties.ZL +
          "</a> </h2>";

        popups
          .setLngLat([feature.properties.X, feature.properties.Y])
          .setHTML(html)
          .addTo(that.map);
      });

      that.map.on("mouseleave", "entity_layer", function () {
        that.map.getCanvas().style.cursor = "";
        // that.map.setFilter('entity_borders', ['in', 'pkid', ''])
        that.map.remove();
      });
    },
    loadMarker() {
      this.markerAllRemove();
      this.markerdatalist.forEach((dataitem) => {
        if (dataitem.Coords != null && dataitem.Coords instanceof Array && dataitem.Coords.length > 1) {
          let arrowIcon = new Image(25, 41)
          if (dataitem.icons == null || dataitem.icons == '') {
            arrowIcon.src = require('@/assets/marker.png')
          } else {
            arrowIcon.src = dataitem.icons
          }
          $(arrowIcon).attr("title", dataitem.name)
          // arrowIcon.attributes.add("title", dataitem.name)
          let shoppingMall = new mapboxgl.Marker(arrowIcon, {
            x: -32,
            y: -54,
          })
            .setLngLat(dataitem.Coords)
            .addTo(this.map)
          this.markerPopuplist.push(shoppingMall)
        }
      })
    },
    loadText() {
      this.textAllRemove();
      this.textdatalist.forEach((dataitem) => {
        if (dataitem.Coords != null && dataitem.Coords instanceof Array && dataitem.Coords.length > 1) {
          let titlePopup = new mapboxgl.Popup({
            anchor: 'bottom',
            closeButton: false,
            closeOnClick: false,
            className: 'quyu-text',
            minzoom: 12,
            offset: {
              bottom: [-10, 20],
            },
          })
          // titlePopup.attr('style', 'pointer-events: none')
          if (dataitem.temphtml != null && dataitem.temphtml != '') {
            titlePopup.setHTML(dataitem.temphtml)
          } else {
            titlePopup.setHTML(
              `<div style="font-size: 12px;line-height:20px;">${dataitem.name}</div><div style="font-size: font-size: 12px;line-height:20px;line-height:20px;font-weight: bold;">${dataitem.num}</div>                `
            )
          }
          titlePopup.setLngLat(dataitem.Coords)
          titlePopup.addTo(this.map)
          this.titlePopuplist.push(titlePopup)
        }
      })
    },
    textAllRemove() {
      this.titlePopuplist.forEach((ee) => {
        ee.remove()
      })
    },
    markerAllRemove() {
      this.markerPopuplist.forEach((ee) => {
        ee.remove()
      })
    },
  },
  watch: {
    textdatalist() {
      this.loadText()
    },
    markerdatalist() {
      this.markerDataList();
    },
    isload3d() {
      // this.loadCity3D();
    },
    pitch() {
      this.map.flyTo({ pitch: this.pitch })
    },
    mapurl() {
      this.switchMapimg()
    }
  }
}
</script>

<style></style>
