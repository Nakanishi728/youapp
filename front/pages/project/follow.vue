<template>
  <div class="mybox">
    <div>
      {{ scrollX }}
    </div>
    <div class="mybox-inner">
      <div class="mybox-content" ref="scrollBox" @scroll.passive="updatePosition">
        <div class="lorem">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Incidunt possimus, repudiandae molestiae minus itaque, culpa rem error modi dolorum accusamus, ex eius? Incidunt quisquam iusto fugiat, quaerat recu</div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data () {
    return {
      scrollX: 0
    }
  },
  mounted () {
    this.updatePosition()
  },
  methods: {
    updatePosition () {
      this.scrollX = this.$refs.scrollBox.scrollLeft
    }
  }
}
</script>

<style scoped>
.mybox-inner {
  position: relative;
  max-width: 300px;
  border: 1px solid black;
}

.mybox-content {
  overflow-x: auto;
}
.paddle {
  position: absolute;
  top: 0;
  bottom: 0;
  width: 3em;
}
.left-paddle {
  left: 0;
}
.right-paddle {
  right: 0;
}

.hidden {
  display: none;
}

.lorem {
  height: 120px;
  white-space: nowrap;
}
</style>
