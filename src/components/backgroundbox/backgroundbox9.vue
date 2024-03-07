<template>
    <svg class="svg-content" :width="w" :height="h" :style="getcss">
        <defs>
            <filter id="filter-kZeAxYQpiG">
                <feFlood flood-color="#19e5e6"></feFlood>
                <feComposite in2="SourceGraphic" operator="out"></feComposite>
                <feGaussianBlur stdDeviation="5" result="blur"></feGaussianBlur>
                <feOffset dx="0" dy="0" result="offsetblur"></feOffset>
                <feComposite operator="atop" in2="SourceGraphic"></feComposite>
            </filter>
        </defs>
        <polyline class="svg-bg" :fill="bgcolor" filter="" :stroke="bgstroke" stroke-width="1" :points="svgobj.svgbg">
        </polyline>
        <polyline :fill="fill" :stroke="stroke" points="9,9 60,9 9,60 9,9 9,9"></polyline>
        <polyline class="corner-triangle" :fill="fill" :stroke="stroke" :points="svgobj.cornertriangle">
        </polyline>
        <polyline :stroke="stroke" :points="svgobj.points1"></polyline>
        <polyline :stroke="stroke" :points="svgobj.points2"></polyline>
    </svg>
</template>
<script>
export default {
    data() {
        return {
            svgobj: {
                svgbg: "80, 5 373, 5 373, 270 348, 295 5, 295 5, 80 80, 5",
                cornertriangle: "369,291 369,282 360,291 369,291",
                points1: "80,15 15,80",
                points2: "365, 267 345, 287",

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


