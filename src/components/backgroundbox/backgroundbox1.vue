<template>
    <svg class="svg-content false" :width="w" :height="h">
        <defs>
            <filter id="filter-dEQHDxhsEc">
                <feFlood flood-color="#19e5e6"></feFlood>
                <feComposite in2="SourceGraphic" operator="out"></feComposite>
                <feGaussianBlur stdDeviation="5" result="blur"></feGaussianBlur>
                <feOffset dx="0" dy="0" result="offsetblur"></feOffset>
                <feComposite operator="atop" in2="SourceGraphic"></feComposite>
            </filter>
        </defs>
        <polygon class="svg-bg" fill="#05192e" filter="" :points="svgobj.svgbg"></polygon>
        <circle fill="#75d1f0" cx="5" cy="5" :r="r"></circle>
        <circle fill="#75d1f0" :cx="x" cy="5" :r="r"></circle>
        <circle fill="#75d1f0" :cx="x" :cy="y" :r="r"></circle>
        <circle fill="#75d1f0" cx="5" :cy="y" :r="r"></circle>
        <polyline stroke="#0f4c8a" stroke-width="1" :points="svgobj.polygon1"></polyline>
        <polyline stroke="#0f4c8a" stroke-width="1" :points="svgobj.polygon2"></polyline>
        <polyline stroke="#0f4c8a" stroke-width="1" :points="svgobj.polygon3"></polyline>
        <polyline stroke="#0f4c8a" stroke-width="1" :points="svgobj.polygon4"></polyline>
        <polyline stroke="#19e5e6" :points="svgobj.polygon5"></polyline>
        <polyline stroke="#19e5e6" :points="svgobj.polygon6"></polyline>
        <polyline class="short-line" :stroke-width="linew" stroke="#19e5e6" :points="svgobj.polygon7"></polyline>
        <polyline class="short-line" :stroke-width="linew" stroke="#19e5e6" :points="svgobj.polygon8"></polyline>
        <polyline class="short-line" :stroke-width="linew" stroke="#19e5e6" :points="svgobj.polygon9"></polyline>
        <polyline class="short-line" :stroke-width="linew" stroke="#19e5e6" :points="svgobj.polygon10"></polyline>
    </svg>
</template>
<script>
export default {
    data() {
        return {
            svgobj: {
                svgbg: "3, 3 375, 3 375, 297 3, 297",
                polygon1: "10, 4 368, 4",
                polygon2: "10, 296 368, 296",
                polygon3: "3, 290 3, 10",
                polygon4: "375, 290 375, 10",
                polygon5: "3, 60 3, 240",
                polygon6: "375, 60 375, 240",
                polygon7: "375, 50 375, 100",
                polygon8: "3, 50 3, 100",
                polygon9: "3, 250 3, 200",
                polygon10: "375, 250 375, 200"

            },
            oldw: 378,
            oldh: 300,
            r: 3,
            linew: 3,
            x: 373,
            y: 295
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
            this.x = this.w - (width - this.x)
            this.y = this.h - (height - this.y)
            this.linew = 5
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


