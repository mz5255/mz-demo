<template>
    <div :style="numcss" class="box"></div>
</template>
<script>
export default {
    props: ['w', 'h', 'backgroundcolor', 'borderradius'],
    computed: {
        numcss() {
            return {
                width: this.w + 'px',
                height: this.h + 'px',
                backgroundColor: this.backgroundcolor,
                borderRadius: this.borderradius

            }
        },
    },
}
</script>

