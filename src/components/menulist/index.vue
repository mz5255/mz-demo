<template>
    <div>
        <div class="menulist" @click="propertykeyshow = !propertykeyshow" :style="bgcolor">
            <i class="icon" :class="propertykeyshow ? 'el-icon-arrow-down' : 'el-icon-arrow-right'"></i>
            <div title="更多设置" class=" head-btn mr4" @click.stop="openBgCssConfig()">
                <nxsvgicon iconClass="el-icon-s-tools" className="el-icon-s-tools" style="font-size: 18px;"></nxsvgicon>
            </div>
            <div class="selectitem" v-if="propertykeyshow">
                <div v-for="item in datalist" :key="item" class="item" @click="change(item)"
                    :style="item + ' width: 100%;height:35px'"></div>
            </div>

        </div>
        <el-dialog title="css背景设置" :visible.sync="cssConfigVisible" v-if="cssConfigVisible" center :modal="true">
            <bgcssconfig :backgroundcolors="bgcolor" ref="bgcssconfigRef"></bgcssconfig>
            <span slot="footer" class="dialog-footer">
                <el-button type="primary" @click="saveBackgroundGradient">确 定</el-button>
                <el-button @click="cssConfigVisible = false">关闭</el-button>
            </span>

        </el-dialog>
    </div>
</template>
<script>
import bgcssconfig from './bg-css-config.vue'
import nxsvgicon from '@/icons/index.vue'
export default {
    props: { value: [String, Number], datalist: Array },
    components: { nxsvgicon, bgcssconfig },
    data() {
        return { propertykeyshow: false, cssConfigVisible: false }
    },
    created() { },
    computed: {
        bgcolor: {
            get() {
                return this.value
            },
            set(v) {
                // this.$emit('change', v)
                this.$emit('input', v)
            },
        },
    },
    methods: {
        change(item) {
            this.bgcolor = item
            this.$emit('update:value', item)
        },
        openBgCssConfig() {
            this.cssConfigVisible = true;
        },
        saveBackgroundGradient() {
            let bgcolor = this.$refs.bgcssconfigRef.saveBackgroundGradient();
            if (bgcolor == '') {
                return
            }
            this.bgcolor = bgcolor
            this.cssConfigVisible = false;
        }
    },
}
</script>
<style scoped>
.menulist {
    height: 32px;
    width: 90%;
    padding: 4px;
    border: 1px solid #0a8efb;
    border-radius: 4px;
    float: left;
    position: relative;
    display: flex;
}

.menulist .icon {
    right: 33px;
    padding-right: 8px;
    padding-top: 5px;
    position: absolute;
}

.menulist .head-btn {
    position: absolute;
    right: 8px;
}

.selectitem {
    width: 200px;
    max-height: 250px;
    position: absolute;
    overflow-x: auto;
    z-index: 700;
    top: 28px;
    left: 0px;
}

.selectitem .item:hover {}
</style>
