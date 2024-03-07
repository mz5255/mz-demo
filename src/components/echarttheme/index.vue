<template>
    <div>
        <div class="menulist" @click="propertykeyshow = !propertykeyshow">
            <div class="selected">
                <div class="title">{{ selecteddata.title }}</div>
                <template v-for="(itemcolor, i) in selecteddata.colors">
                    <div class="item" :key="i" :style="{ backgroundColor: itemcolor }" v-if="i < 6"></div>
                </template>

            </div>
            <i class="icon selectedIcon" :class="
                propertykeyshow
                    ? 'el-icon-arrow-down'
                    : 'el-icon-arrow-right'
            "></i>
            <div title="更多设置" class="head-btn mr4" @click.stop="openEchartTheme()">
                <nxsvgicon iconClass="el-icon-s-tools" className="el-icon-s-tools" style="font-size: 18px;"></nxsvgicon>
            </div>
            <div class="selectitem" v-if="propertykeyshow">

                <div v-for="(item, index) in themelist" :key="index" class="rowitem" @click="change(item)">
                    <div class="title">{{ item.title }}</div>
                    <template v-for="(itemcolor, i) in item.colors">
                        <div class="item" :key="index + '_' + i" :style="{ backgroundColor: itemcolor }" v-if="i < 7">
                        </div>
                    </template>
                </div>

            </div>

        </div>
        <el-dialog title="图标主题设置" width="650px" :visible.sync="echartThemeVisible" v-if="echartThemeVisible" center
            :modal="true">
            <echartthemeconfig :selected="selected" ref="echartthemeconfigRef"></echartthemeconfig>
            <span slot="footer" class="dialog-footer">
                <el-button type="primary" @click="saveEchartTheme">确 定</el-button>
                <el-button @click="echartThemeVisible = false">关闭</el-button>
            </span>

        </el-dialog>
    </div>
