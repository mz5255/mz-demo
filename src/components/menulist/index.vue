<template>
  <div class="menulist" @click="propertykeyshow = !propertykeyshow" :style="bgcolor">
    <i class="icon" :class="propertykeyshow ? 'el-icon-arrow-down' : 'el-icon-arrow-right'"></i>
    <div class="selectitem" v-if="propertykeyshow">
      <div v-for="item in datalist" :key="item" class="item" @click="change(item)"
        :style="item + ' width: 100%;height:35px'"></div>
    </div>
  </div>
</template>
<script>
export default {
  props: { value: [String, Number], datalist: Array },
  data() {
    return { propertykeyshow: false }
  },
  created() { },
  computed: {
    bgcolor: {
      get() {
        return this.value
      },
      set(v) {
        // this.$emit('change', v)
        this.$emit('input', v)
      },
    },
  },
  methods: {
    change(item) {
      this.bgcolor = item
      this.$emit('update:value', item)
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

.menulist .icon {
  float: right;
  padding-right: 8px;
  padding-top: 5px;
}

.selectitem {
  width: 200px;
  max-height: 250px;
  position: absolute;
  overflow-x: auto;
  z-index: 700;
  top: 28px;
  left: 0px;
}

.selectitem .item:hover {}
</style>
