<template>
  <div class="follow-container">
    <div class="follow-change-box">
      <v-btn
        outlined
        fab
        small
        elevation="0"
        class="white--text"
        color="blue lighten-1"
        @click="follow"
      >
        <v-icon>mdi-account-plus</v-icon>
      </v-btn>
    </div>
  </div>
</template>

<script>
import axios from '@/plugins/axios'

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
  },
  computed: {
    currentUser () {
      return this.$store.state.currentUser
    }
  },
  methods: {
    follow () {
      axios
        .post('/v1/relationships', {
          follower_id: this.currentUser.id,
          following_id: this.$route.params.id
        })
        .then((res) => {
          this.$store.commit('setFlash', {
            status: true,
            message: 'フォローしました'
          })
          setTimeout(() => {
            this.$store.commit('setFlash', {})
          }, 3)
          this.reload()
        })
    },
    reload () {
      this.$router.go({ path: this.$router.currentRoute.path, force: true })
    }
  }
}
</script>

<style type="scoped">
.follow-container {
  display: flex;
  justify-content: flex-end;
}
</style>
