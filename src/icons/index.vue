<template>
    <svg :class="svgClass" aria-hidden="true" v-if="iconlist.indexOf(iconClass) >= 0">
        <use :xlink:href="iconName"></use>
    </svg>
    <i v-else class="svg-icon" :class="iconClass"></i>
</template>

<script>
import { icons } from './config.js'
export default {
    name: 'nx-svg-icon',
    props: {
        iconClass: {
            type: String,
            required: true,
        },
        className: {
            type: String,
        },
        title: {
            type: String,
        },
    },
    data() {
        return { iconlist: icons }
    },
    computed: {
        iconName() {
            return `#icon-${this.iconClass}`
        },
        svgClass() {
            if (this.className) {
                return 'svg-icon ' + this.className
            }
            return 'svg-icon'
        },
    },
}
</script>

<style scoped>
.svg-icon {
    width: 1em;
    height: 1em;
    vertical-align: -0.15em;
    fill: currentColor;
    overflow: hidden;
    margin: 3px;
}
</style>
