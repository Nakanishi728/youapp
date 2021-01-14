<template>
  <v-card class="user-info-box">
    <v-card-text>
      <FollowButton
        v-show="currentUser && currentUser.id !== user.id"
        :user="user"
        :follower="follower"
      />
      <v-row justify="center">
        <UsersAvatar
          :size="62"
          :user="user"
        />
      </v-row>
      <v-row justify="center">
        <p class="user-info-box-name">
          {{ user.name }}
        </p>
      </v-row>
      <v-row>
        <div class="user-info-box-profile">
          {{ user.profile }}
        </div>
      </v-row>
      <v-row justify="center">
        <div class="user-follow-box">
          <UsersFollowList
            :follow="follow"
            :follower="follower"
          />
          <v-btn
            v-if="currentUser && currentUser.id === user.id"
            class="white--text"
            color="green lighten-1"
            style="width:100%;"
            to="/users/profile"
          >
            プロフィール編集
          </v-btn>
          <UsersFollow
            :user="user"
            :follower="follower"
          />
        </div>
      </v-row>
    </v-card-text>
  </v-card>
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
  },
  computed: {
    currentUser () {
      return this.$store.state.currentUser
    }
  }
}
</script>

<style type="scoped">
.user-info-box-name {
  padding-top: 12px;
  font-size: 18px;
  font-weight: bold;
}

.user-info-box-profile {
  width: 70%;
  margin: 0 auto;
}
</style>