</template>
<script>
import nxsvgicon from '@/icons/index.vue'
import echartthemeconfig from './echart-theme-config.vue'
export default {
    props: { selected: [Object] },
    components: { nxsvgicon, echartthemeconfig },
    data() {
        return {
            propertykeyshow: false,
            echartThemeVisible: false,
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
                { "title": "佛手黄", "colors": ["rgb(249,244,220)", "rgb(249,236,195)", "rgb(248,223,114)", "rgb(248,223,112)", "rgb(251,218,65)", "rgb(254,215,26)"] }, { "title": "酪黄", "colors": ["rgb(247,222,152)", "rgb(248,216,106)", "rgb(252,211,55)", "rgb(252,210,23)", "rgb(254,209,16)", "rgb(246,222,173)"] }, { "title": "雅梨黄", "colors": ["rgb(247,218,148)", "rgb(249,211,103)", "rgb(251,205,49)", "rgb(252,203,22)", "rgb(254,204,17)", "rgb(251,200,47)"] }, { "title": "鸡蛋黄", "colors": ["rgb(252,197,21)", "rgb(252,195,7)", "rgb(248,195,135)", "rgb(247,193,115)", "rgb(251,185,41)", "rgb(251,182,18)"] }, { "title": "北瓜黄", "colors": ["rgb(252,183,10)", "rgb(249,166,51)", "rgb(251,164,20)", "rgb(252,161,6)", "rgb(252,161,4)", "rgb(252,140,35)"] }, { "title": "硫华黄", "colors": ["rgb(250,142,22)", "rgb(255,153,0)", "rgb(251,139,5)", "rgb(233,221,182)", "rgb(238,208,69)", "rgb(242,206,43)"] }, { "title": "草黄", "colors": ["rgb(241,202,23)", "rgb(221,200,113)", "rgb(223,194,67)", "rgb(226,192,39)", "rgb(228,191,17)", "rgb(210,180,44)"] }, { "title": "碧螺春绿", "colors": ["rgb(210,177,22)", "rgb(183,174,143)", "rgb(173,158,85)", "rgb(142,128,75)", "rgb(136,115,34)", "rgb(134,112,24)"] }, { "title": "豆汁黄", "colors": ["rgb(104,94,72)", "rgb(105,94,69)", "rgb(100,88,34)", "rgb(94,83,20)", "rgb(249,241,219)", "rgb(248,232,193)"] }, { "title": "鹦鹉冠黄", "colors": ["rgb(249,215,112)", "rgb(255,201,12)", "rgb(242,230,206)", "rgb(240,214,149)", "rgb(244,206,105)", "rgb(246,196,48)"] }, { "title": "芥黄", "colors": ["rgb(249,193,22)", "rgb(249,189,16)", "rgb(229,211,170)", "rgb(232,176,4)", "rgb(235,177,13)", "rgb(217,164,14)"] }, { "title": "灰绿", "colors": ["rgb(181,170,144)", "rgb(182,164,118)", "rgb(183,141,18)", "rgb(135,114,62)", "rgb(135,104,24)", "rgb(138,105,19)"] }, { "title": "淡肉色", "colors": ["rgb(74,64,53)", "rgb(77,64,48)", "rgb(88,71,23)", "rgb(91,73,19)", "rgb(249,223,205)", "rgb(248,224,176)"] }, { "title": "沙石黄", "colors": ["rgb(249,210,125)", "rgb(254,186,7)", "rgb(243,191,76)", "rgb(248,188,49)", "rgb(226,193,124)", "rgb(229,183,81)"] }, { "title": "苍黄", "colors": ["rgb(234,173,26)", "rgb(214,160,29)", "rgb(180,169,146)", "rgb(183,139,38)", "rgb(130,107,72)", "rgb(128,99,50)"] }, { "title": "古铜绿", "colors": ["rgb(129,95,37)", "rgb(131,94,29)", "rgb(79,64,50)", "rgb(80,62,42)", "rgb(81,60,32)", "rgb(83,60,27)"] }, { "title": "金叶黄", "colors": ["rgb(85,59,24)", "rgb(251,242,227)", "rgb(249,232,208)", "rgb(249,203,139)", "rgb(251,185,87)", "rgb(255,166,15)"] }, { "title": "风帆黄", "colors": ["rgb(244,168,58)", "rgb(227,189,141)", "rgb(231,162,63)", "rgb(218,164,90)", "rgb(222,158,68)", "rgb(220,145,35)"] }, { "title": "古铜褐", "colors": ["rgb(192,147,81)", "rgb(151,132,108)", "rgb(152,101,36)", "rgb(102,70,42)", "rgb(93,61,33)", "rgb(92,55,25)"] }, { "title": "淡桃红", "colors": ["rgb(251,236,222)", "rgb(248,179,127)", "rgb(249,125,28)", "rgb(250,126,35)", "rgb(247,205,188)", "rgb(246,206,193)"] }, { "title": "蟹壳红", "colors": ["rgb(240,148,93)", "rgb(240,173,160)", "rgb(238,170,156)", "rgb(238,160,140)", "rgb(234,137,88)", "rgb(242,118,53)"] }, { "title": "柿红", "colors": ["rgb(248,107,29)", "rgb(239,111,72)", "rgb(239,99,43)", "rgb(241,68,29)", "rgb(240,75,34)", "rgb(242,72,27)"] }, { "title": "鹿皮褐", "colors": ["rgb(243,71,24)", "rgb(244,62,6)", "rgb(237,81,38)", "rgb(240,156,90)", "rgb(242,123,31)", "rgb(217,145,86)"] }, { "title": "银灰", "colors": ["rgb(219,133,64)", "rgb(222,118,34)", "rgb(193,178,163)", "rgb(190,126,74)", "rgb(193,101,26)", "rgb(145,128,114)"] }, { "title": "珠母灰", "colors": ["rgb(154,136,120)", "rgb(148,88,51)", "rgb(150,77,34)", "rgb(149,68,22)", "rgb(98,73,65)", "rgb(100,72,61)"] }, { "title": "金驼", "colors": ["rgb(113,54,29)", "rgb(117,49,23)", "rgb(115,46,18)", "rgb(252,99,21)", "rgb(232,180,154)", "rgb(228,104,40)"] }, { "title": "淡豆沙", "colors": ["rgb(216,89,22)", "rgb(183,160,145)", "rgb(183,81,29)", "rgb(139,97,77)", "rgb(140,75,49)", "rgb(135,61,36)"] }, { "title": "柞叶棕", "colors": ["rgb(136,58,30)", "rgb(91,66,58)", "rgb(96,61,48)", "rgb(103,52,36)", "rgb(101,43,28)", "rgb(105,42,27)"] }, { "title": "余烬红", "colors": ["rgb(251,153,104)", "rgb(252,121,48)", "rgb(237,195,174)", "rgb(225,103,35)", "rgb(212,196,183)", "rgb(207,117,67)"] }, { "title": "玫瑰灰", "colors": ["rgb(205,98,39)", "rgb(170,106,76)", "rgb(166,82,44)", "rgb(119,61,49)", "rgb(72,51,50)", "rgb(175,46,43)"] }, { "title": "淡藏花红", "colors": ["rgb(72,37,34)", "rgb(72,30,28)", "rgb(251,238,226)", "rgb(246,220,206)", "rgb(247,207,186)", "rgb(246,173,143)"] }, { "title": "淡玫瑰灰", "colors": ["rgb(246,140,96)", "rgb(249,114,61)", "rgb(250,93,25)", "rgb(238,128,85)", "rgb(207,72,19)", "rgb(184,148,133)"] }, { "title": "栗棕", "colors": ["rgb(177,75,40)", "rgb(134,48,32)", "rgb(134,38,23)", "rgb(89,38,32)", "rgb(90,31,27)", "rgb(92,30,25)"] }, { "title": "极光红", "colors": ["rgb(244,199,186)", "rgb(241,118,102)", "rgb(241,86,66)", "rgb(245,57,28)", "rgb(242,90,71)", "rgb(243,59,31)"] }, { "title": "无花果红", "colors": ["rgb(242,185,178)", "rgb(241,151,144)", "rgb(240,90,70)", "rgb(242,62,35)", "rgb(242,202,201)", "rgb(239,175,173)"] }, { "title": "珊瑚红", "colors": ["rgb(241,144,140)", "rgb(240,63,36)", "rgb(240,161,168)", "rgb(241,147,156)", "rgb(240,124,130)", "rgb(240,74,58)"] }, { "title": "樱桃红", "colors": ["rgb(241,60,34)", "rgb(231,124,142)", "rgb(237,90,101)", "rgb(237,72,69)", "rgb(237,59,47)", "rgb(237,51,33)"] }, { "title": "秋海棠红", "colors": ["rgb(238,72,102)", "rgb(238,72,99)", "rgb(239,71,93)", "rgb(238,63,77)", "rgb(237,51,51)", "rgb(236,43,36)"] }, { "title": "貂紫", "colors": ["rgb(235,38,26)", "rgb(222,42,24)", "rgb(212,37,23)", "rgb(171,55,47)", "rgb(172,31,24)", "rgb(93,49,49)"] }, { "title": "海棠红", "colors": ["rgb(92,34,35)", "rgb(90,25,27)", "rgb(90,18,22)", "rgb(238,162,164)", "rgb(237,85,106)", "rgb(240,55,82)"] }, { "title": "酱紫", "colors": ["rgb(192,72,81)", "rgb(192,44,56)", "rgb(167,83,90)", "rgb(124,24,35)", "rgb(76,31,36)", "rgb(77,16,24)"] }, { "title": "苋菜红", "colors": ["rgb(238,39,70)", "rgb(222,28,49)", "rgb(209,26,45)", "rgb(196,90,101)", "rgb(194,31,48)", "rgb(166,27,41)"] }, { "title": "草珠红", "colors": ["rgb(137,78,84)", "rgb(130,32,43)", "rgb(130,17,31)", "rgb(84,30,36)", "rgb(80,10,22)", "rgb(248,235,230)"] }, { "title": "榲桲红", "colors": ["rgb(236,118,150)", "rgb(239,52,115)", "rgb(234,114,147)", "rgb(236,155,173)", "rgb(235,80,126)", "rgb(237,47,106)"] }, { "title": "豇豆红", "colors": ["rgb(238,184,195)", "rgb(234,81,127)", "rgb(241,196,205)", "rgb(236,138,164)", "rgb(206,87,109)", "rgb(237,157,178)"] }, { "title": "山黎豆红", "colors": ["rgb(239,130,160)", "rgb(235,60,112)", "rgb(236,44,100)", "rgb(227,180,184)", "rgb(204,22,58)", "rgb(194,124,136)"] }, { "title": "卵石紫", "colors": ["rgb(191,53,83)", "rgb(115,87,92)", "rgb(98,22,36)", "rgb(99,7,28)", "rgb(54,40,43)", "rgb(48,22,28)"] }, { "title": "菜头紫", "colors": ["rgb(43,18,22)", "rgb(45,12,19)", "rgb(206,94,138)", "rgb(236,78,138)", "rgb(238,44,121)", "rgb(149,28,72)"] }, { "title": "墨紫", "colors": ["rgb(98,29,52)", "rgb(98,16,46)", "rgb(56,33,41)", "rgb(56,25,36)", "rgb(51,20,30)", "rgb(49,15,27)"] }, { "title": "酢酱草红", "colors": ["rgb(238,166,183)", "rgb(239,73,139)", "rgb(222,120,151)", "rgb(222,63,124)", "rgb(209,60,116)", "rgb(197,112,139)"] }, { "title": "芍药耕红", "colors": ["rgb(168,69,107)", "rgb(75,30,47)", "rgb(70,22,41)", "rgb(68,14,37)", "rgb(240,201,207)", "rgb(235,160,179)"] }, { "title": "玫瑰红", "colors": ["rgb(236,45,122)", "rgb(225,108,150)", "rgb(237,227,231)", "rgb(233,215,223)", "rgb(210,86,140)", "rgb(210,53,125)"] }, { "title": "槿紫", "colors": ["rgb(209,194,211)", "rgb(200,173,196)", "rgb(192,142,175)", "rgb(186,47,123)", "rgb(128,118,163)", "rgb(128,109,158)"] }, { "title": "龙须红", "colors": ["rgb(129,92,148)", "rgb(129,60,133)", "rgb(126,22,113)", "rgb(233,204,211)", "rgb(210,118,163)", "rgb(204,85,149)"] }, { "title": "苋菜紫", "colors": ["rgb(230,210,213)", "rgb(195,86,145)", "rgb(192,111,152)", "rgb(189,174,173)", "rgb(181,152,161)", "rgb(155,30,100)"] }, { "title": "青蛤壳紫", "colors": ["rgb(133,109,114)", "rgb(79,56,62)", "rgb(72,41,54)", "rgb(242,231,229)", "rgb(224,200,209)", "rgb(188,132,168)"] }, { "title": "葛巾紫", "colors": ["rgb(173,101,152)", "rgb(163,92,143)", "rgb(152,54,128)", "rgb(139,38,113)", "rgb(137,66,118)", "rgb(126,32,101)"] }, { "title": "乌梅紫", "colors": ["rgb(104,23,82)", "rgb(93,63,81)", "rgb(78,42,64)", "rgb(65,28,53)", "rgb(54,41,47)", "rgb(30,19,29)"] }, { "title": "山梗紫", "colors": ["rgb(28,13,26)", "rgb(241,240,237)", "rgb(226,225,228)", "rgb(204,204,214)", "rgb(167,168,189)", "rgb(97,100,159)"] }, { "title": "野葡萄紫", "colors": ["rgb(116,117,155)", "rgb(207,204,201)", "rgb(82,82,136)", "rgb(46,49,124)", "rgb(122,115,116)", "rgb(48,47,75)"] }, { "title": "景泰蓝", "colors": ["rgb(62,56,65)", "rgb(50,47,59)", "rgb(34,32,46)", "rgb(31,32,64)", "rgb(19,17,36)", "rgb(39,117,182)"] }, { "title": "睛蓝", "colors": ["rgb(36,116,181)", "rgb(208,223,230)", "rgb(147,181,207)", "rgb(97,154,195)", "rgb(35,118,183)", "rgb(86,152,195)"] }, { "title": "群青", "colors": ["rgb(33,119,184)", "rgb(176,213,223)", "rgb(138,188,209)", "rgb(102,169,201)", "rgb(41,131,187)", "rgb(23,114,180)"] }, { "title": "海青", "colors": ["rgb(99,187,208)", "rgb(92,179,204)", "rgb(36,134,185)", "rgb(22,119,179)", "rgb(18,107,174)", "rgb(34,162,195)"] }, { "title": "银鱼白", "colors": ["rgb(26,148,188)", "rgb(21,139,184)", "rgb(17,119,176)", "rgb(15,89,164)", "rgb(43,115,175)", "rgb(205,209,211)"] }, { "title": "钢蓝", "colors": ["rgb(49,112,167)", "rgb(94,97,109)", "rgb(71,81,100)", "rgb(255,254,250)", "rgb(53,51,60)", "rgb(15,20,35)"] }, { "title": "蝶翅蓝", "colors": ["rgb(186,204,217)", "rgb(143,178,201)", "rgb(22,97,171)", "rgb(196,203,207)", "rgb(21,85,154)", "rgb(78,124,161)"] }, { "title": "井天蓝", "colors": ["rgb(52,108,156)", "rgb(47,47,53)", "rgb(45,46,54)", "rgb(19,24,36)", "rgb(216,227,231)", "rgb(195,215,223)"] }, { "title": "星灰", "colors": ["rgb(47,144,185)", "rgb(23,129,181)", "rgb(199,210,212)", "rgb(17,101,154)", "rgb(192,196,195)", "rgb(178,187,190)"] }, { "title": "青灰", "colors": ["rgb(94,121,135)", "rgb(20,74,116)", "rgb(116,120,122)", "rgb(73,92,105)", "rgb(71,72,76)", "rgb(43,51,62)"] }, { "title": "清水蓝", "colors": ["rgb(28,41,56)", "rgb(20,35,52)", "rgb(16,31,48)", "rgb(238,247,242)", "rgb(198,230,232)", "rgb(147,213,220)"] }, { "title": "竹篁绿", "colors": ["rgb(81,196,211)", "rgb(41,183,203)", "rgb(14,176,201)", "rgb(16,174,194)", "rgb(87,195,194)", "rgb(185,222,201)"] }, { "title": "蛙绿", "colors": ["rgb(131,203,172)", "rgb(18,170,156)", "rgb(102,193,140)", "rgb(93,190,138)", "rgb(85,187,138)", "rgb(69,183,135)"] }, { "title": "胆矾蓝", "colors": ["rgb(43,174,133)", "rgb(27,167,132)", "rgb(18,161,130)", "rgb(196,215,214)", "rgb(30,158,179)", "rgb(15,149,176)"] }, { "title": "蜻蜓蓝", "colors": ["rgb(20,145,168)", "rgb(124,171,177)", "rgb(164,172,167)", "rgb(134,157,157)", "rgb(100,142,147)", "rgb(59,129,140)"] }, { "title": "灰蓝", "colors": ["rgb(18,110,130)", "rgb(115,124,123)", "rgb(97,113,114)", "rgb(19,72,87)", "rgb(71,75,76)", "rgb(33,55,61)"] }, { "title": "浪花绿", "colors": ["rgb(19,44,51)", "rgb(164,202,182)", "rgb(44,150,120)", "rgb(154,190,175)", "rgb(105,167,148)", "rgb(146,179,165)"] }, { "title": "飞泉绿", "colors": ["rgb(36,128,103)", "rgb(66,134,117)", "rgb(159,163,154)", "rgb(138,152,142)", "rgb(112,136,125)", "rgb(73,117,104)"] }, { "title": "苷蓝绿", "colors": ["rgb(93,101,95)", "rgb(49,74,67)", "rgb(34,62,54)", "rgb(26,59,50)", "rgb(54,52,51)", "rgb(31,38,35)"] }, { "title": "淡绿", "colors": ["rgb(20,30,27)", "rgb(198,223,200)", "rgb(158,204,171)", "rgb(104,184,142)", "rgb(32,161,98)", "rgb(97,172,133)"] }, { "title": "松霜绿", "colors": ["rgb(64,160,112)", "rgb(34,148,83)", "rgb(202,211,195)", "rgb(60,149,102)", "rgb(32,137,77)", "rgb(131,167,141)"] }, { "title": "白屈菜绿", "colors": ["rgb(87,149,114)", "rgb(32,127,76)", "rgb(110,139,116)", "rgb(26,104,64)", "rgb(94,102,91)", "rgb(72,91,77)"] }, { "title": "艾背绿", "colors": ["rgb(57,55,51)", "rgb(55,56,52)", "rgb(43,49,44)", "rgb(21,35,27)", "rgb(240,245,229)", "rgb(223,236,213)"] }, { "title": "姚黄", "colors": ["rgb(173,213,162)", "rgb(65,179,73)", "rgb(67,178,68)", "rgb(65,174,60)", "rgb(226,231,191)", "rgb(208,222,170)"] }, { "title": "芽绿", "colors": ["rgb(178,207,135)", "rgb(140,194,105)", "rgb(183,208,122)", "rgb(210,217,122)", "rgb(186,207,101)", "rgb(150,194,78)"] }, { "title": "汉白玉", "colors": ["rgb(226,216,73)", "rgb(190,201,54)", "rgb(91,174,35)", "rgb(37,61,36)", "rgb(255,254,248)", "rgb(248,244,237)"] }, { "title": "中灰", "colors": ["rgb(255,254,249)", "rgb(247,244,237)", "rgb(228,223,215)", "rgb(218,212,203)", "rgb(187,181,172)", "rgb(187,181,172)"] }],
            colorlist: []
        }
    },
    created() {
        this.themelist.forEach(ee => {
            this.colorlist = this.colorlist.concat(ee.colors)
        })
    },
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
        openEchartTheme() {
            this.echartThemeVisible = true
        },
        saveEchartTheme() {
            let echartThemeList = this.$refs.echartthemeconfigRef.saveEchartTheme();
            if (echartThemeList == null) {
                return
            }
            this.$emit('setEchartTheme', { title: "自定义", colors: echartThemeList })
            this.echartThemeVisible = false
        },
        change(item) {
            this.$emit('setEchartTheme', item)
        },

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

.menulist .selected .title {
    line-height: 22px;
    margin-right: 8px;
    width: 40px;
    font-size: 10px;
}

.menulist .selected {
    display: flex;
    width: auto;
}

.menulist .selected .item {
    width: 20px;
    height: 20px;
    background-color: red;
    border-radius: 50%;
    margin-left: 6px;
    margin-right: 6px;
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

.selectedIcon {

    padding-right: 8px;
    padding-top: 5px;

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

.selectitem .item:hover {}
</style>
