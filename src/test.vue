<template>
    <div _tmplitem="25" class="dv-full-screen-container" :style="css">
        <div _tmplitem="25" style="position: absolute;width:1920px;height:1080px;background-color:rgba(13, 42, 67);">
            <div _tmplitem="25" class="bigitem" style="top: 442px; left: 685px; width: 300px; height: 200px; transform: translate(0px, 0px); z-index: 1024;">
                <div _tmplitem="25" class="itemcontent " style="opacity:1;transform:  rotateX(0deg) rotateY(0deg) rotateZ(0deg);">
                    <backgroundunit8 _tmplitem="1" w="300" h="200"></backgroundunit8>
                </div>
            </div>
            <div _tmplitem="25" class="bigitem" style="top: 448px; left: 16px; width: 538px; height: 286px; transform: translate(0px, 0px); z-index: 1023;">
                <div _tmplitem="25" class="itemcontent " style="opacity:1;border-radius:0px;border-width:0px ;border-style:solid ;--animation:2s;--animation-flash:0.2s;transform:  rotateX(0deg) rotateY(0deg) rotateZ(0deg);">
                    <myechart _tmplitem="2" ref="sel167928182454248" :options="fromData.sel167928182454248"></myechart>
                </div>
            </div>
            <div _tmplitem="25" class="bigitem" style="top: 449px; left: 1372px; width: 524px; height: 289px; transform: translate(0px, 0px); z-index: 1022;">
                <div _tmplitem="25" class="itemcontent " style="opacity:1;height:190pxpx;--animation:2s;--animation-flash:0.2s;transform:  rotateX(0deg) rotateY(0deg) rotateZ(0deg);">
                    <scrollgridlist _tmplitem="3" :gridlist="fromData.sel168256033931746">
                        <scrollgridcolumn _tmplitem="3" prop="aa" lable="测试哈哈"> </scrollgridcolumn>
                        <scrollgridcolumn _tmplitem="3" prop="bb" lable="测试哈哈"> </scrollgridcolumn>
                        <scrollgridcolumn _tmplitem="3" prop="cc" lable="测试哈哈"> </scrollgridcolumn>
                    </scrollgridlist>
                </div>
            </div>
            <div _tmplitem="25" class="bigitem" style="top: 768px; left: 1370px; width: 534px; height: 316px; transform: translate(0px, 0px); z-index: 1021;">
                <div _tmplitem="25" class="itemcontent " style="opacity:1;border-radius:0px;border-width:0px ;border-style:solid ;--animation:2s;--animation-flash:0.2s;transform:  rotateX(0deg) rotateY(0deg) rotateZ(0deg);">
                    <myechart _tmplitem="4" ref="sel167928253122051" :options="fromData.sel167928253122051"></myechart>
                </div>
            </div>
            <div _tmplitem="25" class="bigitem" style="top: 104px; left: 580px; width: 752px; height: 636px; transform: translate(0px, 0px); z-index: 1020;">
                <div _tmplitem="25" class="itemcontent " style="opacity:1;border-radius:0px;border-width:0px ;border-style:solid ;--animation:2s;--animation-flash:0.2s;transform:  rotateX(0deg) rotateY(0deg) rotateZ(0deg);">
                    <myechart _tmplitem="5" ref="sel167928242116854" :options="fromData.sel167928242116854"></myechart>
                </div>
            </div>
            <div _tmplitem="25" class="bigitem" style="top: 52px; left: 4px; width: 547px; height: 46px; transform: translate(0px, 0px); z-index: 1019;">
                <div _tmplitem="25" class="itemcontent " style="opacity:1;font-size:12px ;color:rgb(255, 255, 255) ;border-radius:0px;border-width:0px ;border-style:solid ;line-height:18px ;--animation:2s;--animation-flash:0.2s;transform:  rotateX(0deg) rotateY(0deg) rotateZ(0deg);">
                    <horseindex _tmplitem="6" ref="sel167826175649789" :w="547" :h="46" :val="fromData.sel167826175649789" cssstyle="color: rgb(255, 255, 255); overflow: unset; text-overflow: unset; white-space: unset; background-image: none; background-clip: unset; -webkit-text-fill-color: initial;"></horseindex>
                </div>
            </div>
            <div _tmplitem="25" class="bigitem" style="top: 150px; left: 798px; width: 300px; height: 50px; transform: translate(0px, 0px); z-index: 1018;">
                <div _tmplitem="25" class="itemcontent " style="opacity:1;font-size:12px ;color:rgb(255, 255, 255) ;border-radius:0px;border-width:0px ;border-style:solid ;--animation:2s;--animation-flash:0.2s;transform:rotateZ(0deg)rotateY(0deg)   rotateX(0deg) ;">
                    <dv-digital-flop ref="sel167826111093270" :config="fromData.sel167826111093270" style="width:300px;height:50px"> </dv-digital-flop>
                </div>
            </div>
            <div _tmplitem="25" class="bigitem" style="top: 56px; left: 1476px; width: 300px; height: 40px; transform: translate(0px, 0px); z-index: 1017;">
                <div _tmplitem="25" class="itemcontent animation-pulse" style="opacity:1;font-size:12px ;color:rgb(255, 255, 255) ;border-radius:0px;border-width:0px ;border-style:solid ;--animation:2s;--animation-flash:0.2s;transform:  rotateX(0deg) rotateY(0deg) rotateZ(0deg);"> </div>
            </div>
            <div _tmplitem="25" class="bigitem" style="top: 114px; left: 1370px; width: 550px; height: 320px; transform: translate(0px, 0px); z-index: 1016;">
                <div _tmplitem="25" class="itemcontent " style="opacity:1;border-radius:0px;border-width:0px ;border-style:solid ;--animation:2s;--animation-flash:0.2s;transform:  rotateX(0deg) rotateY(0deg) rotateZ(0deg);">
                    <myechart _tmplitem="9" ref="sel167284014437157" :options="fromData.sel167284014437157"></myechart>
                </div>
            </div>
            <div _tmplitem="25" class="bigitem" style="top: 758px; left: 578px; width: 765px; height: 320px; transform: translate(0px, 0px); z-index: 1015;">
                <div _tmplitem="25" class="itemcontent " style="opacity:1;border-radius:0px;border-width:0px ;border-style:solid ;--animation:2s;--animation-flash:0.2s;transform:  rotateX(0deg) rotateY(0deg) rotateZ(0deg);">
                    <myechart _tmplitem="10" ref="sel167283995662848" :options="fromData.sel167283995662848"></myechart>
                </div>
            </div>
            <div _tmplitem="25" class="bigitem" style="top: 98px; left: 10px; width: 538px; height: 330px; transform: translate(0px, 0px); z-index: 1014;">
                <div _tmplitem="25" class="itemcontent " style="opacity:1;border-radius:0px;border-width:0px ;border-style:solid ;--animation:2s;--animation-flash:0.2s;transform:  rotateX(0deg) rotateY(0deg) rotateZ(0deg);">
                    <myechart _tmplitem="11" ref="sel16728397626137" :options="fromData.sel16728397626137"></myechart>
                </div>
            </div>
            <div _tmplitem="25" class="bigitem" style="top: 26px; left: 814px; width: 300px; height: 40px; transform: translate(0px, 0px); z-index: 1013;">
                <div _tmplitem="25" class="itemcontent " style="opacity:1;font-size:12px ;color:rgb(255, 255, 255) ;border-radius:0px;border-width:0px ;border-style:solid ;--animation:2s;--animation-flash:0.2s;transform:  rotateX(0deg) rotateY(0deg) rotateZ(0deg);">
                    <titlecontrol _tmplitem="12" ref="sel167283549375372" :w="300" :h="40" :val="fromData.sel167283549375372" cssstyle="color: rgb(255, 255, 255); overflow: unset; text-overflow: unset; white-space: unset; background-image: none; background-clip: unset; -webkit-text-fill-color: initial;white-space:nowrap;"></titlecontrol>
                </div>
            </div>
            <div _tmplitem="25" class="bigitem" style="top: -68px; left: 46px; width: 540px; height: 200px; transform: translate(0px, 0px); z-index: 1012;">
                <div _tmplitem="25" class="itemcontent " style="opacity:1;transform:  rotateX(0deg) rotateY(0deg) rotateZ(0deg);">
                    <dv-decoration-10 style="width:540px;height:200px" :color="[]"></dv-decoration-10>
                </div>
            </div>
            <div _tmplitem="25" class="bigitem" style="top: -68px; left: 1282px; width: 640px; height: 200px; transform: translate(0px, 0px); z-index: 1011;">
                <div _tmplitem="25" class="itemcontent " style="opacity:1;transform:  rotateX(0deg) rotateY(0deg) rotateZ(0deg);">
                    <dv-decoration-10 style="width:640px;height:200px" :color="[]"></dv-decoration-10>
                </div>
            </div>
            <div _tmplitem="25" class="bigitem" style="top: 756px; left: 576px; width: 765px; height: 320px; transform: translate(0px, 0px); z-index: 1010;">
                <div _tmplitem="25" class="itemcontent " style="opacity:1;transform:  rotateX(0deg) rotateY(0deg) rotateZ(0deg);">
                    <dv-border-box-12 style="width:765px;height:320px" backgroundcolor="" :color="[]"></dv-border-box-12>
                </div>
            </div>
            <div _tmplitem="25" class="bigitem" style="top: 104px; left: 578px; width: 765px; height: 640px; transform: translate(0px, 0px); z-index: 109;">
                <div _tmplitem="25" class="itemcontent " style="opacity:1;background-color:transparent;transform:  rotateX(0deg) rotateY(0deg) rotateZ(0deg);">
                    <dv-border-box-2 style="width:765px;height:640px" backgroundcolor="" :color="[]"></dv-border-box-2>
                </div>
            </div>
            <div _tmplitem="25" class="bigitem" style="top: 764px; left: 12px; width: 550px; height: 320px; transform: translate(0px, 0px); z-index: 108;">
                <div _tmplitem="25" class="itemcontent " style="opacity:1;border-radius:0px;border-width:0px ;border-style:solid ;--animation:2s;--animation-flash:0.2s;transform:  rotateX(0deg) rotateY(0deg) rotateZ(0deg);">
                    <myechart _tmplitem="17" ref="sel16732588644002" :options="fromData.sel16732588644002"></myechart>
                </div>
            </div>
            <div _tmplitem="25" class="bigitem" style="top: 94px; left: 4px; width: 550px; height: 320px; transform: translate(0px, 0px); z-index: 107;">
                <div _tmplitem="25" class="itemcontent " style="opacity:1;transform:  rotateX(0deg) rotateY(0deg) rotateZ(0deg);">
                    <dv-border-box-13 style="width:550px;height:320px" backgroundcolor="" :color="[]"></dv-border-box-13>
                </div>
            </div>
            <div _tmplitem="25" class="bigitem" style="top: 432px; left: 4px; width: 550px; height: 316px; transform: translate(0px, 0px); z-index: 106;">
                <div _tmplitem="25" class="itemcontent " style="opacity:1;transform:  rotateX(0deg) rotateY(0deg) rotateZ(0deg);">
                    <dv-border-box-13 style="width:550px;height:316px" backgroundcolor="" :color="[]"></dv-border-box-13>
                </div>
            </div>
            <div _tmplitem="25" class="bigitem" style="top: 754px; left: 8px; width: 550px; height: 320px; transform: translate(0px, 0px); z-index: 105;">
                <div _tmplitem="25" class="itemcontent " style="opacity:1;transform:  rotateX(0deg) rotateY(0deg) rotateZ(0deg);">
                    <dv-border-box-13 style="width:550px;height:320px" backgroundcolor="" :color="[]"></dv-border-box-13>
                </div>
            </div>
            <div _tmplitem="25" class="bigitem" style="top: 104px; left: 1364px; width: 550px; height: 320px; transform: translate(0px, 0px); z-index: 104;">
                <div _tmplitem="25" class="itemcontent " style="opacity:1;transform:  rotateX(0deg) rotateY(0deg) rotateZ(0deg);">
                    <dv-border-box-13 style="width:550px;height:320px" backgroundcolor="" :color="[]"></dv-border-box-13>
                </div>
            </div>
            <div _tmplitem="25" class="bigitem" style="top: 436px; left: 1360px; width: 550px; height: 320px; transform: translate(0px, 0px); z-index: 103;">
                <div _tmplitem="25" class="itemcontent " style="opacity:1;background-color:rgba(255, 0, 0, 0);transform:  rotateX(0deg) rotateY(0deg) rotateZ(0deg);">
                    <dv-border-box-13 style="width:550px;height:320px" backgroundcolor="" :color="[]"></dv-border-box-13>
                </div>
            </div>
            <div _tmplitem="25" class="bigitem" style="top: 764px; left: 1358px; width: 550px; height: 320px; transform: translate(0px, 0px); z-index: 102;">
                <div _tmplitem="25" class="itemcontent " style="opacity:1;transform:  rotateX(0deg) rotateY(0deg) rotateZ(0deg);">
                    <dv-border-box-12 style="width:550px;height:320px" backgroundcolor="" :color="[]"></dv-border-box-12>
                </div>
            </div>
            <div _tmplitem="25" class="bigitem" style="top: 10px; left: 574px; width: 765px; height: 110px; transform: translate(0px, 0px); z-index: 101;">
                <div _tmplitem="25" class="itemcontent " style="opacity:1;transform:  rotateX(0deg) rotateY(0deg) rotateZ(0deg);">
                    <dv-decoration-5 style="width:765px;height:110px" :color="[]"></dv-decoration-5>
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
                sel167928182454248: {
                    tooltip: {},
                    visualMap: {
                        max: 20,
                        inRange: {
                            color: [
                                '#313695',
                                '#4575b4',
                                '#74add1',
                                '#abd9e9',
                                '#e0f3f8',
                                '#ffffbf',
                                '#fee090',
                                '#fdae61',
                                '#f46d43',
                                '#d73027',
                                '#a50026',
                            ],
                        },
                    },
                    xAxis3D: {
                        type: 'category',
                        data: [
                            '12a',
                            '1a',
                            '2a',
                            '3a',
                            '4a',
                            '5a',
                            '6a',
                            '7a',
                            '8a',
                            '9a',
                            '10a',
                            '11a',
                            '12p',
                            '1p',
                            '2p',
                            '3p',
                            '4p',
                            '5p',
                            '6p',
                            '7p',
                            '8p',
                            '9p',
                            '10p',
                            '11p',
                        ],
                    },
                    yAxis3D: {
                        type: 'category',
                        data: [
                            'Saturday',
                            'Friday',
                            'Thursday',
                            'Wednesday',
                            'Tuesday',
                            'Monday',
                            'Sunday',
                        ],
                    },
                    zAxis3D: {
                        type: 'value',
                    },
                    grid3D: {
                        boxWidth: 200,
                        boxDepth: 80,
                        light: {
                            main: {
                                intensity: 1.2,
                            },
                            ambient: {
                                intensity: 0.3,
                            },
                        },
                    },
                    series: [
                        {
                            type: 'bar3D',
                            data: [
                                {
                                    value: [0, 0, 5],
                                },
                                {
                                    value: [1, 0, 1],
                                },
                                {
                                    value: [2, 0, 0],
                                },
                                {
                                    value: [3, 0, 0],
                                },
                                {
                                    value: [4, 0, 0],
                                },
                                {
                                    value: [5, 0, 0],
                                },
                                {
                                    value: [6, 0, 0],
                                },
                                {
                                    value: [7, 0, 0],
                                },
                                {
                                    value: [8, 0, 0],
                                },
                                {
                                    value: [9, 0, 0],
                                },
                                {
                                    value: [10, 0, 0],
                                },
                                {
                                    value: [11, 0, 2],
                                },
                                {
                                    value: [12, 0, 4],
                                },
                                {
                                    value: [13, 0, 1],
                                },
                                {
                                    value: [14, 0, 1],
                                },
                                {
                                    value: [15, 0, 3],
                                },
                                {
                                    value: [16, 0, 4],
                                },
                                {
                                    value: [17, 0, 6],
                                },
                                {
                                    value: [18, 0, 4],
                                },
                                {
                                    value: [19, 0, 4],
                                },
                                {
                                    value: [20, 0, 3],
                                },
                                {
                                    value: [21, 0, 3],
                                },
                                {
                                    value: [22, 0, 2],
                                },
                                {
                                    value: [23, 0, 5],
                                },
                                {
                                    value: [0, 1, 7],
                                },
                                {
                                    value: [1, 1, 0],
                                },
                                {
                                    value: [2, 1, 0],
                                },
                                {
                                    value: [3, 1, 0],
                                },
                                {
                                    value: [4, 1, 0],
                                },
                                {
                                    value: [5, 1, 0],
                                },
                                {
                                    value: [6, 1, 0],
                                },
                                {
                                    value: [7, 1, 0],
                                },
                                {
                                    value: [8, 1, 0],
                                },
                                {
                                    value: [9, 1, 0],
                                },
                                {
                                    value: [10, 1, 5],
                                },
                                {
                                    value: [11, 1, 2],
                                },
                                {
                                    value: [12, 1, 2],
                                },
                                {
                                    value: [13, 1, 6],
                                },
                                {
                                    value: [14, 1, 9],
                                },
                                {
                                    value: [15, 1, 11],
                                },
                                {
                                    value: [16, 1, 6],
                                },
                                {
                                    value: [17, 1, 7],
                                },
                                {
                                    value: [18, 1, 8],
                                },
                                {
                                    value: [19, 1, 12],
                                },
                                {
                                    value: [20, 1, 5],
                                },
                                {
                                    value: [21, 1, 5],
                                },
                                {
                                    value: [22, 1, 7],
                                },
                                {
                                    value: [23, 1, 2],
                                },
                                {
                                    value: [0, 2, 1],
                                },
                                {
                                    value: [1, 2, 1],
                                },
                                {
                                    value: [2, 2, 0],
                                },
                                {
                                    value: [3, 2, 0],
                                },
                                {
                                    value: [4, 2, 0],
                                },
                                {
                                    value: [5, 2, 0],
                                },
                                {
                                    value: [6, 2, 0],
                                },
                                {
                                    value: [7, 2, 0],
                                },
                                {
                                    value: [8, 2, 0],
                                },
                                {
                                    value: [9, 2, 0],
                                },
                                {
                                    value: [10, 2, 3],
                                },
                                {
                                    value: [11, 2, 2],
                                },
                                {
                                    value: [12, 2, 1],
                                },
                                {
                                    value: [13, 2, 9],
                                },
                                {
                                    value: [14, 2, 8],
                                },
                                {
                                    value: [15, 2, 10],
                                },
                                {
                                    value: [16, 2, 6],
                                },
                                {
                                    value: [17, 2, 5],
                                },
                                {
                                    value: [18, 2, 5],
                                },
                                {
                                    value: [19, 2, 5],
                                },
                                {
                                    value: [20, 2, 7],
                                },
                                {
                                    value: [21, 2, 4],
                                },
                                {
                                    value: [22, 2, 2],
                                },
                                {
                                    value: [23, 2, 4],
                                },
                                {
                                    value: [0, 3, 7],
                                },
                                {
                                    value: [1, 3, 3],
                                },
                                {
                                    value: [2, 3, 0],
                                },
                                {
                                    value: [3, 3, 0],
                                },
                                {
                                    value: [4, 3, 0],
                                },
                                {
                                    value: [5, 3, 0],
                                },
                                {
                                    value: [6, 3, 0],
                                },
                                {
                                    value: [7, 3, 0],
                                },
                                {
                                    value: [8, 3, 1],
                                },
                                {
                                    value: [9, 3, 0],
                                },
                                {
                                    value: [10, 3, 5],
                                },
                                {
                                    value: [11, 3, 4],
                                },
                                {
                                    value: [12, 3, 7],
                                },
                                {
                                    value: [13, 3, 14],
                                },
                                {
                                    value: [14, 3, 13],
                                },
                                {
                                    value: [15, 3, 12],
                                },
                                {
                                    value: [16, 3, 9],
                                },
                                {
                                    value: [17, 3, 5],
                                },
                                {
                                    value: [18, 3, 5],
                                },
                                {
                                    value: [19, 3, 10],
                                },
                                {
                                    value: [20, 3, 6],
                                },
                                {
                                    value: [21, 3, 4],
                                },
                                {
                                    value: [22, 3, 4],
                                },
                                {
                                    value: [23, 3, 1],
                                },
                                {
                                    value: [0, 4, 1],
                                },
                                {
                                    value: [1, 4, 3],
                                },
                                {
                                    value: [2, 4, 0],
                                },
                                {
                                    value: [3, 4, 0],
                                },
                                {
                                    value: [4, 4, 0],
                                },
                                {
                                    value: [5, 4, 1],
                                },
                                {
                                    value: [6, 4, 0],
                                },
                                {
                                    value: [7, 4, 0],
                                },
                                {
                                    value: [8, 4, 0],
                                },
                                {
                                    value: [9, 4, 2],
                                },
                                {
                                    value: [10, 4, 4],
                                },
                                {
                                    value: [11, 4, 4],
                                },
                                {
                                    value: [12, 4, 2],
                                },
                                {
                                    value: [13, 4, 4],
                                },
                                {
                                    value: [14, 4, 4],
                                },
                                {
                                    value: [15, 4, 14],
                                },
                                {
                                    value: [16, 4, 12],
                                },
                                {
                                    value: [17, 4, 1],
                                },
                                {
                                    value: [18, 4, 8],
                                },
                                {
                                    value: [19, 4, 5],
                                },
                                {
                                    value: [20, 4, 3],
                                },
                                {
                                    value: [21, 4, 7],
                                },
                                {
                                    value: [22, 4, 3],
                                },
                                {
                                    value: [23, 4, 0],
                                },
                                {
                                    value: [0, 5, 2],
                                },
                                {
                                    value: [1, 5, 1],
                                },
                                {
                                    value: [2, 5, 0],
                                },
                                {
                                    value: [3, 5, 3],
                                },
                                {
                                    value: [4, 5, 0],
                                },
                                {
                                    value: [5, 5, 0],
                                },
                                {
                                    value: [6, 5, 0],
                                },
                                {
                                    value: [7, 5, 0],
                                },
                                {
                                    value: [8, 5, 2],
                                },
                                {
                                    value: [9, 5, 0],
                                },
                                {
                                    value: [10, 5, 4],
                                },
                                {
                                    value: [11, 5, 1],
                                },
                                {
                                    value: [12, 5, 5],
                                },
                                {
                                    value: [13, 5, 10],
                                },
                                {
                                    value: [14, 5, 5],
                                },
                                {
                                    value: [15, 5, 7],
                                },
                                {
                                    value: [16, 5, 11],
                                },
                                {
                                    value: [17, 5, 6],
                                },
                                {
                                    value: [18, 5, 0],
                                },
                                {
                                    value: [19, 5, 5],
                                },
                                {
                                    value: [20, 5, 3],
                                },
                                {
                                    value: [21, 5, 4],
                                },
                                {
                                    value: [22, 5, 2],
                                },
                                {
                                    value: [23, 5, 0],
                                },
                                {
                                    value: [0, 6, 1],
                                },
                                {
                                    value: [1, 6, 0],
                                },
                                {
                                    value: [2, 6, 0],
                                },
                                {
                                    value: [3, 6, 0],
                                },
                                {
                                    value: [4, 6, 0],
                                },
                                {
                                    value: [5, 6, 0],
                                },
                                {
                                    value: [6, 6, 0],
                                },
                                {
                                    value: [7, 6, 0],
                                },
                                {
                                    value: [8, 6, 0],
                                },
                                {
                                    value: [9, 6, 0],
                                },
                                {
                                    value: [10, 6, 1],
                                },
                                {
                                    value: [11, 6, 0],
                                },
                                {
                                    value: [12, 6, 2],
                                },
                                {
                                    value: [13, 6, 1],
                                },
                                {
                                    value: [14, 6, 3],
                                },
                                {
                                    value: [15, 6, 4],
                                },
                                {
                                    value: [16, 6, 0],
                                },
                                {
                                    value: [17, 6, 0],
                                },
                                {
                                    value: [18, 6, 0],
                                },
                                {
                                    value: [19, 6, 0],
                                },
                                {
                                    value: [20, 6, 1],
                                },
                                {
                                    value: [21, 6, 2],
                                },
                                {
                                    value: [22, 6, 2],
                                },
                                {
                                    value: [23, 6, 6],
                                },
                            ],
                            shading: 'color',
                            label: {
                                show: false,
                                textStyle: {
                                    fontSize: 16,
                                    borderWidth: 1,
                                },
                            },
                            itemStyle: {
                                opacity: 0.4,
                            },
                            emphasis: {
                                label: {
                                    textStyle: {
                                        fontSize: 20,
                                        color: '#900',
                                    },
                                },
                                itemStyle: {
                                    color: '#900',
                                },
                            },
                        },
                    ],
                },
                sel168256033931746: [],
                sel167928253122051: {
                    backgroundColor: '#0B1837',
                    color: [
                        '#EAEA26',
                        '#906BF9',
                        '#FE5656',
                        '#01E17E',
                        '#3DD1F9',
                        '#FFAD05',
                    ],
                    grid: {
                        left: -100,
                        top: 50,
                        bottom: 10,
                        right: 10,
                        containLabel: true,
                    },
                    tooltip: {
                        trigger: 'item',
                        formatter: '{b} : {c} ({d}%)',
                    },
                    legend: {
                        type: 'scroll',
                        orient: 'vartical',
                        top: 'center',
                        right: '15',
                        itemWidth: 16,
                        itemHeight: 8,
                        itemGap: 16,
                        textStyle: {
                            color: '#A3E2F4',
                            fontSize: 12,
                            fontWeight: 0,
                        },
                        data: [
                            'IDS',
                            'VPN',
                            '交换机',
                            '防火墙',
                            'WAF',
                            '堡垒机',
                        ],
                    },
                    polar: {},
                    angleAxis: {
                        interval: 1,
                        type: 'category',
                        data: [],
                        z: 10,
                        axisLine: {
                            show: false,
                            lineStyle: {
                                color: '#0B4A6B',
                                width: 1,
                                type: 'solid',
                            },
                        },
                        axisLabel: {
                            interval: 0,
                            show: true,
                            color: '#0B4A6B',
                            margin: 8,
                            fontSize: 16,
                        },
                    },
                    radiusAxis: {
                        min: 40,
                        max: 120,
                        interval: 20,
                        axisLine: {
                            show: false,
                            lineStyle: {
                                color: '#0B3E5E',
                                width: 1,
                                type: 'solid',
                            },
                        },
                        axisLabel: {
                            formatter: '{value} %',
                            show: false,
                            padding: [0, 0, 20, 0],
                            color: '#0B3E5E',
                            fontSize: 16,
                        },
                        splitLine: {
                            lineStyle: {
                                color: '#0B3E5E',
                                width: 2,
                                type: 'solid',
                            },
                        },
                    },
                    calculable: true,
                    series: [
                        {
                            type: 'pie',
                            radius: ['5%', '10%'],
                            hoverAnimation: false,
                            labelLine: {
                                normal: {
                                    show: false,
                                    length: 30,
                                    length2: 55,
                                },
                                emphasis: {
                                    show: false,
                                },
                            },
                            data: [
                                {
                                    name: '',
                                    value: 0,
                                    itemStyle: {
                                        normal: {
                                            color: '#0B4A6B',
                                        },
                                    },
                                },
                            ],
                        },
                        {
                            type: 'pie',
                            radius: ['90%', '95%'],
                            hoverAnimation: false,
                            labelLine: {
                                normal: {
                                    show: false,
                                    length: 30,
                                    length2: 55,
                                },
                                emphasis: {
                                    show: false,
                                },
                            },
                            name: '',
                            data: [
                                {
                                    name: '',
                                    value: 0,
                                    itemStyle: {
                                        normal: {
                                            color: '#0B4A6B',
                                        },
                                    },
                                },
                            ],
                        },
                        {
                            stack: 'a',
                            type: 'pie',
                            radius: ['20%', '80%'],
                            roseType: 'area',
                            zlevel: 10,
                            label: {
                                normal: {
                                    show: true,
                                    formatter: '{c}',
                                    textStyle: {
                                        fontSize: 12,
                                    },
                                    position: 'outside',
                                },
                                emphasis: {
                                    show: true,
                                },
                            },
                            labelLine: {
                                normal: {
                                    show: true,
                                    length: 20,
                                    length2: 55,
                                },
                                emphasis: {
                                    show: false,
                                },
                            },
                            data: [
                                {
                                    value: 10,
                                    name: 'IDS',
                                },
                                {
                                    value: 5,
                                    name: 'VPN',
                                },
                                {
                                    value: 15,
                                    name: '交换机',
                                },
                                {
                                    value: 25,
                                    name: '防火墙',
                                },
                                {
                                    value: 20,
                                    name: 'WAF',
                                },
                                {
                                    value: 35,
                                    name: '堡垒机',
                                },
                            ],
                        },
                    ],
                },
                sel167928242116854: {
                    title: {
                        text: '热力图',
                        subtext: '',
                        sublink: 'http://www.pm25.in',
                        left: 'center',
                        textStyle: {
                            color: '#fff',
                        },
                    },
                    backgroundColor: '#404a59',
                    visualMap: {
                        min: 0,
                        max: 500,
                        splitNumber: 5,
                        inRange: {
                            color: ['#50a3ba', '#eac736', '#d94e5d'],
                        },
                        textStyle: {
                            color: '#fff',
                        },
                    },
                    geo: {
                        map: 'china',
                        label: {
                            emphasis: {
                                show: false,
                            },
                        },
                        roam: true,
                        itemStyle: {
                            normal: {
                                areaColor: '#323c48',
                                borderColor: '#111',
                            },
                            emphasis: {
                                areaColor: '#2a333d',
                            },
                        },
                    },
                    series: [
                        {
                            name: 'AQI',
                            type: 'heatmap',
                            coordinateSystem: 'geo',
                            data: [
                                [121.15, 31.89, 100],
                                [109.781327, 39.608266, 112],
                                [120.38, 37.35, 112],
                                [122.207216, 29.985295, 112],
                                [123.97, 47.33, 114],
                                [120.13, 33.38, 100],
                                [118.87, 42.28, 16],
                                [120.33, 36.07, 450],
                                [121.52, 36.89, 118],
                                [102.188043, 38.520089, 119],
                                [118.58, 24.93, 21],
                                [120.53, 36.86, 300],
                                [119.46, 35.42, 121],
                                [119.97, 35.88, 125],
                                [121.05, 32.08, 23],
                                [91.11, 29.97, 321],
                                [112.02, 22.93, 444],
                                [116.1, 24.55, 25],
                                [122.05, 37.2, 456],
                                [121.48, 31.22, 125],
                                [101.718637, 26.582347, 125],
                                [122.1, 37.5, 25],
                                [117.93, 40.97, 25],
                                [118.1, 24.46, 126],
                                [115.375279, 22.786211, 26],
                                [116.63, 23.68, 247],
                                [124.37, 40.13, 227],
                                [121.1, 31.45, 427],
                                [103.79, 25.51, 327],
                                [121.39, 37.52, 28],
                                [119.3, 26.08, 29],
                                [121.979603, 39.627114, 30],
                                [120.45, 36.38, 30],
                                [123.97, 41.97, 31],
                                [102.52, 24.35, 31],
                                [114.87, 40.82, 31],
                                [113.57, 37.85, 31],
                                [119.942327, 37.177017, 32],
                                [120.1, 30.86, 32],
                                [116.69, 23.39, 32],
                                [120.95, 31.39, 33],
                                [121.56, 29.86, 33],
                                [110.359377, 21.270708, 33],
                                [116.35, 23.55, 34],
                                [122.41, 37.16, 34],
                                [119.16, 34.59, 35],
                                [120.836932, 40.711052, 35],
                                [120.74, 31.64, 236],
                                [113.75, 23.04, 336],
                                [114.68, 23.73, 36],
                                [119.15, 33.5, 436],
                                [119.9, 32.49, 236],
                                [108.33, 22.84, 437],
                                [122.18, 40.65, 37],
                                [114.4, 23.09, 337],
                                [120.26, 31.91, 37],
                                [120.75, 37.8, 37],
                                [113.62, 24.84, 38],
                                [98.289152, 39.77313, 38],
                                [113.23, 23.16, 138],
                                [109.47, 36.6, 138],
                                [112.53, 37.87, 139],
                                [113.01, 23.7, 139],
                                [113.38, 22.52, 139],
                                [102.73, 25.04, 139],
                                [118.73, 36.86, 440],
                                [122.070714, 41.119997, 40],
                                [113.08, 36.18, 41],
                                [114.07, 22.62, 41],
                                [113.52, 22.3, 42],
                                [118.3, 33.96, 43],
                                [108.72, 34.36, 43],
                                [109.11, 35.09, 44],
                                [119.97, 36.77, 44],
                                [113.11, 23.05, 44],
                                [110.35, 20.02, 44],
                                [113.06, 22.61, 45],
                                [117.53, 36.72, 45],
                                [112.44, 23.05, 46],
                                [121.62, 38.92, 47],
                                [111.5, 36.08, 47],
                                [120.63, 31.16, 47],
                                [106.39, 39.04, 49],
                                [123.38, 41.8, 50],
                                [120.62, 31.32, 50],
                                [110.88, 21.68, 50],
                                [120.76, 30.77, 51],
                                [125.35, 43.88, 51],
                                [120.03336, 36.264622, 52],
                                [106.27, 38.47, 52],
                                [120.555821, 31.875428, 52],
                                [111.19, 34.76, 53],
                                [121.15, 41.13, 154],
                                [115.89, 28.68, 154],
                                [109.4, 24.33, 154],
                                [109.511909, 18.252847, 154],
                                [104.778442, 29.33903, 156],
                                [126.57, 43.87, 156],
                                [111.95, 21.85, 257],
                                [105.39, 28.91, 157],
                                [101.74, 36.56, 157],
                                [104.56, 29.77, 258],
                                [111.65, 40.82, 58],
                                [104.06, 30.67, 58],
                                [113.3, 40.12, 58],
                                [119.44, 32.2, 59],
                                [110.28, 25.29, 59],
                                [110.479191, 29.117096, 59],
                                [119.82, 31.36, 59],
                                [109.12, 21.49, 60],
                                [108.95, 34.27, 61],
                                [119.56, 31.74, 62],
                                [118.49, 37.46, 62],
                                [129.58, 44.6, 63],
                                [106.9, 27.7, 63],
                                [120.58, 30.01, 63],
                                [119.42, 32.39, 64],
                                [119.95, 31.79, 64],
                                [119.1, 36.62, 65],
                                [106.54, 29.59, 66],
                                [121.420757, 28.656386, 67],
                                [118.78, 32.04, 67],
                                [118.03, 37.36, 70],
                                [106.71, 26.57, 71],
                                [120.29, 31.59, 71],
                                [123.73, 41.3, 71],
                                [84.77, 45.59, 72],
                                [109.5, 34.52, 72],
                                [118.48, 31.56, 72],
                                [107.15, 34.38, 72],
                                [113.21, 35.24, 75],
                                [119.16, 31.95, 75],
                                [116.46, 39.92, 79],
                                [117.2, 34.26, 79],
                                [115.72, 37.72, 80],
                                [110, 40.58, 80],
                                [104.73, 31.48, 80],
                                [87.68, 43.77, 84],
                                [117.57, 34.86, 84],
                                [120.19, 30.26, 84],
                                [118.05, 36.78, 85],
                                [122.85, 41.12, 86],
                                [119.48, 31.43, 86],
                                [86.06, 41.68, 86],
                                [114.35, 36.1, 190],
                                [114.35, 34.79, 390],
                                [117, 36.65, 292],
                                [104.37, 31.13, 393],
                                [120.65, 28.01, 95],
                                [115.97, 29.71, 96],
                                [114.47, 36.6, 98],
                                [119.72, 30.23, 99],
                                [103.73, 36.03, 99],
                                [116.83, 38.33, 100],
                                [118.35, 35.05, 103],
                                [106.110698, 30.837793, 104],
                                [117.2, 39.13, 105],
                                [119.95, 30.07, 106],
                                [117.13, 36.18, 112],
                                [120.23, 29.71, 112],
                                [113.65, 34.76, 113],
                                [126.63, 45.75, 114],
                                [115.97, 36.45, 116],
                                [118.38, 31.33, 117],
                                [118.02, 39.63, 119],
                                [113.29, 33.75, 119],
                                [114.48, 37.05, 119],
                                [116.29, 37.45, 120],
                                [116.59, 35.38, 120],
                                [112.239741, 30.335165, 127],
                                [111.3, 30.7, 130],
                                [120.06, 29.32, 132],
                                [119.92, 28.45, 133],
                                [112.44, 34.7, 134],
                                [119.57, 39.95, 136],
                                [113.16, 27.83, 143],
                                [114.48, 38.03, 147],
                                [117.67, 36.19, 148],
                                [111.69, 29.05, 152],
                                [115.48, 38.85, 153],
                                [112.91, 27.87, 154],
                                [119.64, 29.12, 157],
                                [113.09, 29.37, 169],
                                [113, 28.21, 175],
                                [118.88, 28.97, 177],
                                [116.7, 39.53, 193],
                                [115.480656, 35.23375, 194],
                                [117.27, 31.86, 229],
                                [114.31, 30.52, 273],
                                [125.03, 46.58, 279],
                            ],
                        },
                    ],
                },
                sel167826175649789:
                    '公告：公司从元月1号起执行钉钉打卡，一个月有三次补卡机会，请相互转告。',
                sel167826111093270: {
                    number: [13432432],
                    content: '{nt}个',
                },
                sel167284014437157: {
                    color: ['#3D91F7', '#61BE67'],
                    tooltip: {},
                    legend: {
                        show: true,
                        icon: 'circle',
                        bottom: 30,
                        center: 0,
                        itemWidth: 14,
                        itemHeight: 14,
                        itemGap: 21,
                        orient: 'horizontal',
                        data: ['a', 'b'],
                        textStyle: {
                            fontSize: '70%',
                            color: '#8C8C8C',
                        },
                    },
                    radar: {
                        radius: '80%',
                        triggerEvent: true,
                        name: {
                            textStyle: {
                                color: '#fff',
                                fontSize: '20',
                                borderRadius: 3,
                                padding: [3, 5],
                            },
                        },
                        nameGap: '2',
                        indicator: [
                            {
                                name: '资金周转',
                                max: 6500,
                            },
                            {
                                name: '其他',
                                max: 16000,
                            },
                            {
                                name: '金融理财',
                                max: 30000,
                            },
                            {
                                name: '投资',
                                max: 38000,
                            },
                            {
                                name: '个人消费',
                                max: 52000,
                            },
                            {
                                name: '固定资产',
                                max: 25000,
                            },
                            {
                                name: '生产经营',
                                max: 25000,
                            },
                        ],
                        splitArea: {
                            areaStyle: {
                                color: [
                                    'rgba(222,134,85, 1)',
                                    'rgba(222,134,85, 0.8)',
                                    'rgba(222,134,85, 0.6)',
                                    'rgba(222,134,85, 0.4)',
                                    'rgba(222,134,85, 0.2)',
                                    'rgba(222,134,85, 0.1)',
                                ],
                            },
                        },
                        axisLine: {
                            lineStyle: {
                                color: 'rgba(0,0,0,0)',
                            },
                        },
                        splitLine: {
                            lineStyle: {
                                width: 2,
                                color: [
                                    'rgba(224,134,82, 1)',
                                    'rgba(224,134,82, 0.8)',
                                    'rgba(224,134,82, 0.6)',
                                    'rgba(224,134,82, 0.4)',
                                    'rgba(224,134,82, 0.2)',
                                    'rgba(224,134,82, 0.1)',
                                ],
                            },
                        },
                    },
                    series: [
                        {
                            name: '一级权重分析',
                            type: 'radar',
                            areaStyle: {
                                normal: {
                                    color: 'rgba(252,211,3, 0.3)',
                                },
                            },
                            symbolSize: 0,
                            lineStyle: {
                                normal: {
                                    color: 'rgba(252,211,3, 1)',
                                    width: 1,
                                },
                            },
                            data: [
                                {
                                    value: [
                                        4300, 10000, 28000, 35000, 50000, 19000,
                                        21000,
                                    ],
                                    name: '因素',
                                },
                            ],
                        },
                    ],
                },
                sel167283995662848: {
                    title: {
                        text: '山西省甲烷排放量',
                        x: 'center',
                        y: '4%',
                        textStyle: {
                            color: '#fff',
                            fontSize: '22',
                        },
                        subtextStyle: {
                            color: '#90979c',
                            fontSize: '16',
                        },
                    },
                    tooltip: {
                        trigger: 'axis',
                        axisPointer: {
                            type: 'shadow',
                        },
                    },
                    grid: {
                        top: '15%',
                        right: '3%',
                        left: '5%',
                        bottom: '12%',
                    },
                    xAxis: [
                        {
                            type: 'category',
                            data: [
                                '制造业',
                                '建筑业',
                                '农林牧渔',
                                '房地产',
                                '金融业',
                                '居民服务及其他',
                            ],
                            axisLine: {
                                lineStyle: {
                                    color: 'rgba(255,255,255,0.12)',
                                },
                            },
                            axisLabel: {
                                margin: 10,
                                color: '#e2e9ff',
                                textStyle: {
                                    fontSize: 14,
                                },
                            },
                        },
                    ],
                    yAxis: [
                        {
                            name: '单位：万元',
                            axisLabel: {
                                formatter: '{value}',
                                color: '#e2e9ff',
                            },
                            axisLine: {
                                show: false,
                                lineStyle: {
                                    color: 'rgba(255,255,255,1)',
                                },
                            },
                            splitLine: {
                                lineStyle: {
                                    color: 'rgba(255,255,255,0.12)',
                                },
                            },
                        },
                    ],
                    series: [
                        {
                            type: 'bar',
                            data: [5000, 2600, 1300, 1300, 1250, 1500],
                            barWidth: '20px',
                            itemStyle: {
                                normal: {
                                    color: {
                                        colorStops: [
                                            {
                                                offset: 0,
                                                color: 'rgba(0,244,255,1)',
                                            },
                                            {
                                                offset: 1,
                                                color: 'rgba(0,77,167,1)',
                                            },
                                        ],
                                        x: 0,
                                        y: 0,
                                        x2: 0,
                                        y2: 1,
                                        type: 'linear',
                                        global: false,
                                    },
                                    barBorderRadius: [30, 30, 30, 30],
                                    shadowColor: 'rgba(0,160,221,1)',
                                    shadowBlur: 4,
                                },
                            },
                            label: {
                                normal: {
                                    show: true,
                                    lineHeight: 30,
                                    width: 80,
                                    height: 30,
                                    backgroundColor: 'rgba(0,160,221,0.1)',
                                    borderRadius: 200,
                                    position: ['-8', '-60'],
                                    distance: 1,
                                    formatter:
                                        '    {d|●}, {a|{c}}     \n,    {b|}',
                                    rich: {
                                        d: {
                                            color: '#3CDDCF',
                                        },
                                        a: {
                                            color: '#fff',
                                            align: 'center',
                                        },
                                        b: {
                                            width: 1,
                                            height: 30,
                                            borderWidth: 1,
                                            borderColor: '#234e6c',
                                            align: 'left',
                                        },
                                    },
                                },
                            },
                        },
                    ],
                },
                sel16728397626137: {
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
                                color: '#fff',
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
                            color: '#fff',
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
                                    color: '#DCE2E8',
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
                                    color: '#DCE2E8',
                                },
                            },
                            axisLabel: {
                                textStyle: {
                                    color: '#fff',
                                },
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
                            },
                            axisLine: {
                                show: true,
                                lineStyle: {
                                    color: '#DCE2E8',
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
                                color: {
                                    colorStops: [
                                        {
                                            offset: 0,
                                            color: '#9effff',
                                        },
                                        {
                                            offset: 1,
                                            color: '#9E87FF',
                                        },
                                    ],
                                    x: 0,
                                    y: 1,
                                    x2: 0,
                                    y2: 0,
                                    type: 'linear',
                                    global: false,
                                },
                                shadowColor: 'rgba(158,135,255, 0.3)',
                                shadowBlur: 10,
                                shadowOffsetY: 20,
                            },
                            itemStyle: {
                                normal: {
                                    color: '#9E87FF',
                                    borderColor: '#9E87FF',
                                },
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
                                color: {
                                    colorStops: [
                                        {
                                            offset: 0,
                                            color: '#73DD39',
                                        },
                                        {
                                            offset: 1,
                                            color: '#73DDFF',
                                        },
                                    ],
                                    x: 1,
                                    y: 1,
                                    x2: 0,
                                    y2: 0,
                                    type: 'linear',
                                    global: false,
                                },
                                shadowColor: 'rgba(115,221,255, 0.3)',
                                shadowBlur: 10,
                                shadowOffsetY: 20,
                            },
                            itemStyle: {
                                normal: {
                                    color: '#73DDFF',
                                    borderColor: '#73DDFF',
                                },
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
                                color: {
                                    colorStops: [
                                        {
                                            offset: 0,
                                            color: '#fe9a',
                                        },
                                        {
                                            offset: 1,
                                            color: '#fe9a8b',
                                        },
                                    ],
                                    x: 0,
                                    y: 0,
                                    x2: 1,
                                    y2: 0,
                                    type: 'linear',
                                    global: false,
                                },
                                shadowColor: 'rgba(254,154,139, 0.3)',
                                shadowBlur: 10,
                                shadowOffsetY: 20,
                            },
                            itemStyle: {
                                normal: {
                                    color: '#fe9a8b',
                                    borderColor: '#fe9a8b',
                                },
                            },
                        },
                    ],
                },
                sel167283549375372: '湖北可视化大屏',
                sel16732588644002: {
                    title: {
                        text: '一周跑步数据',
                        textStyle: {
                            color: '#fff',
                            fontSize: 32,
                            fontWeight: 'normal',
                        },
                        subtext: '2023/1/9',
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
                            color: 'rgba(255,255,255,.8)',
                            fontSize: 12,
                        },
                        data: ['1/3', '1/4', '1/5', '1/6', '1/7', '1/8', '1/9'],
                    },
                    yAxis: {
                        name: 'km/h',
                        nameLocation: 'end',
                        nameGap: 24,
                        nameTextStyle: {
                            color: 'rgba(255,255,255,.5)',
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
                            color: 'rgba(255,255,255,.8)',
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
                                    value: [8502, 4.633, 4.953, 0.4],
                                    name: '平均指标',
                                    itemStyle: {
                                        normal: {
                                            color: '#f8d351',
                                        },
                                    },
                                    lineStyle: {
                                        normal: {
                                            opacity: 0,
                                        },
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
                                    value: [2489, 6.403, 8.843, 0.4],
                                    name: '我的指标',
                                    itemStyle: {
                                        normal: {
                                            color: '#43dfa2',
                                        },
                                    },
                                    lineStyle: {
                                        normal: {
                                            opacity: 0,
                                        },
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
                                    color: '#fff',
                                },
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
                            data: [2489, 10762, 9179, 6797, 10636, 5531, 6807],
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
                                    color: '#000',
                                    opacity: 0,
                                },
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
                                    color: '#000',
                                    opacity: 0.1,
                                },
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
                    backgroundColor: 'rgba(2,2,2,0)',
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