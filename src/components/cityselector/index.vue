<template>
  <div class="cityselector">
    <el-cascader
      :options="options"
      v-model="cityvalue"
      :disabled="disabled"
      :props="{ checkStrictly: true }"
      :show-all-levels="false"
      clearable
    >
      <template slot-scope="{ node, data }">
        <span>{{ data.label }}</span>
        <span v-if="!node.isLeaf"> ({{ data.children.length }}) </span>
      </template>
    </el-cascader>
  </div>
</template>
<script>
import { cityjson } from "./districts";
export default {
  name: "cityselector",
  props: ["value", "disabled"],
  data() {
    return {
      options: cityjson,
      cityvalue: this.value,
    };
  },
  watch: {
    cityvalue(val) {
      this.$emit("update:value", val);
      this.$emit("input", val);
    },
    value(val) {
      this.cityvalue = val;
    },
  },
};
</script>
<style scoped>
.cityselector >>> .el-cascader {
  width: 100% !important;
}
</style>
