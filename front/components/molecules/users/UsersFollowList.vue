<template>
  <div class="follow-list">
    <FollowList
      :follow="follow"
    />
    <FollowerList
      :follower="follower"
    />
  </div>
</template>

<script>
import FollowList from '~/components/atoms/FollowList.vue'
import FollowerList from '~/components/atoms/FollowerList.vue'

export default {
  components: {
    FollowList,
    FollowerList
  },
  props: {
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

<style type="scoped">
.follow-list {
  display: flex;
  justify-content: space-around;
}
</style>
