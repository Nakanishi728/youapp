<template>
  <div>
    <transition name="fade">
      <v-btn
        v-show="fab"
        v-scroll="onScroll"
        fab
        dark
        fixed
        bottom
        right
        color="primary"
        @click="toTop"
      >
        <v-icon>mdi-chevron-up</v-icon>
      </v-btn>
    </transition>
  </div>
</template>

<script>
export default {
  data () {
    return {
      fab: false
    }
  },
  methods: {
    onScroll (e) {
      if (typeof window === 'undefined') { return }
      const top = window.pageYOffset || e.target.scrollTop || 0
      this.fab = top > 500
    },
    toTop () {
      this.$vuetify.goTo(0)
    }
  }
}
</script>

<style type="scoped">
.fade-enter-active, .fade-leave-active {
  transition: 0.5s
}

.fade-enter, .fade-leave-to {
  opacity: 0;
  transform: scale(0)
}
</style>
