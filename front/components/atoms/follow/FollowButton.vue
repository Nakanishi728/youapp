<template>
  <div class="follow-container">
    <div class="follow-change-box">
      <v-btn
        v-if="currentUser && currentUser.id === user.id"
        class="white--text"
        color="green lighten-1"
        style="width:100%;"
        to="/users/profile"
      >
        プロフィール編集
      </v-btn>
      <v-btn
        color="light-blue lighten-1"
        style="width:100%;"
        outlined
        @click="unfollow"
      >
        フォロー解除
      </v-btn>
      <v-btn
        class="white--text"
        color="blue lighten-1"
        style="width:100%;"
        @click="follow"
      >
        フォロー
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
          this.$store.commit('setFollow', true)
          this.$store.commit('setFlash', {
            status: true,
            message: 'フォローしました'
          })
          setTimeout(() => {
            this.$store.commit('setFlash', {})
          }, 2000)
          this.reload()
        })
    },
    unfollow () {
      const params = {
        follower_id: this.currentUser.id,
        following_id: this.$route.params.id
      }
      axios
        .delete('/v1/relationships', { params })
        .then((res) => {
          this.$store.commit('setFollow', false)
          this.$store.commit('setFlash', {
            status: true,
            message: 'フォロー解除しました'
          })
          setTimeout(() => {
            this.$store.commit('setFlash', {})
          }, 2000)
          this.reload()
        })
    },
    reload () {
      this.$router.go({ path: this.$router.currentRoute.path, force: true })
    }
  }
}
</script>
