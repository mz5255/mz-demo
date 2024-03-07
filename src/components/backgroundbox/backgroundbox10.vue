<template>
    <div class="svg-content">
        <svg class="svg-content false" :width="w" :height="h">
            <defs>
                <filter id="filter-rWHAPiPbrT">
                    <feFlood flood-color="#19e5e6"></feFlood>
                    <feComposite in2="SourceGraphic" operator="out"></feComposite>
                    <feGaussianBlur stdDeviation="5" result="blur"></feGaussianBlur>
                    <feOffset dx="0" dy="0" result="offsetblur"></feOffset>
                    <feComposite operator="atop" in2="SourceGraphic"></feComposite>
                </filter>
            </defs>
            <polygon class="svg-bg" :fill="bgcolor" :stroke="bgstroke" :stroke-width="borderWidth" filter=""
                :points="svgobj.svgbg">
            </polygon>
            <polygon :fill="fill" stroke-width="1" :points="svgobj.polygon1"></polygon>
            <polygon :fill="fill" stroke-width="1" :points="svgobj.polygon2"></polygon>


        </svg><svg :fill="fill" class="svg-corner corner-topLeft" width="50" height="50">
            <polygon points="0 0 30 0 25 4 4 4 4 25 0 30"></polygon>
        </svg> <svg :fill="fill" class="svg-corner corner-topRight" width="50" height="50">
            <polygon points="0 0 30 0 25 4 4 4 4 25 0 30"></polygon>
        </svg><svg :fill="fill" class="svg-corner corner-bottomLeft" width="50" height="50">
            <polygon points="0 0 30 0 25 4 4 4 4 25 0 30"></polygon>
        </svg><svg :fill="fill" class="svg-corner corner-bottomRight" width="50" height="50">
            <polygon points="0 0 30 0 25 4 4 4 4 25 0 30"></polygon>
        </svg>
    </div>
</template>
<script>
export default {
    data() {
        return {
            svgobj: {
                svgbg: "3,3 375,3 375,90 370,100 370,200 375,210 375,297 3,297 3,210 8,200 8,100 3,90",
                polygon1: "0,205 0,95 4,102 4,198",
                polygon2: "378,95 378,205 374,198 374,102",
                polygon3: "0,205 0,95 4,102 4,198",

            },
            oldw: 378,
            oldh: 300
        }
    },
    props: {
        w: {
            type: Number,
            default: 378,
        },
        h: {
            type: Number,
            default: 300,
        },
        stroke: {
            type: String,
            default: "#19e5e6",
        },
        fill: {
            type: String,
            default: "#19e5e6",
        },
        bgcolor: {
            type: String,
            default: "#05192e",
        },
        bgstroke: {
            type: String,
            default: "#0f4c8a",
        },
        boxtype: {
            type: String,
            default: "#0f4c8a",
        },
        borderWidth: {
            type: Number,
            default: 3,
        }
    },
    computed: {
        getcss() {
            switch (this.boxtype) {
                case "1": return "";
                case "2": return "transform: rotateX(180deg);";
                case "3": return "transform: rotatey(180deg);";
                case "4": return "transform: rotate(180deg);";
            }
            return ""
        },
    },
    created() {
        this.loadSvg()
    },
    methods: {
        loadSvg() {
            let width = this.oldw
            let height = this.oldh
            for (let key in this.svgobj) {
                this.svgobj[key] = this.bgsvg(width, height, this.w, this.h, this.svgobj[key])
            }
            this.oldw = this.w
            this.oldh = this.h
        },
        bgsvg(w, h, neww, newh, str) {
            let attrs = str.split(",")
            let newpoints = []
            for (let j = 0; j < attrs.length; j++) {
                if (attrs[j].trim().indexOf(' ') >= 0) {
                    let pointitems = attrs[j].trim().split(' ')
                    let newpoint = ""
                    if ((h - Number(pointitems[0])) > h / 2) {
                        newpoint = newpoint + " " + pointitems[0]
                    } else {
                        newpoint = newpoint + (newh - (h - Number(pointitems[0])))
                    }
                    if ((w - Number(pointitems[1])) > w / 2) {
                        newpoint = newpoint + " " + pointitems[1]
                    } else {
                        newpoint = newpoint + " " + (neww - (w - Number(pointitems[1])))
                    }
                    newpoints.push(newpoint)
                } else {
                    if (j == 0) {
                        if ((w - Number(attrs[j].trim())) > w / 2) {
                            newpoints.push(attrs[j].trim())
                        } else {
                            newpoints.push(neww - (w - Number(attrs[j].trim())))
                        }
                    } else {
                        if ((h - Number(attrs[j].trim())) > h / 2) {
                            newpoints.push(attrs[j].trim())
                        } else {
                            newpoints.push(newh - (h - Number(attrs[j].trim())))
                        }
                    }
                }
            }
            return newpoints.join(",")
        }
    },
    watch: {
        w() {
            this.loadSvg()
        },
        h() {
            this.loadSvg()
        }
    }
}
</script>
<style scoped>
.svg-content {
    position: relative;
    display: inline-block;
}

.svg-corner {
    position: absolute;
}

.corner-topLeft {
    left: 2px;
    top: 2px;
}

.corner-topRight {
    right: 2px;
    top: 2px;
    transform: rotate(90deg);
}

.corner-bottomLeft {
    left: 2px;
    bottom: 7px;
    transform: rotate(-90deg);
}

.corner-bottomRight {
    right: 2px;
    bottom: 7px;
    transform: rotate(180deg);
}
</style>


