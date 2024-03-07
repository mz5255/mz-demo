<template>
    <svg class="svg-content false" :style="getcss" :width="w" :height="h">
        <defs>
            <filter id="filter-TkfrENebeZ">
                <feFlood flood-color="#19e5e6"></feFlood>
                <feComposite in2="SourceGraphic" operator="out"></feComposite>
                <feGaussianBlur stdDeviation="5" result="blur"></feGaussianBlur>
                <feOffset dx="0" dy="0" result="offsetblur"></feOffset>
                <feComposite operator="atop" in2="SourceGraphic"></feComposite>
            </filter>
        </defs>
        <defs>
            <linearGradient id="gradient-TkfrENebeZ" x1="0%" y1="0%" x2="100%" y2="100%">
                <animate attributeName="x1" values="0%;100%;0%" dur="3" begin="0s" repeatCount="indefinite"></animate>
                <animate attributeName="x2" values="100%;0%;100%" dur="3" begin="0s" repeatCount="indefinite"></animate>
                <stop offset="0%" stop-color="#75d1f0">
                    <animate attributeName="stop-color" values="#75d1f0;#19e5e6;#75d1f0" dur="3" begin="0s"
                        repeatCount="indefinite"></animate>
                </stop>
                <stop offset="100%" stop-color="#19e5e6">
                    <animate attributeName="stop-color" values="#19e5e6;#75d1f0;#19e5e6" dur="3" begin="0s"
                        repeatCount="indefinite"></animate>
                </stop>
            </linearGradient>
            <mask id="mask-TkfrENebeZ">
                <polyline fill="#fff" :points="svgobj.polygon1"></polyline>
                <polyline :stroke="stroke" fill="#fff" :points="svgobj.polygon2"></polyline>
                <polyline :fill="fill" :points="svgobj.polygon3"></polyline>
            </mask>
        </defs>
        <polygon class="svg-bg" :fill="bgcolor" :stroke="bgstroke" :stroke-width="borderWidth" filter=""
            :points="svgobj.svgbg">
        </polygon>
        <rect x="0" y="0" :width="w" :height="h" fill="url(#gradient-TkfrENebeZ)" mask="url(#mask-TkfrENebeZ)"></rect>
    </svg>
</template>
<script>
export default {
    data() {
        return {
            svgobj: {
                svgbg: "4,4 374,4 374,296 258,296 250,287 127,287 119,296 4,296 4,4",
                polygon1: "3, 30 3, 3 47, 3 40, 5 5, 5 5, 260 5, 295 43, 295 50, 297 50, 297 3, 297 3, 30",
                polygon2: "331, 3 375, 3 375, 297 328, 297 335, 295 373, 295 373, 5 338, 5 331, 3",
                polygon3: "132, 292 245, 292 252, 297 125,297",

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


