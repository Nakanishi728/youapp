<template>
  <div class="px-4 py-3">
    <h4>フォロー</h4>
    {{ follow.length }}
  </div>
</template>

<script>
export default {
  props: {
    follow: {
      type: [Object, Array],
      default: () => {}
    }
  }
}
</script>
