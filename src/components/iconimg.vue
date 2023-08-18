<template>
    <div class="iconimg" :style="getcss"></div>
</template>
<script>
export default {
    props: {
        iconclass: {
            type: String,
            required: true,
            default: '',
        },
    },
    computed: {
        getcss() {
            return `background-image: url(/temp/${this.iconclass});`
        },
    },
}
</script>
<style scoped>
.iconimg {
    width: 100%;
    height: 100%;
    background-repeat: no-repeat; /* 防止图像重复出现 */
    background-size: contain;
}
</style>