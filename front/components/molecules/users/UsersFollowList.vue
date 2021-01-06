<template>
  <div class="follow-list">
    <FollowListDialog
      :follow="follow"
      :dialog="dialog"
      @closeDialog="dialog = false"
    />
    <FollowerListDialog
      :follower="follower"
      :followerdialog="followerdialog"
      @followercloseDialog="followerdialog = false"
    />
    <div class="px-4 py-3">
      <h4
        style="cursor:pointer"
        @click="dialog = !dialog"
      >
        フォロー
      </h4>
      <v-row justify="center">
        {{ follow.length }}
      </v-row>
    </div>
    <div class="px-4 py-3">
      <h4
        style="cursor:pointer"
        @click="followerdialog = !followerdialog"
      >
        フォロワー
      </h4>
      <v-row justify="center">
        {{ follower.length }}
      </v-row>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    follow: {
      type: [Object, Array],
      default: () => {}
    },
    follower: {
      type: [Object, Array],
      default: () => {}
    }
  },
  data () {
    return {
      dialog: false,
      followerdialog: false
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
