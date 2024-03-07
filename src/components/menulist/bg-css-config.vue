<template>
    <div class="bgcssconfig">

        <el-col :span="16">
            <div class="color-box-list-plane">

                <div v-for="(item, i) in colorlist" style="display: flex;" :key="i">
                    <colorpicker v-model="colorlist[i]" class="color-box-list-item"
                        @colorChange="onColorChange(colorlist[i], i)" @deleteItem="deleteItem(i)">
                    </colorpicker>
                    <div class="color-exchange" v-if="i != colorlist.length - 1" @click="exchangeArry(i)">
                        <nxsvgicon iconClass="el-icon-sort" className="el-icon-sort">
                        </nxsvgicon>
                    </div>
                </div>
                <div class="color-box-list-item" @click="addColor">
                    <span>添加</span>
                    <nxsvgicon iconClass="el-icon-plus" className="el-icon-plus">
                    </nxsvgicon>
                </div>

            </div>
            <div class="color-box-angle-plane">
                <div class="color-angle-title">渐变角度：</div>
                <div class="color-angle-content"> <el-slider v-model="angle" :min="0" :max="360" :step="10"
                        show-stops></el-slider>
                </div>
            </div>
            <el-col :span="24" style="display: flex;">
                <div class="color-box">
                    <div class="color-box-title">默认扩展色：</div>
                    <div class="color-box-content">
                        <div class="color-item" v-for="i  in 50" :key="i" @click="clickcoloritem(1, i)"
                            :style="'background-color:' + transparentToOpaque(selectcolor, i) + ';'">
                        </div>

                    </div>
                </div>
                <div class="color-box">
                    <div class="color-box-title">透明扩展色：</div>
                    <div class="color-box-content">

                        <div class="color-item" v-for="i  in 50" :key="i">
                            <div class="color-bg-item"></div>
                            <div class="color-bg-color" @click="clickcoloritem(2, i)"
                                :style="'background-color: ' + transparentColor(selectcolor, i) + ';'">
                            </div>
                        </div>

                    </div>
                </div>
            </el-col>


        </el-col>
        <el-col :span="8" class="rigth-preview-plane">
            <div class="preview" :style="getPreviewCss">效果图</div>
        </el-col>

    </div>
