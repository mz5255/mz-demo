<template>
    <div>
        <el-container style="height: 100%">
            <el-aside width="176px" class="map-toolbar">
                <el-menu default-active="1" class="toolbar">
                    <el-submenu index="1">
                        <template slot="title">
                            <i class="el-icon-menu"></i> 菜单
                        </template>
                        <el-menu-item index="1-1" @click="exportMarkerData">导出</el-menu-item>
                    </el-submenu>
                </el-menu>
            </el-aside>
            <el-main>
                <div id="map"></div>
            </el-main>
        </el-container>

        <div v-if="showMenu" class="marker-menu" :style="{ top: menuTop + 'px', left: menuLeft + 'px' }">
            <a href="#" @click="deleteMarker">删除</a>
        </div>
    </div>
</template>

<script>
import mapboxgl from "mapbox-gl";
import "mapbox-gl/dist/mapbox-gl.css";
export default {
    data() {
        return {
            map: null,
            markers: [],
            markerCoordinates: [],
            showMenu: false,
            menuTop: 0,
            menuLeft: 0,
            selectedMarker: null,
        };
    },
    mounted() {
        mapboxgl.accessToken = "pk.eyJ1IjoieGlhb3poYW5naiIsImEiOiJjbDVwNm9zN2owdTgxM2RuemVobm51Nzd3In0.8qLyL04Wpoir1_YutPa7kw";
        this.map = new mapboxgl.Map({
            container: 'map',
            style: {
                version: 8,
                sources: {
                    "raster-tiles": {
                        attribution: "",
                        type: "raster",
                        tiles: ["https://ibasemaps-api.arcgis.com/arcgis/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}?token=Your%20apiKey"],
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
            center: [113, 34],
            zoom: 4,
        });

        this.map.on('click', (e) => {
            const newMarker = new mapboxgl.Marker().setLngLat(e.lngLat)
                .addTo(this.map);
            this.markers.push(newMarker);
            this.markerCoordinates.push(e.lngLat);

            newMarker.getElement().addEventListener('contextmenu', (ev) => {
                ev.preventDefault();
                this.showMarkerMenu(ev, newMarker, e.lngLat);
            });
        });
    },
    methods: {
        exportMarkerData() {
            const data = {
                markers: this.markerCoordinates,
            };
            const jsonData = JSON.stringify(data, null, 2);
            const blob = new Blob([jsonData], { type: 'application/json' });
            const url = URL.createObjectURL(blob);
            const a = document.createElement('a');
            a.href = url;
            a.download = 'marker-data.json';
            document.body.appendChild(a);
            a.click();
            document.body.removeChild(a);
        },
        showMarkerMenu(ev, marker) {
            debugger
            this.menuTop = ev.clientY;
            this.menuLeft = ev.clientX;
            this.selectedMarker = marker;
            this.showMenu = true;
            window.onclick = (event) => {
                if (!event.target.matches('.marker-menu')) {
                    this.closeMenu();
                }
            };
        },
        deleteMarker() {
            const index = this.markers.indexOf(this.selectedMarker);
            if (index !== -1) {
                this.markers.splice(index, 1);
                this.markerCoordinates.splice(index, 1);
                this.selectedMarker.remove();
                this.closeMenu();
            }
        },
        closeMenu() {
            this.showMenu = false;
            window.onclick = null;
        },
    },
};
</script>

<style>
#map {
    width: 1200px;
    height: 600px;
}

.marker-menu {
    display: block;
    position: fixed;
    padding: 5px;
    background-color: white;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.map-toolbar {
    position: absolute;
    top: 0px;
    left: 0px;
    z-index: 11;
}
</style>