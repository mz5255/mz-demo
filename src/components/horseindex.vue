<template>
  <div :style="getcss">
    <div class="horsepalne"> <span :style="cssstyle">{{val}}</span>
    </div>
  </div>
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
.horsepalne {
  -webkit-animation: marquee 5s linear infinite;
  animation: marquee 5s linear infinite;
}
@keyframes marquee {
  0% {
    transform: translateX(50%);
  }
  100% {
    transform: translateX(-50%);
  }
}
.text {
  white-space: nowrap;
}
</style>
