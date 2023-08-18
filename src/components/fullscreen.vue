<template>
    <div title="全屏" class="full-Screen" :style="getfullscreencss" @click="fullScreen()">
        <i :class="isFullScreen ? 'fa fa-compress' : 'fa fa-expand'"></i>
    </div>
</template>
<script>
export default {
    props: {
        h: {
            type: Number,
            default: 30,
        },
        w: {
            type: Number,
            default: 30,
        },
        fullscreencolor: {
            type: String,
            default: '#60dcf7',
        },
        fontsize: {
            type: Number,
            default: 18,
        },
    },
    data() {
        return { isFullScreen: false }
    },
    computed: {
        getfullscreencss() {
            return `width:${this.w - 2}px;height:${this.h - 2}px; font-size:${
                this.fontsize
            }px; --fullscreencolor:${this.fullscreencolor}`
        },
    },
    methods: {
        fullScreen() {
            let isFull =
                document.mozFullScreen ||
                document.fullScreen ||
                document.webkitIsFullScreen ||
                document.webkitFullScreen ||
                document.msFullScreen
            if (!isFull) {
                // documentElement 属性以一个元素对象返回一个文档的文档元素
                var el = document.documentElement
                el.requestFullscreen ||
                el.mozRequestFullScreen ||
                el.webkitRequestFullscreen ||
                el.msRequestFullScreen
                    ? el.requestFullscreen() ||
                      el.mozRequestFullScreen() ||
                      el.webkitRequestFullscreen() ||
                      el.msRequestFullscreen()
                    : null
            } else {
                var exitMethod =
                    document.cancelFullScreen ||
                    document.webkitCancelFullScreen ||
                    document.mozCancelFullScreen ||
                    document.exitFullScreen
                if (exitMethod) {
                    exitMethod.call(document)
                } else if (typeof window.ActiveXObject !== 'undefined') {
                    var wscript = new window.ActiveXObject('WScript.Shell')
                    if (wscript != null) {
                        wscript.SendKeys('{F11}')
                    }
                }
            }
            this.isFullScreen = !isFull
        },
    },
}
</script>
<style scoped>
.full-Screen {
    color: var(--fullscreencolor);
    display: flex;
    justify-content: center;
    align-items: Center;
    border: 1px solid var(--fullscreencolor);
}
</style>