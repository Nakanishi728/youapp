<template>
  <v-card class="user-info-box">
    <v-card-text>
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
