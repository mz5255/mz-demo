<template>
  <div :style="getcss">
    <div :style="cssstyle">{{ val }}</div>
  </div>
</template>
<script>
export default {
  props: ['w', 'h', 'val', 'cssstyle'],
  computed: {
    getcss() {
      return 'overflow:hidden;width:' + this.w + 'px;height:' + this.h + 'px;    font-size: 24px;'
    }
  }
}
</script>
