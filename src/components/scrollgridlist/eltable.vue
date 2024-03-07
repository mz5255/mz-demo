<template>
  <div :style="getseamlesscss" class="eltable">
    <el-table :data="tabledata" style="width: 100%;" :style="gettablecss" :show-header="isheadshow">
      <el-table-column :prop="item.prop" :label="item.label" :width="item.width" v-for="(item, index) in elcolumn"
        :key="index">
        <template slot-scope="scope">
          <slot :name="item.prop" :row="scope.row" v-if="item.isslot"></slot>
          <span v-else>{{ scope.row[item.prop] }}</span>
        </template>
      </el-table-column>
    </el-table>
  </div>
</template>
<script>
export default {
  props: {
    h: {
      type: Number,
      default: 300,
    },
    w: {
      type: Number,
      default: 500,
    },
    isheadshow: {
      type: Boolean,
      default: true,
    },
    tableheadcolor: {
      type: String,
      default: "rgb(1 41 109)",
    },
    tablerowhovercolor: {
      type: String,
      default: "rgb(18 86 157 / 90%)",
    },
    tablerowcolor: {
      type: String,
      default: "rgb(0 25 82)",
    },
    tablerowdoublecolor: {
      type: String,
      default: "rgb(2 51 125)",
    },
    tablebordercolor: {
      type: String,
      default: "#42669a",
    },
    tableheadfontcolor: {
      type: String,
      default: "#fff",
    },
    tablehoverfontcolor: {
      type: String,
      default: "#fff",
    },
    tablerowfontcolor: {
      type: String,
      default: "#fff",
    },
    elcolumn: {
      type: Array,
      default() {
        return [
          { prop: "date", label: "日期", width: "180" },
          { prop: "name", label: "姓名", width: "180" },
          { prop: "address", label: "地址", width: undefined },
        ];
      },
    },
    tabledata: {
      type: Array,
      default() {
        return [
          {
            date: "2016-05-02",
            name: "王小虎",
            address: "上海市普陀区金沙江路 1518 弄",
          },
          {
            date: "2016-05-04",
            name: "王小虎",
            address: "上海市普陀区金沙江路 1517 弄",
          },
          {
            date: "2016-05-01",
            name: "王小虎",
            address: "上海市普陀区金沙江路 1519 弄",
          },
          {
            date: "2016-05-03",
            name: "王小虎",
            address: "上海市普陀区金沙江路 1516 弄",
          },
        ];
      },
    },
  },
  data() {
    return {

    };
  },
  computed: {
    gettablecss() {
      return `--tableheadcolor:${this.tableheadcolor};--tablerowhovercolor:${this.tablerowhovercolor};--tablerowcolor:${this.tablerowcolor};--tablerowdoublecolor:${this.tablerowdoublecolor};--tablebordercolor:${this.tablebordercolor};--tableheadfontcolor:${this.tableheadfontcolor};--tablehoverfontcolor:${this.tablehoverfontcolor};--tablerowfontcolor:${this.tablerowfontcolor};`;
    },
    getseamlesscss() {
      return `height:${this.h - 15}px ;width:${this.w}px ;`;
    },
  },
  created() {
    this.$nextTick(() => {
      this.initElColumn();
    })
  },
  methods: {
    initElColumn() {
      let elw = this.$el.offsetWidth
      let totalw = 0;
      this.elcolumn.forEach(ee => {
        totalw += ee.width;
      })
      if (totalw < elw) {
        this.elcolumn.forEach(ee => {
          ee.width = ee.width / totalw * elw;
        })
      }
    }
  },
  watch: {
    elcolumn: {
      //监听的对象
      deep: true, //深度监听设置为 true
      handler: function () {
        this.initElColumn()
      }
    }
  }
}
</script>
<style scoped>
.seamless-warp {
  float: left;
  overflow: hidden;
  width: 100%;
}

.headtable>>>.el-table__empty-block {
  display: none;
}

.seamless-warp>>>.el-table__body {
  width: 100% !important;
}

.eltable>>>.el-table th.is-leaf {
  background: var(--tableheadcolor) !important;
  border-bottom: 1px solid var(--tablebordercolor);
  color: var(--tableheadfontcolor);
}

.eltable>>>.el-table__body tr:hover>td {
  background-color: var(--tablerowhovercolor) !important;
  border-bottom: 1px solid var(--tablebordercolor);
  color: var(--tablehoverfontcolor);
}

.eltable>>>.el-table__body tr {
  background: var(--tablerowcolor) !important;
  border-bottom: 1px solid var(--tablebordercolor);
  color: var(--tablerowfontcolor);
}

.eltable>>>.el-table__body tr>td {
  border-bottom: 0px;
}

.eltable>>>.el-table__body tr:nth-child(2n) {
  background: var(--tablerowdoublecolor) !important;
  border-bottom: 1px solid var(--tablebordercolor);
  color: var(--tablerowfontcolor);
}

.eltable>>>.el-table__empty-text {
  color: var(--tablerowfontcolor);
}

.eltable>>>.el-table__empty-block {
  background-color: var(--tablerowcolor) !important;
}

.eltable>>>.el-table--border::after,
.eltable>>>.el-table--group::after,
.eltable>>>.el-table::before {
  background-color: transparent;
}

.eltable>>>.el-table td.el-table__cell,
.eltable>>>.el-table th.el-table__cell.is-leaf {
  border-bottom: 0px solid var(--tablebordercolor);
}

.eltable>>>.el-table,
.eltable>>>.el-table__expanded-cell {
  background: var(--tableheadcolor) !important;
}
</style>
