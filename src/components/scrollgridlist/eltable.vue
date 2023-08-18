<template>
    <div :style="getseamlesscss">
        <el-table :data="[]" style="width: 100%;float: left;" :style="gettablecss" class="headtable" v-if="isheadshow">
            <el-table-column :prop="item.prop" :label="item.label" :width="item.width" v-for="item in elcolumn" :key="item.prop">
            </el-table-column>
        </el-table>
        <vueSeamlessScroll :data="tabledata" :class-option="getoptionconfig" class="seamless-warp" :style="
                isheadshow
                    ? 'height: calc(100% - 30px);'
                    : '  height: calc(100% );'
            ">
            <el-table :data="tabledata" style="width: 100%;" :style="gettablecss" :show-header="false">
                <el-table-column :prop="item.prop" :label="item.label" :width="item.width" v-for="item in elcolumn" :key="item.prop">
                </el-table-column>
            </el-table>
        </vueSeamlessScroll>
    </div>
</template>
<script>
import './eltable.css'
import vueSeamlessScroll from 'vue-seamless-scroll'
export default {
    components: { vueSeamlessScroll },
    props: {
        h: {
            type: Number,
            default: 300,
        },
        w: {
            type: Number,
            default: 500,
        },
        scrollnum: {
            type: Number,
            default: 3,
        },
        step: {
            type: Number,
            default: 1,
        },
        direction: {
            type: Number,
            default: 1,
        },
        singleHeight: {
            type: Number,
            default: 32,
        },
        singleWidth: {
            type: Number,
            default: 0,
        },
        isheadshow: {
            type: Boolean,
            default: true,
        },
        tableheadcolor: {
            type: String,
            default: 'rgb(1 41 109)',
        },
        tablerowhovercolor: {
            type: String,
            default: 'rgb(18 86 157 / 90%)',
        },
        tablerowcolor: {
            type: String,
            default: 'rgb(0 25 82)',
        },
        tablerowdoublecolor: {
            type: String,
            default: 'rgb(2 51 125)',
        },
        tablebordercolor: {
            type: String,
            default: '#42669a',
        },
        tableheadfontcolor: {
            type: String,
            default: '#fff',
        },
        tablehoverfontcolor: {
            type: String,
            default: '#fff',
        },
        tablerowfontcolor: {
            type: String,
            default: '#fff',
        },
        elcolumn: {
            type: Array,
            default() {
                return [
                    { prop: 'date', label: '日期', width: '180' },
                    { prop: 'name', label: '姓名', width: '180' },
                    { prop: 'address', label: '地址', width: undefined },
                ]
            },
        },
        tabledata: {
            type: Array,
            default() {
                return [
                    {
                        date: '2016-05-02',
                        name: '王小虎',
                        address: '上海市普陀区金沙江路 1518 弄',
                    },
                    {
                        date: '2016-05-04',
                        name: '王小虎',
                        address: '上海市普陀区金沙江路 1517 弄',
                    },
                    {
                        date: '2016-05-01',
                        name: '王小虎',
                        address: '上海市普陀区金沙江路 1519 弄',
                    },
                    {
                        date: '2016-05-03',
                        name: '王小虎',
                        address: '上海市普陀区金沙江路 1516 弄',
                    },
                ]
            },
        },
    },
    data() {
        return {}
    },
    computed: {
        gettablecss() {
            return `--tableheadcolor:${this.tableheadcolor};--tablerowhovercolor:${this.tablerowhovercolor};--tablerowcolor:${this.tablerowcolor};--tablerowdoublecolor:${this.tablerowdoublecolor};--tablebordercolor:${this.tablebordercolor};--tableheadfontcolor:${this.tableheadfontcolor};--tablehoverfontcolor:${this.tablehoverfontcolor};--tablerowfontcolor:${this.tablerowfontcolor};`
        },
        getseamlesscss() {
            return `height:${this.h - 15}px ;width:${this.w}px ;`
        },
        getoptionconfig() {
            let optionconfig = {
                step: 0.2, // 数值越大速度滚动越快
                limitMoveNum: 8, // 开始无缝滚动的数据量 this.dataList.length
                hoverStop: true, // 是否开启鼠标悬停stop
                direction: 1, // 0向下 1向上 2向左 3向右
                openWatch: true, // 开启数据实时监控刷新dom
                singleHeight: 32, // 单步运动停止的高度(默认值0是无缝不停止的滚动) direction => 0/1
                singleWidth: 0, // 单步运动停止的宽度(默认值0是无缝不停止的滚动) direction => 2/3
                waitTime: 1000, // 单步运动停止的时间(默认值1000ms)
            }
            optionconfig.limitMoveNum = this.scrollnum
            optionconfig.step = this.step
            optionconfig.direction = this.direction
            optionconfig.singleHeight = this.singleHeight
            optionconfig.singleWidth = this.singleWidth
            return optionconfig
        },
    },
    methods: {},
}
</script>
<style scoped>
.seamless-warp {
    float: left;
    overflow: hidden;
    width: 100%;
}
.headtable >>> .el-table__empty-block {
    display: none;
}
.seamless-warp >>> .el-table__body {
    width: 100% !important;
}
</style>
