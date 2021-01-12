<template>
  <div>
    <FollowDeleteButton
      :user="user"
      :follower="follower"
    />
  </div>
</template>

<script>
export default {
  props: {
    user: {
      type: Object,
      required: true
    },
    follow: {
      type: [Object, Array],
      default: () => {}
    },
    follower: {
      type: [Object, Array],
      default: () => {}
    }
  }
}
</script>
