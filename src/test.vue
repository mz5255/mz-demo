<template>
    <div _tmplitem="3" class="dv-full-screen-container" :style="css">
        <div _tmplitem="3" style="position: absolute;width:1920px;height:1080px;background-color:rgba(13, 42, 67);">
            <div _tmplitem="3" class="bigitem" style="top: -2px; left: 8px; width: 1286px; height: 742px; transform: translate(0px, 0px); z-index: 102;">
                <div _tmplitem="3" class="itemcontent " style="opacity:1;border-radius:0px;border-width:0px ;border-style:solid ;--animation:2s;--animation-flash:0.2s;transform:  rotateX(0deg) rotateY(0deg) rotateZ(0deg);">
                    <myechart _tmplitem="1" ref="sel168328956893223" :options="fromData.sel168328956893223"></myechart>
                </div>
            </div>
            <div _tmplitem="3" class="bigitem" style="top: 376px; left: 798px; width: 1120px; height: 698px; transform: translate(0px, 0px); z-index: 101;">
                <div _tmplitem="3" class="itemcontent " style="opacity:1;border-radius:0px;border-width:0px ;border-style:solid ;--animation:2s;--animation-flash:0.2s;transform:  rotateX(0deg) rotateY(0deg) rotateZ(0deg);">
                    <myechart _tmplitem="2" ref="sel168328957718191" :options="fromData.sel168328957718191"></myechart>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
