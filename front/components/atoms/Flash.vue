<template>
  <transition name="fade">
    <div v-if="flash.status" class="flash">
      {{ flash.message }}
    </div>
  </transition>
</template>

<script>
export default {
  computed: {
    flash () {
      return this.$store.state.flash
    }
  }
}
</script>

<style scoped>
.flash {
  position: fixed;
  z-index: 50;
  text-align: center;
  line-height: 60px;
  width: 100%;
  background-color: #d7f0e4;
  color: rgb(26, 22, 22);
}
.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.3s;
}
.fade-enter, .fade-leave-to {
  opacity: 0;
}
</style>
