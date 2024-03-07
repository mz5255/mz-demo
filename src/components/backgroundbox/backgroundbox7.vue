<template>
    <svg class="svg-content" :width="w" :height="h">
        <defs>
            <filter id="filter-WBWknQiRDr">
                <feFlood flood-color="#19e5e6"></feFlood>
                <feComposite in2="SourceGraphic" operator="out"></feComposite>
                <feGaussianBlur stdDeviation="5" result="blur"></feGaussianBlur>
                <feOffset dx="0" dy="0" result="offsetblur"></feOffset>
                <feComposite operator="atop" in2="SourceGraphic"></feComposite>
            </filter>
        </defs>
        <polyline class="svg-bg" :fill="bgcolor" filter="" :stroke="bgstroke" stroke-width="1" :points="svgobj.svgbg">
        </polyline>
        <polyline fill="#75d1f0" class="corner-LBLongDec" :points="svgobj.cornerLBLongDec"></polyline>
        <polyline class="corner-LTTriangle" :stroke="stroke" :fill="fill" :points="svgobj.cornerLTTriangle"></polyline>
        <polyline class="corner-RBTriangle" :stroke="stroke" :fill="fill" :points="svgobj.cornerRBTriangle">
        </polyline><!----><!----><!---->
        <polyline class="title-deco" stroke="#19e5e6" fill="#19e5e6" :points="svgobj.titledeco"></polyline>
    </svg>
</template>
<script>
export default {
    data() {
        return {
            svgobj: {
                svgbg: "145, 297 35, 297 3, 265 3, 25 25, 3 257, 3 278, 25 363, 25 375 , 40 375 , 275 375 , 275 353 , 297 145, 297",
                cornerLBLongDec: "3, 200 3, 265 35, 297 100, 297 90, 293 37, 293 7, 263 7, 204 3, 200",
                titledeco: "257,3 278,25 363, 25 375 , 40 360, 28 273,28 257,3",
                cornerLTTriangle: "8, 8 16, 8 8,16 8, 8",
                cornerRBTriangle: "375, 297 375, 284 362, 297 375, 297",
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
            default: "#05192e",
        }
    },
    computed: {

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
    transform: rotateY(180deg);
}
</style>