import myechart from '@/components/myechart/newindex.vue'
import titlecontrol from '@/components/titlecontrol.vue'
import horseindex from '@/components/horseindex.vue'
import textareaindex from '@/components/textareaindex.vue'
import backgroundunit1 from '@/components/backgroundunit/backgroundunit1.vue'
import backgroundunit2 from '@/components/backgroundunit/backgroundunit2.vue'
import backgroundunit3 from '@/components/backgroundunit/backgroundunit3.vue'
import backgroundunit4 from '@/components/backgroundunit/backgroundunit4.vue'
import backgroundunit5 from '@/components/backgroundunit/backgroundunit5.vue'
import backgroundunit7 from '@/components/backgroundunit/backgroundunit7.vue'
import backgroundunit8 from '@/components/backgroundunit/backgroundunit8.vue'
import backgroundunit9 from '@/components/backgroundunit/backgroundunit9.vue'
import backgroundunit10 from '@/components/backgroundunit/backgroundunit10.vue'
import backgroundunit11 from '@/components/backgroundunit/backgroundunit11.vue'
import backgroundunit12 from '@/components/backgroundunit/backgroundunit12.vue'
import myfabric from '@/components/myfabric/hotspot.vue'
import bigimg from '@/components/bigImg.vue'
import scrollgridlist from '@/components/scrollgridlist/index.vue'
import scrollgridcolumn from '@/components/scrollgridlist/scrollgridcolumn.vue'
export default {
    data() {
        return {
            w: 1920,
            css: '',
            h: 1080,
            bg: '',
            bgColor: 'rgba(13, 42, 67)',
            fromData: {
                sel168328956893223: {
                    title: {
                        text: '全国6月销售统计',
                        textStyle: {
                            fontSize: 12,
                            fontWeight: 400,
                            color: '#fff',
                        },
                        left: 'center',
                        top: '5%',
                    },
                    legend: {
                        icon: 'circle',
                        top: '5%',
                        right: '5%',
                        itemWidth: 6,
                        itemGap: 20,
                        textStyle: {
                            color: '#fff',
                        },
                    },
                    tooltip: {
                        trigger: 'axis',
                        axisPointer: {
                            label: {
                                show: true,
                                backgroundColor: '#fff',
                                color: '#556677',
                                borderColor: 'rgba(0,0,0,0)',
                                shadowColor: 'rgba(0,0,0,0)',
                                shadowOffsetY: 0,
                            },
                            lineStyle: {
                                width: 0,
                            },
                        },
                        backgroundColor: '#fff',
                        textStyle: {
                            color: '#5c6c7c',
                        },
                        padding: [10, 10],
                        extraCssText:
                            'box-shadow: 1px 0 2px 0 rgba(163,163,163,0.5)',
                    },
                    grid: {
                        top: '15%',
                    },
                    xAxis: [
                        {
                            type: 'category',
                            data: [
                                '北京',
                                '上海',
                                '广州',
                                '深圳',
                                '香港',
                                '澳门',
                                '台湾',
                            ],
                            axisLine: {
                                lineStyle: {
                                    color: '#fff',
                                },
                            },
                            axisTick: {
                                show: false,
                            },
                            axisLabel: {
                                interval: 0,
                                textStyle: {
                                    color: '#fff',
                                },
                                fontSize: 12,
                                margin: 15,
                                color: '#fff',
                            },
                            axisPointer: {
                                label: {
                                    padding: [0, 0, 10, 0],
                                    margin: 15,
                                    fontSize: 12,
                                    backgroundColor: {
                                        type: 'linear',
                                        x: 0,
                                        y: 0,
                                        x2: 0,
                                        y2: 1,
                                        colorStops: [
                                            {
                                                offset: 0,
                                                color: '#fff',
                                            },
                                            {
                                                offset: 0.86,
                                                color: '#fff',
                                            },
                                            {
                                                offset: 0.86,
                                                color: '#33c0cd',
                                            },
                                            {
                                                offset: 1,
                                                color: '#33c0cd',
                                            },
                                        ],
                                        global: false,
                                    },
                                },
                            },
                            boundaryGap: false,
                        },
                    ],
                    yAxis: [
                        {
                            type: 'value',
                            axisTick: {
                                show: false,
                            },
                            axisLine: {
                                show: true,
                                lineStyle: {
                                    color: '#fff',
                                },
                            },
                            axisLabel: {
                                textStyle: {
                                    color: '#fff',
                                },
                                color: '#fff',
                            },
                            splitLine: {
                                show: false,
                            },
                        },
                        {
                            type: 'value',
                            position: 'right',
                            axisTick: {
                                show: false,
                            },
                            axisLabel: {
                                textStyle: {
                                    color: '#fff',
                                },
                                formatter: '{value}',
                                color: '#fff',
                            },
                            axisLine: {
                                show: true,
                                lineStyle: {
                                    color: '#fff',
                                },
                            },
                            splitLine: {
                                show: false,
                            },
                        },
                    ],
                    series: [
                        {
                            name: 'Adidas',
                            type: 'line',
                            data: [10, 10, 30, 12, 15, 3, 7],
                            symbolSize: 1,
                            symbol: 'circle',
                            smooth: true,
                            yAxisIndex: 0,
                            showSymbol: false,
                            lineStyle: {
                                width: 5,
                                color: 'rgb(73, 146, 255)',
                                shadowColor: 'rgb(73, 146, 255,0.4)',
                                shadowBlur: 10,
                                shadowOffsetY: 20,
                            },
                            itemStyle: {
                                normal: {
                                    color: 'rgb(73, 146, 255)',
                                    borderColor: '#9E87FF',
                                },
                                color: 'rgb(73, 146, 255)',
                            },
                        },
                        {
                            name: 'Nike',
                            type: 'line',
                            data: [5, 12, 11, 14, 25, 16, 10],
                            symbolSize: 1,
                            symbol: 'circle',
                            smooth: true,
                            yAxisIndex: 0,
                            showSymbol: false,
                            lineStyle: {
                                width: 5,
                                color: 'rgb(124, 255, 178)',
                                shadowColor: 'rgb(124, 255, 178,0.4)',
                                shadowBlur: 10,
                                shadowOffsetY: 20,
                            },
                            itemStyle: {
                                normal: {
                                    color: 'rgb(124, 255, 178)',
                                    borderColor: '#73DDFF',
                                },
                                color: 'rgb(124, 255, 178)',
                            },
                        },
                        {
                            name: '老北京布鞋',
                            type: 'line',
                            data: [150, 120, 170, 140, 500, 160, 110],
                            symbolSize: 1,
                            yAxisIndex: 1,
                            symbol: 'circle',
                            smooth: true,
                            showSymbol: false,
                            lineStyle: {
                                width: 5,
                                color: 'rgb(253, 221, 96)',
                                shadowColor: 'rgb(253, 221, 96,0.4)',
                                shadowBlur: 10,
                                shadowOffsetY: 20,
                            },
                            itemStyle: {
                                normal: {
                                    color: 'rgb(253, 221, 96)',
                                    borderColor: '#fe9a8b',
                                },
                                color: 'rgb(253, 221, 96)',
                            },
                        },
                    ],
                },
                sel168328957718191: {
                    title: {
                        text: '一周跑步数据',
                        textStyle: {
                            color: '#fff',
                            fontSize: 32,
                            fontWeight: 'normal',
                        },
                        subtext: '2023/5/5',
                        subtextStyle: {
                            color: '#fff',
                            fontSize: 16,
                        },
                        top: 50,
                        left: 80,
                    },
                    legend: {
                        top: 220,
                        left: 80,
                        orient: 'vertical',
                        itemGap: 15,
                        itemWidth: 12,
                        itemHeight: 12,
                        data: ['平均指标', '我的指标'],
                        textStyle: {
                            color: '#fff',
                            fontSize: 14,
                        },
                    },
                    tooltip: {
                        trigger: 'item',
                    },
                    radar: {
                        center: ['68%', '27%'],
                        radius: '40%',
                        name: {
                            color: '#fff',
                        },
                        splitNumber: 8,
                        axisLine: {
                            lineStyle: {
                                color: '#fff',
                                opacity: 0.6,
                            },
                        },
                        splitLine: {
                            lineStyle: {
                                color: {
                                    type: 'linear',
                                    x: 0,
                                    y: 0,
                                    x2: 1,
                                    y2: 1,
                                    colorStops: [
                                        {
                                            offset: 0,
                                            color: '#f5b44d',
                                        },
                                        {
                                            offset: 1,
                                            color: '#28f8de',
                                        },
                                    ],
                                },
                                opacity: 0.6,
                            },
                        },
                        splitArea: {
                            areaStyle: {
                                color: '#fff',
                                opacity: 0.1,
                                shadowBlur: 25,
                                shadowColor: '#000',
                                shadowOffsetX: 0,
                                shadowOffsetY: 5,
                            },
                        },
                        indicator: [
                            {
                                name: '全程距离(m)',
                                max: 12000,
                            },
                            {
                                name: '平均速度(km/h)',
                                max: 10,
                            },
                            {
                                name: '最快速度(km/h)',
                                max: 12,
                            },
                            {
                                name: '总计时间(h)',
                                max: 3.5,
                            },
                        ],
                    },
                    grid: {
                        left: 90,
                        right: 80,
                        bottom: 40,
                        top: '60%',
                    },
                    xAxis: {
                        type: 'category',
                        position: 'bottom',
                        axisLine: true,
                        axisLabel: {
                            color: '#fff',
                            fontSize: 12,
                        },
                        data: [
                            '4/29',
                            '4/30',
                            '5/1',
                            '5/2',
                            '5/3',
                            '5/4',
                            '5/5',
                        ],
                    },
                    yAxis: {
                        name: 'km/h',
                        nameLocation: 'end',
                        nameGap: 24,
                        nameTextStyle: {
                            color: '#fff',
                            fontSize: 14,
                        },
                        max: 12000,
                        splitNumber: 4,
                        axisLine: {
                            lineStyle: {
                                opacity: 0,
                            },
                        },
                        splitLine: {
                            show: true,
                            lineStyle: {
                                color: '#fff',
                                opacity: 0.1,
                            },
                        },
                        axisLabel: {
                            color: '#fff',
                            fontSize: 12,
                        },
                    },
                    series: [
                        {
                            name: '每日跑步指标分布与比较',
                            type: 'radar',
                            symbolSize: 0,
                            data: [
                                {
                                    value: [11898, 6.753, 7.613, 3.2],
                                    name: '平均指标',
                                    itemStyle: {
                                        normal: {
                                            color: 'rgb(73, 146, 255)',
                                        },
                                        color: 'rgb(73, 146, 255)',
                                    },
                                    lineStyle: {
                                        normal: {
                                            opacity: 0,
                                        },
                                        color: 'rgb(73, 146, 255)',
                                    },
                                    areaStyle: {
                                        normal: {
                                            color: '#f8d351',
                                            shadowBlur: 25,
                                            shadowColor: 'rgba(248,211,81,.3)',
                                            shadowOffsetX: 0,
                                            shadowOffsetY: -10,
                                            opacity: 1,
                                        },
                                    },
                                },
                                {
                                    value: [11068, 3.432, 4.902, 3.2],
                                    name: '我的指标',
                                    itemStyle: {
                                        normal: {
                                            color: 'rgb(73, 146, 255)',
                                        },
                                        color: 'rgb(73, 146, 255)',
                                    },
                                    lineStyle: {
                                        normal: {
                                            opacity: 0,
                                        },
                                        color: 'rgb(73, 146, 255)',
                                    },
                                    areaStyle: {
                                        normal: {
                                            color: {
                                                type: 'linear',
                                                x: 0,
                                                y: 0,
                                                x2: 1,
                                                y2: 0,
                                                colorStops: [
                                                    {
                                                        offset: 0,
                                                        color: '#43dfa2',
                                                    },
                                                    {
                                                        offset: 1,
                                                        color: '#28f8de',
                                                    },
                                                ],
                                            },
                                            shadowBlur: 15,
                                            shadowColor: 'rgba(0,0,0,.2)',
                                            shadowOffsetX: 0,
                                            shadowOffsetY: 5,
                                            opacity: 0.8,
                                        },
                                    },
                                },
                            ],
                        },
                        {
                            name: '每日跑步里程',
                            type: 'line',
                            smooth: true,
                            symbol: 'emptyCircle',
                            symbolSize: 8,
                            itemStyle: {
                                normal: {
                                    color: 'rgb(124, 255, 178)',
                                },
                                color: 'rgb(124, 255, 178)',
                            },
                            lineStyle: {
                                normal: {
                                    color: {
                                        type: 'linear',
                                        x: 0,
                                        y: 0,
                                        x2: 1,
                                        y2: 0,
                                        colorStops: [
                                            {
                                                offset: 0,
                                                color: '#1c98e8',
                                            },
                                            {
                                                offset: 1,
                                                color: '#28f8de',
                                            },
                                        ],
                                    },
                                    width: 3,
                                },
                                color: 'rgb(124, 255, 178)',
                            },
                            areaStyle: {
                                normal: {
                                    color: {
                                        type: 'linear',
                                        x: 0,
                                        y: 0,
                                        x2: 0,
                                        y2: 1,
                                        colorStops: [
                                            {
                                                offset: 0,
                                                color: 'rgba(35,184,210,.2)',
                                            },
                                            {
                                                offset: 1,
                                                color: 'rgba(35,184,210,0)',
                                            },
                                        ],
                                    },
                                },
                            },
                            data: [
                                11068, 11224, 3332, 2141, 10804, 9758, 10451,
                            ],
                            lineSmooth: true,
                            markLine: {
                                silent: true,
                                data: [
                                    {
                                        type: 'average',
                                        name: '平均值',
                                    },
                                ],
                                precision: 0,
                                label: {
                                    normal: {
                                        formatter: '平均值: \n {c}',
                                    },
                                },
                                lineStyle: {
                                    normal: {
                                        color: 'rgba(248,211,81,.7)',
                                    },
                                    color: 'rgb(124, 255, 178)',
                                },
                            },
                            tooltip: {
                                position: 'top',
                                formatter: '{c} m',
                                backgroundColor: 'rgba(28,152,232,.2)',
                                padding: 6,
                            },
                        },
                        {
                            name: '占位背景',
                            type: 'bar',
                            itemStyle: {
                                normal: {
                                    show: true,
                                    color: 'rgb(253, 221, 96)',
                                    opacity: 0,
                                },
                                color: 'rgb(253, 221, 96)',
                            },
                            silent: true,
                            barWidth: '50%',
                            data: [
                                12000, 12000, 12000, 12000, 12000, 12000, 12000,
                            ],
                            animation: false,
                        },
                        {
                            name: '占位背景',
                            type: 'bar',
                            itemStyle: {
                                normal: {
                                    show: true,
                                    color: 'rgb(255, 110, 118)',
                                    opacity: 0.1,
                                },
                                color: 'rgb(255, 110, 118)',
                            },
                            silent: true,
                            barWidth: '50%',
                            barGap: 0,
                            data: [
                                12000, 12000, 12000, 12000, 12000, 12000, 12000,
                            ],
                            animation: false,
                        },
                    ],
                },
            },
        }
    },
    methods: {
        created_sys() {
            ///系统方法 判断页面大小 使其自动适应
            let $this = this
            this.w = this.w === undefined ? 1920 : this.w
            $this.css = `  width: ${$this.w}px;height: ${$this.h}px; ${
                $this.bg === '' ? '' : 'background-image:url(' + $this.bg + ');'
            }  transform: scale(${document.body.clientWidth / $this.w});  ${
                $this.bgColor === ''
                    ? ''
                    : 'background-color:' +
                      $this.bgColor +
                      ';left:calc( 50% - ' +
                      $this.w / 2 +
                      'px);'
            }`

            window.addEventListener('resize', () => {
                $this.css = `  width: ${$this.w}px;height: ${$this.h}px; ${
                    $this.bg === ''
                        ? ''
                        : 'background-image:url(' + $this.bg + ');'
                }  transform: scale(${document.body.clientWidth / $this.w}); ${
                    $this.bgColor === ''
                        ? ''
                        : 'background-color:' + $this.bgColor + ';'
                }`
            })
            $this.css = `transform: scale(${
                document.body.clientWidth / $this.w
            })`
        },
        funmounted_sys() {},
    },
    created() {
        this.created_sys()
        if (this.funmounted_sys !== undefined) {
            this.funmounted_sys()
        }
    },
    components: {
        myechart,
        titlecontrol,
        horseindex,
        textareaindex,
        backgroundunit1,
        backgroundunit2,
        backgroundunit3,
        backgroundunit4,
        backgroundunit5,
        backgroundunit7,
        backgroundunit8,
        backgroundunit9,
        backgroundunit10,
        backgroundunit11,
        backgroundunit12,
        bigimg,
        myfabric,
        scrollgridlist,
        scrollgridcolumn,
    },
}
</script>
<style scoped>
.dv-full-screen-container {
    transform: scale(1);
    position: absolute;
    top: 0px;
    left: 0px;
    overflow: hidden;
    transform-origin: left top;
    z-index: 499;
    font-family: Avenir, Helvetica, Arial, sans-serif;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    width: 1920px;
    height: 1080px;
    background-color: '#040404';
    background-size: cover;
}

.bigitem {
    position: absolute;
    will-change: transform;
    overflow: hidden;
}

.layouttable {
    height: 100%;
    display: flex;
}

.layouttable .layouttable-item {
    height: 100%;
    position: relative;
    float: left;
}

.itemcontent {
    width: 100%;
    height: 100%;
}
</style>
<style scoped></style>