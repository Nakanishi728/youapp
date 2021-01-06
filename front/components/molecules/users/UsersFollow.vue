<template>
  <div>
    <FollowButton
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
    follower: {
      type: [Object, Array],
      default: () => {}
    }
  }
}
</script>