</template>
<script>
import nxsvgicon from '@/icons/index.vue'
import colorpicker from './color-picker.vue'
export default {
    props: ['backgroundcolors'],
    data() {
        return { colorlist: [], showColorPicker: false, selectcolor: '', selectindex: 0, angle: 0 }
    },
    components: { colorpicker, nxsvgicon },
    computed: {
        getPreviewCss() {
            return `background: linear-gradient(${this.angle}deg,${this.colorlist.join(",")});`
        }
    },
    created() {
        this.getBackgroundGradient()
    },
    methods: {
        getBackgroundGradient() {
            this.colorlist = []
            this.selectcolor = ""
            this.selectindex = 0
            this.angle = 0
            if (this.backgroundcolors == null) {

                return
            }
            // 使用正则表达式匹配角度值
            const angleRegex = /linear-gradient\(([^)]+)\)/;
            // 使用正则表达式匹配颜色值
            const colorRegex = /#[0-9a-fA-F]+|rgba?\(\s*(\d+)\s*,\s*(\d+)\s*,\s*(\d+)(?:\s*,\s*([\d.]+))?\s*\)/g;
            const angleMatch = this.backgroundcolors.match(angleRegex);
            if (angleMatch) {
                const angle = angleMatch[1];
                let match;
                while ((match = colorRegex.exec(this.backgroundcolors)) !== null) {
                    if (match[0].startsWith('#') || match[0].startsWith('rgba')) {
                        this.colorlist.push(this.hexToRgba(match[0]))
                    }
                }
                this.angle = parseInt(angle.replace("deg", "")) // 输出 "Angle: 0deg"
            }
            if (this.colorlist.length > 0) {
                this.selectcolor = this.colorlist[0]
            }
            this.$forceUpdate()
        },
        addColor() {
            this.selectindex = this.colorlist.length
            if (this.colorlist.length == 0) {
                this.selectcolor = "rgba(255, 255, 255)"
            } else {
                this.selectcolor = this.colorlist[this.colorlist.length - 1]
            }
            this.colorlist.push(this.selectcolor)
        },
        exchangeArry(index) {
            let color1 = this.colorlist[index]
            let color2 = this.colorlist[index + 1]
            this.colorlist[index] = color2
            this.colorlist[index + 1] = color1
            this.$forceUpdate()
        },
        onColorChange(color, index) {
            this.selectcolor = color
            this.selectindex = index
            this.$forceUpdate()
        },
        clickcoloritem(type, i) {
            let selectcolor = ''
            if (type == 1) {
                selectcolor = this.transparentToOpaque(this.selectcolor, i)
            } else {
                selectcolor = this.transparentColor(this.selectcolor, i)
            }
            this.colorlist[this.selectindex] = selectcolor
            this.$forceUpdate()
        },
        transparentColor(rgbColor, i) {
            var parts = rgbColor.replace(/rgba|\(|\)/g, '').replace(/rgb|\(|\)/g, "").split(',');
            var r = parseInt(parts[0]);
            var g = parseInt(parts[1]);
            var b = parseInt(parts[2]);
            var k = 1;
            if (parts.length > 3) {
                k = parseFloat(parts[3]);
                // 应用透明度到实际颜色
                var newR = Math.round((1 - k) * 255 + k * r);
                var newG = Math.round((1 - k) * 255 + k * g);
                var newB = Math.round((1 - k) * 255 + k * b);
                r = newR
                g = newG
                b = newB

            }
            k = ((100 - (i)) / 100)
            return 'rgba(' + r + ',' + g + ',' + b + ',' + k + ')';
        },
        transparentToOpaque(rgbColor, alpha) {
            alpha = ((100 - (alpha)) / 100)
            var parts = rgbColor.replace(/rgba|\(|\)/g, '').replace(/rgb|\(|\)/g, "").split(',');
            var r = parseInt(parts[0]);
            var g = parseInt(parts[1]);
            var b = parseInt(parts[2]);
            if (parts.length > 3) {
                let k = parseFloat(parts[3]);
                // 应用透明度到实际颜色
                var newR1 = Math.round((1 - k) * 255 + k * r);
                var newG1 = Math.round((1 - k) * 255 + k * g);
                var newB1 = Math.round((1 - k) * 255 + k * b);
                r = newR1
                g = newG1
                b = newB1

            }
            // 应用透明度到实际颜色
            var newR = Math.round((1 - alpha) * 255 + alpha * r);
            var newG = Math.round((1 - alpha) * 255 + alpha * g);
            var newB = Math.round((1 - alpha) * 255 + alpha * b);

            return 'rgba(' + newR + ',' + newG + ',' + newB + ',1)';
        },
        hexToRgba(hex) {
            hex = hex.trim().replace(";", "")
            if (hex.indexOf("rgba") >= 0 || hex.indexOf("rgb") >= 0) {
                return hex;
            }
            // 判断传入的颜色值是否符合十六进制格式
            if (!/^#([0-9a-fA-F]{3}|[0-9a-fA-F]{6})$/.test(hex)) {
                throw new Error('Invalid Hex Color');
            }

            // 去掉#号并将颜色值转换为标准的六位十六进制表示
            hex = hex.replace('#', '');
            if (hex.length === 3) {
                hex = hex[0] + hex[0] + hex[1] + hex[1] + hex[2] + hex[2];
            }

            // 将十六进制颜色值转换为RGB格式
            const r = parseInt(hex.substring(0, 2), 16);
            const g = parseInt(hex.substring(2, 4), 16);
            const b = parseInt(hex.substring(4, 6), 16);

            // 返回RGBA格式的颜色值
            return `rgba(${r}, ${g}, ${b},1)`;
        },
        deleteItem(i) {
            if (i < this.selectindex) {
                this.selectindex = this.selectindex - 1
            } else if (i == this.selectindex) {
                if (this.colorlist.length > 0) {
                    this.selectcolor = this.colorlist[0];
                    this.selectindex = 0
                } else {
                    this.selectcolor = ""
                    this.selectindex = 0
                }
            }
            this.colorlist.splice(i, 1)

        },
        saveBackgroundGradient() {
            if (this.colorlist.length == 0) {
                this.$message.error("至少设置一个背景色！");
                return '';
            }
            return `background: linear-gradient(${this.angle}deg,${this.colorlist.join(",")});`
        }

    },
    watch: {
        backgroundcolors() {
            this.getBackgroundGradient();
        }
    }
}
</script>
<style scoped>
.rigth-preview-plane {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 347px;
}

