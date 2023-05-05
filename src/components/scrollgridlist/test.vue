<template>
  <scrollgridlist :gridlist="gridlist" :step="2" :singleHeight="35">
    <scrollgridcolumn :prop="'aa'" lable="字段1"></scrollgridcolumn>
    <scrollgridcolumn :prop="'bb'" lable="字段2">
      <template slot-scope="scope">
        <el-button type="primary">{{scope.row["bb"]}}</el-button>
      </template>
    </scrollgridcolumn>
  </scrollgridlist>
</template>
<script>
import scrollgridlist from './index.vue'
import scrollgridcolumn from './scrollgridcolumn.vue'
export default {
  components: { scrollgridlist, scrollgridcolumn },
  data () {
    return {
      gridlist: [{ aa: "1", bb: '543' }, { aa: "2", bb: 'fsdfds' }, { aa: "3", bb: '哈哈s' }, { aa: "3", bb: '哈哈s' }]
    }
  }
}
</script>
