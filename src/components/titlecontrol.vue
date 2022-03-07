<template>
  <div :style="getcss"> <span class="text" :style="cssstyle">{{val}}</span></div>
</template>
<script>
export default {
  props: ['w', 'h', 'val', 'cssstyle'],
  computed: {
    getcss () {
      return 'overflow:hidden;width:' + this.w + 'px;height:' + this.h + 'px;    font-size: 24px;'
    }
  }
}
</script>
<style scoped>
.text {
  white-space: nowrap;
}
</style>
