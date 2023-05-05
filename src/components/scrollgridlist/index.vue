<template>
  <div :id="controlid" style="width: 100%; height: 100%;">
    <div class="hide">
      <slot></slot>
    </div>
    <div class="listhead" :style="headstyle" v-if="isheadshow">
      <div v-for="(item,columnindex) in getcolumns" :key="columnindex" class="th" :style="item.componentOptions.propsData.thstyle">
        {{ item.componentOptions.propsData.lable }}
      </div>
    </div>
    <vueSeamlessScroll :data="griddata" :class-option="getoptionconfig" class="seamless-warp" :style="isheadshow?' height: calc(100% );':' height: calc(100% - 30px);'">
      <div class="listbody" :style="bodystyle">
        <div v-for="(row, index) in griddata" :key="index" class="tr" :class="{ singlerow: index % 2 === 0, doublerow: index % 2 === 1 }" @click="clickrow(row)">
          <gridtd v-for="(column,columnindex) in getcolumns" :key="columnindex" :column="column" :row="row" :index="index" :style="column.componentOptions.propsData.tdstyle" class="td"></gridtd>
        </div>
      </div>
    </vueSeamlessScroll>
  </div>
</template>
<script>
import vueSeamlessScroll from 'vue-seamless-scroll'
import gridtd from './gridtd.vue'
export default {
  props: {
    scrollnum: {
      type: Number,
      default: 3,
    },
    gridlist: {
      type: Array,
      default: function () {
        return []
      },
    },
    isheadshow: {
      type: Boolean,
      default: true,
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
    headstyle: {
      type: String,
      default: '',
    },
    bodystyle: {
      type: String,
      default: '',
    }
  },
  data () {
    return {
      childnum: 0,
      height: '',
    }
  },
  components: { vueSeamlessScroll, gridtd },
  computed: {
    getcolumns () {
      let columnslist = []
      let cortorllist = this.$slots.default
      if (cortorllist !== undefined && cortorllist !== null) {
        let sumw = 0;
        cortorllist.forEach(ee => {
          if (ee.componentOptions !== undefined && ee.componentOptions.tag === "scrollgridcolumn") {
            sumw = sumw + ee.componentOptions.propsData.w
            columnslist.push(ee)
          }
        })

        return columnslist
      } else {
        return columnslist
      }
    },
    griddata () {
      if (this.gridlist === undefined || this.gridlist === null) {
        return []
      }
      return this.gridlist;
    },
    getoptionconfig () {
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
      return optionconfig;
    },
  },
  methods: {
    clickrow (row) {
      this.$emit('clickrow', row)
    },
  },
  created () {
    this.controlid =
      'div' + Date.parse(new Date()) + '_' + Math.ceil(Math.random() * 99999)


  }, mounted () {

  }
}
</script>
<style scoped>
.hide {
  display: none;
}
.seamless-warp {
  width: 100%;
  height: calc(100% - 30px);
  overflow: hidden;
}
.listhead {
  padding: 5px;
  height: 30px;
  background: rgb(0, 186, 255);
  background-size: cover;
  font-family: Source Han Sans CN;
  font-weight: 400;
  color: #ffff;
  font-size: 16px;
  line-height: 30px;
  border: 0px solid #81e8f182;
  display: flex;
  flex-wrap: wrap;
  display: -webkit-flex; /* Safari */
  font-weight: bold;
}

.listbody {
}
.listbody .tr {
  padding: 5px;
  width: 100%;
  float: left;
  height: 30px;
  background: hsla(199, 75%, 27%, 0.2);
  line-height: 30px;
  display: flex;
  flex-wrap: wrap;
  display: -webkit-flex; /* Safari */
}
.listbody .doublerow {
  background: rgb(0, 59, 81);
}
.listbody .singlerow {
  background: rgb(10, 39, 50);
}
/* .listbody .tr:hover {
  background: rgba(226, 139, 30, 0.27);
  border: 1px solid rgba(226, 139, 30, 0.42);
  box-shadow: 0px 0px 6px 0px rgba(226, 139, 30, 0.7);
  border-radius: 4px;
} */
.listbody .td {
  float: left;
  box-sizing: border-box;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  text-align: left;
  line-height: 30px;
  color: #ffff;
  font-size: 14px;
  flex: 1;
}
.listhead .th {
  box-sizing: border-box;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  /* border-right: 1px solid #dfdfdf; */
  text-align: left;
  flex: 1;
}
.hiddenColumns {
  display: none;
}
</style>
