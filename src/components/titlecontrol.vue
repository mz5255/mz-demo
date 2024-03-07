<template>
    <div :style="getcss">
        <div class="text" :style="cssstyle">{{ val }}</div>
    </div>
</template>
<script>
export default {
    props: ['w', 'h', 'val', 'cssstyle'],
    computed: {
        getcss() {
            return (
                'overflow:hidden;width:' +
                this.w +
                'px;height:' +
                this.h +
                'px;    '
            )
        },
    },
}
</script>
<style scoped>
.text {
    white-space: nowrap;
}
</style>
