<template>
  <img :src="url" :width="w" :height="h" :style="getcss" />
</template>
<script>
export default {
  props: ['w', 'h', 'rotatetype', 'url', 'rotatetime'],
  computed: {
    getcss () {
      if (this.rotatetype === "1") {
        return `animation:imgturn ${this.rotatetime}s linear infinite;`;
      } else if (this.rotatetype === "2") {
        return `animation:imgturn2 ${this.rotatetime}s linear infinite;`;
      }
      return ''
    }
  }
}
</script>
<style >
@keyframes imgturn {
  0% {
    -webkit-transform: rotate(0deg);
  }
  25% {
    -webkit-transform: rotate(90deg);
  }
  50% {
    -webkit-transform: rotate(180deg);
  }
  75% {
    -webkit-transform: rotate(270deg);
  }
  100% {
    -webkit-transform: rotate(360deg);
  }
}
@keyframes imgturn2 {
  100% {
    -webkit-transform: rotate(0deg);
  }
  75% {
    -webkit-transform: rotate(90deg);
  }
  50% {
    -webkit-transform: rotate(180deg);
  }
  25% {
    -webkit-transform: rotate(270deg);
  }
  0% {
    -webkit-transform: rotate(360deg);
  }
}
</style>
