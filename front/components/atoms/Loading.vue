<template>
  <div class="loading">
    <div class="animation">
      Loading...
    </div>
  </div>
</template>

<script>
import 'loaders.css'

export default {
}
</script>

<style  lang="scss" scoped>
.loading{
  position: fixed;
  width: 100vw;
  height: 100vh;
  top: 0px;
  left: 0px;
  background: #000;
  z-index: 9999;
}
.animation{
  position: absolute;
  top: 50%;
  left: 50%;
  -webkit-transform: translate(-50%, -50%);
  -ms-transform: translate(-50%, -50%);
  transform: translate(-50%, -50%);
  color: #fff;
  -webkit-animation: lodanimetion 1500ms ease-out forwards infinite;
  animation: lodanimetion 1500ms ease-out forwards infinite;
}
@keyframes lodanimetion {
  from,to {
    opacity: 0;
  }
  50% {
    opacity: .5;
  }
}
</style>
