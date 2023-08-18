<template>
    <dv-digital-flop :config="config" :style="numcss" />
</template>
<script>
export default {
    props: [
        'num',
        'content',
        'w',
        'h',
        'toFixed',
        'fontSize',
        'textAlign',
        'color',
    ],
    data() {
        return {
            config: {
                number: [0],
                toFixed: this.toFixed == undefined ? 0 : this.toFixed,
                textAlign:
                    this.textAlign == undefined ? 'left' : this.textAlign,
                content: this.content == undefined ? '{nt}' : this.content,
                style: {
                    fontSize: this.fontSize === undefined ? 26 : this.fontSize,
                    fill: this.color === undefined ? '#3de7c9' : this.color,
                },
            },
        }
    },
    computed: {
        numcss() {
            return {
                width: this.w + 'px',
                height: this.h + 'px',
            }
        },
    },
    created() {
        let $this = this
        setTimeout(() => {
            $this.numberGrow(this.num)
        }, 500)
    },
    methods: {
        numberGrow(num) {
            this.config = {
                number: [num],
                toFixed: this.toFixed == undefined ? 0 : this.toFixed,
                textAlign:
                    this.textAlign == undefined ? 'left' : this.textAlign,
                content: this.content == undefined ? '{nt}' : this.content,
                style: {
                    fontSize: this.fontSize === undefined ? 26 : this.fontSize,
                    fill: this.color === undefined ? '#3de7c9' : this.color,
                },
            }
            this.config = JSON.parse(JSON.stringify(this.config))
        },
    },
    watch: {
        num: {
            deep: true, //深度监听设置为 true
            handler: function() {
                this.numberGrow(this.num)
            },
        },
        content() {
            this.numberGrow(this.num)
        },
        textAlign() {
            this.numberGrow(this.num)
        },
        toFixed() {
            this.numberGrow(this.num)
        },
        fontSize() {
            this.numberGrow(this.num)
        },
        numberGrow() {
            this.numberGrow(this.num)
        },
        color() {
            this.numberGrow(this.num)
        },
        w() {
            this.numberGrow(this.num)
        },
        h() {
            this.numberGrow(this.num)
        },
    },
}
</script>
