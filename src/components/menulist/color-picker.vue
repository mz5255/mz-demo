<template>
    <div :style="stylecss">
        <div @click="deleteItem()">
            <nxsvgicon iconClass="el-icon-delete-solid" className="el-icon-delete-solid " class="delete-icon-class">
            </nxsvgicon>
        </div>
        <div class="colorPicker" @click="selectColor">
            <div class="title">
                {{ value }}
            </div>
            <el-color-picker ref="colorPickerRef" v-model="valueC" @change="onColorChange" show-alpha v-bind="$attrs"
                v-on="$listeners"></el-color-picker>
        </div>
    </div>
</template>
<script>
import nxsvgicon from '@/icons/index.vue'
export default {
    props: {
        value: String,
    },
    data() {
        return {}
    },
    components: { nxsvgicon },
    computed: {
        valueC: {
            get() {
                return this.value
            },
            set(val) {
                this.$emit('input', val)
            }
        },
        stylecss() {
            return `background-color:${this.value};color:${this.invertRgbColor(this.value)}`
        }
    },

    methods: {
        onColorChange(color) {
            this.$emit('colorChange', color)
        },
        selectColor() {
            this.$emit('colorChange', this.value)
            this.$refs.colorPickerRef.handleTrigger()
        },
        invertRgbColor(rgbColor) {
            if (rgbColor != null && rgbColor == undefined) {
                return ""
            }
            var parts = rgbColor.replace(/rgba|\(|\)/g, '').replace(/rgb|\(|\)/g, "").split(',');
            var r = 255 - parseInt(parts[0]);
            var g = 255 - parseInt(parts[1]);
            var b = 255 - parseInt(parts[2]);

            // 确保新的值在合法范围内 (0 到 255)
            r = Math.max(0, Math.min(r, 255));
            g = Math.max(0, Math.min(g, 255));
            b = Math.max(0, Math.min(b, 255));

            return 'rgb(' + r + ',' + g + ',' + b + ')';
        },
        deleteItem() {
            this.$emit("deleteItem")
        }
    }

}
</script>
<style scoped>
.colorPicker>>>.el-color-picker--small .el-color-picker__trigger {
    display: none;
}

.colorPicker .title {
    position: absolute;
    top: 0px;
    z-index: 1;
    left: 0px;
    width: 100%;
    text-align: center;
    font-size: 12px;
    font-weight: bold;
}

.delete-icon-class {
    position: absolute;
    right: -15px;
    top: -11px;
    color: white;
    cursor: pointer;

}
</style>