.bgcssconfig>>>.el-form-item__content {
    display: flex;
}

.preview {
    width: 100%;
    height: 100%;
    background-color: #2c2c32;
    border-radius: 4px;
    display: flex;
    /* 设置容器为flex布局 */
    justify-content: center;
    /* 水平居中对齐内容 */
    align-items: center;
    /* 垂直居中对齐内容 */
}

.color-box {
    background-color: #2c2c32;
    height: 175px;
    width: 50%;
    margin: 8px;
    border-radius: 4px;
}

.color-box>>>.color-box-title {
    padding: 4px 8px;
}

.color-box-list-plane {
    background-color: #2c2c32;
    width: 590px;
    margin: 8px;
    display: flex;
    text-align: left;
    flex-flow: wrap;
    gap: 0px 4px;
    padding: 0px 8px;
    max-height: 120px;
    overflow-y: auto;
    border-radius: 4px;
}

.color-box-angle-plane {
    background-color: #2c2c32;
    width: 590px;
    margin: 8px;
    display: flex;
    line-height: 30px;
    border-radius: 4px;
}

.color-box-angle-plane .color-angle-title {
    font-size: 14px;
    padding-left: 8px;
    padding-top: 4px;
}

.color-box-angle-plane .color-angle-content>>>.el-slider {
    width: 300px;
}

.color-box-content {
    display: flex;
    flex-flow: wrap;
    justify-content: center;
    gap: 4px 4px;
    margin: 0px 8px;

}

.color-box-content .color-item {
    position: relative;
    display: inline-block;
    height: 22px;
    width: 22px;
    cursor: pointer;
    overflow: hidden;
    border-radius: 4px;

}

.color-box-content .color-item .color-bg-color {
    height: 22px;
    width: 22px;

    position: absolute;
    z-index: 9;
    top: 0px;
    left: 0px;
}

.color-box-content .color-bg-item {
    height: 22px;
    width: 22px;
    background-color: white;
}

.color-box-content .color-bg-item::after {
    background-image: linear-gradient(45deg, #DDD 25%, #0000 25%), linear-gradient(-45deg, #DDD 25%, #0000 25%), linear-gradient(45deg, #0000 75%, #DDD 75%), linear-gradient(-45deg, #0000 75%, #DDD 75%);
    background-size: 12px 12px;
    background-position: 0 0, 0 6px, 6px -6px, -6px 0px;
    background-repeat: repeat;
    content: "";
    position: absolute;
    left: 0;
    right: 0;
    top: 0;
    bottom: 0;
}

.color-box-list-item {
    width: 130px;
    height: 34px;
    background-color: rgba(36, 134, 185, 0.2);
    color: #2486b9;
    position: relative;
    margin: 8px 0px;
    text-align: center;
    line-height: 34px;
    border-radius: 4px;
    cursor: pointer;
}

.color-box-list-item span {
    position: relative;
    top: -1px;
}

.color-box-list-item i {
    font-size: 20px;
    font-weight: bold;
    position: relative;
    top: 2px;
}

.color-exchange {
    position: relative;
    top: 12px;
    cursor: pointer;
}

.color-exchange i {
    transform: rotate(90deg);
}
</style>