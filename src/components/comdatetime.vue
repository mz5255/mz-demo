<template>
    <div>{{ datetime }}</div>
</template>
<script>
import moment from 'moment'
export default {
    props: {
        format: {
            type: String,
            required: true,
            default() {
                return 'YYYY-MM-DD HH:mm:ss'
            },
        },
    },
    data() {
        return { datetime: '', timer: null }
    },
    created() {
        let $this = this
        this.datetime = moment().format(this.format)
        this.timer = setInterval(() => {
            $this.datetime = moment().format(this.format)
        }, 1000)
    },
    beforeDestroy() {
        clearInterval(this.timer) // 清除定时器
        this.timer = null
    },
}
</script>
