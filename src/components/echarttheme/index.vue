<template>
    <div class="menulist" @click="propertykeyshow = !propertykeyshow">
        <div class="selected">
            <div class="title">{{ selecteddata.title }}</div>
            <div
                class="item"
                v-for="itemcolor in selecteddata.colors"
                :key="itemcolor"
                :style="{ backgroundColor: itemcolor }"
            ></div>
            <i
                class="icon"
                :class="
                    propertykeyshow
                        ? 'el-icon-arrow-down'
                        : 'el-icon-arrow-right'
                "
            ></i>
        </div>
        <div class="selectitem" v-if="propertykeyshow">
            <div
                v-for="item in themelist"
                :key="item"
                class="rowitem"
                @click="change(item)"
            >
                <div class="title">{{ item.title }}</div>
                <div
                    class="item"
                    v-for="itemcolor in item.colors"
                    :key="itemcolor"
                    :style="{ backgroundColor: itemcolor }"
                ></div>
            </div>
        </div>
    </div>
</template>
<script>
export default {
    props: { selected: [Object] },
    data() {
        return {
            propertykeyshow: false,
            themelist: [
                {
                    title: '明亮',
                    colors: [
                        'rgb(73, 146, 255)',
                        'rgb(124, 255, 178)',
                        'rgb(253, 221, 96)',
                        'rgb(255, 110, 118)',
                        'rgb(88, 217, 249)',
                        'rgb(5, 192, 145)',
                    ],
                },
                {
                    title: '暗淡',
                    colors: [
                        'rgb(84, 112, 198)',
                        'rgb(145, 204, 117)',
                        'rgb(250, 200, 88)',
                        'rgb(238, 102, 102)',
                        'rgb(115, 192, 222)',
                        'rgb(59, 162, 114)',
                    ],
                },
                {
                    title: '马卡龙',
                    colors: [
                        'rgb(46, 199, 201)',
                        'rgb(182, 162, 222)',
                        'rgb(90, 177, 239)',
                        'rgb(255, 185, 128)',
                        'rgb(216, 122, 128)',
                        'rgb(141, 152, 179)',
                    ],
                },
                {
                    title: '蓝绿',
                    colors: [
                        'rgb(63, 177, 227)',
                        'rgb(107, 230, 193)',
                        'rgb(98, 108, 145)',
                        'rgb(160, 167, 230)',
                        'rgb(196, 235, 173)',
                        'rgb(150, 222, 232)',
                    ],
                },
                {
                    title: '深紫',
                    colors: [
                        'rgb(155, 139, 186)',
                        'rgb(224, 152, 199)',
                        'rgb(143, 211, 232)',
                        'rgb(113, 102, 158)',
                        'rgb(204, 112, 175)',
                        'rgb(124, 180, 204)',
                    ],
                },
                {
                    title: '复古',
                    colors: [
                        'rgb(216, 124, 124)',
                        'rgb(145, 158, 139)',
                        'rgb(215, 171, 130)',
                        'rgb(110, 112, 116)',
                        'rgb(97, 160, 168)',
                        'rgb(239, 161, 141)',
                    ],
                },
                {
                    title: '粉青',
                    colors: [
                        'rgb(252, 151, 175)',
                        'rgb(135, 247, 207)',
                        'rgb(247, 244, 148)',
                        'rgb(114, 204, 255)',
                        'rgb(247, 197, 160)',
                        'rgb(212, 164, 235)',
                    ],
                },
                {
                    title: '灰粉',
                    colors: [
                        'rgb(81, 107, 145)',
                        'rgb(89, 196, 230)',
                        'rgb(237, 175, 218)',
                        'rgb(147, 183, 227)',
                        'rgb(165, 231, 240)',
                        'rgb(203, 176, 227)',
                    ],
                },
                {
                    title: '青草',
                    colors: [
                        'rgb(78, 163, 151)',
                        'rgb(34, 195, 170)',
                        'rgb(123, 217, 165)',
                        'rgb(208, 100, 138)',
                        'rgb(245, 141, 178)',
                        'rgb(242, 179, 201)',
                    ],
                },
                {
                    title: '橘红',
                    colors: [
                        'rgb(137, 52, 72)',
                        'rgb(217, 88, 80)',
                        'rgb(235, 129, 70)',
                        'rgb(255, 178, 72)',
                        'rgb(242, 214, 67)',
                        'rgb(235, 219, 164)',
                    ],
                },
                {
                    title: '深色',
                    colors: [
                        'rgb(193, 46, 52)',
                        'rgb(230, 182, 0)',
                        'rgb(0, 152, 217)',
                        'rgb(43, 130, 29)',
                        'rgb(0, 94, 170)',
                        'rgb(51, 156, 168)',
                    ],
                },
                {
                    title: '罗马红',
                    colors: [
                        'rgb(224, 31, 84)',
                        'rgb(94, 78, 165)',
                        'rgb(245, 232, 200)',
                        'rgb(184, 210, 199)',
                        'rgb(198, 179, 142)',
                        'rgb(164, 216, 194)',
                    ],
                },
            ],
        }
    },
    created() {},
    computed: {
        selecteddata() {
            if (this.selected !== undefined) {
                return this.selected
            } else {
                return this.themelist[0]
            }
        },
    },
    methods: {
        change(item) {
            this.$emit('update:selected', item)
        },
    },
}
</script>
<style scoped>
.menulist {
    height: 20px;
    width: 90%;
    padding: 4px;
    border: 1px solid #0a8efb;
    border-radius: 4px;
    float: left;
    position: relative;
}

.menulist .selected .title {
    line-height: 22px;
    margin-right: 8px;
    width: 50px;
}

.menulist .selected {
    display: flex;
}

.menulist .selected .item {
    width: 20px;
    height: 20px;
    background-color: red;
    border-radius: 50%;
    margin-left: 8px;
    margin-right: 8px;
}

.menulist .selected .icon {
    right: 5px;
    padding-right: 8px;
    padding-top: 5px;
    position: absolute;
}

.selectitem {
    width: 100%;
    max-height: 250px;
    position: absolute;
    overflow-y: auto;
    overflow-x: hidden;
    z-index: 700;
    top: 32px;
    left: 0px;
    background: var(--datav-layer-bg);
}

.rowitem {
    border-bottom: 1px solid #0a8efb57;
    display: flex;
}

.rowitem .title {
    line-height: 30px;
    padding-left: 8px;
    padding-right: 6px;
    width: 50px;
}

.rowitem .icon {
    right: 5px;
    padding-right: 8px;
    padding-top: 5px;
    position: absolute;
}

.rowitem .item {
    width: 20px;
    height: 20px;
    background-color: red;
    border-radius: 50%;
    margin-left: 8px;
    margin-right: 8px;
    margin-top: 4px;
}

.selectitem .item:hover {
}
</style>
