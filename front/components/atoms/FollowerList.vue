<template>
  <div class="px-4 py-3">
    <h4>フォロワー</h4>
    {{ follower.length }}
  </div>
</template>

<script>
export default {
  props: {
    follower: {
      type: [Object, Array],
      default: () => {}
    }
  }
}
</script>
