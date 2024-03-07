<template>
    <div class="bgcssconfig">
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
            <div class="color-angle-title">随机生成：</div>
            <div class="color-angle-content"> <el-input-number v-model="angle" size="mini" :min="5" :max="20" :step="1"
                    style="width: 100%;"></el-input-number> <el-button @click="buildrandomtheme">生成</el-button>
            </div>
        </div>
        <el-col :span="24" style="display: flex;">
            <div class="color-box">
                <div class="color-box-title">默认扩展色：</div>
                <div class="color-box-content">
                    <div class="color-item" v-for="i  in 55" :key="i" @click="clickcoloritem(1, i)"
                        :style="'background-color:' + transparentToOpaque(selectcolor, i) + ';'">
                    </div>

                </div>
            </div>
            <div class="color-box">
                <div class="color-box-title">透明扩展色：</div>
                <div class="color-box-content">

                    <div class="color-item" v-for="i  in 55" :key="i">
                        <div class="color-bg-item"></div>
                        <div class="color-bg-color" @click="clickcoloritem(2, i)"
                            :style="'background-color: ' + transparentColor(selectcolor, i) + ';'">
                        </div>
                    </div>

                </div>
            </div>
        </el-col>

    </div>
</template>
<script>
import nxsvgicon from '@/icons/index.vue'
import colorpicker from '../menulist/color-picker.vue'
export default {
    props: ['selected'],
    data() {
        return { colorlist: [], showColorPicker: false, selectcolor: '', selectindex: 0, angle: 5 }
    },
    components: { colorpicker, nxsvgicon },
    created() {
        this.getBackgroundGradient()
        if (this.colorlist.length > 0) {
            this.angle = this.colorlist.length
        }
    },
    methods: {
        buildrandomtheme() {
            let colors = [];
            for (let i = 0; i < this.angle; i++) {
                let color = this.getRandomColor()
                if (colors.indexOf(color) < 0) {
                    colors.push(color); // 生成0到99之间的随机整数
                } else {
                    i = i - 1;
                }
            }
            this.selectcolor = this.colorlist[0]
            this.selectindex = 0
            this.colorlist = colors
        },
        getRandomColor() {
            var letters = '0123456789ABCDEF';
            var color = '#';
            for (var i = 0; i < 6; i++) {
                color += letters[Math.floor(Math.random() * 16)];
            }
            return this.hexToRgba(color, 1);
        },
        hexToRgba(hex, alpha) {
            var r = parseInt(hex.substring(1, 3), 16);
            var g = parseInt(hex.substring(3, 5), 16);
            var b = parseInt(hex.substring(5, 7), 16);
            return 'rgba(' + r + ', ' + g + ', ' + b + ', ' + alpha + ')';
        },
        getBackgroundGradient() {
            if (this.selected != null) {
                this.colorlist = this.selected.colors
                this.selectcolor = this.colorlist[0]
                this.selectindex = 0
                this.$forceUpdate()
            }
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
        saveEchartTheme() {
            if (this.colorlist.length < 5) {
                this.$message.error("图标颜色不能少于5种！");
                return null;
            }
            return this.colorlist
        }

    },

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
    width: 630px;
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
    width: 630px;
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

.color-box-angle-plane .color-angle-content {
    display: flex;

    align-items: center;


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