<template>
  <div class="follow-container">
    <div class="follow-change-box">
      <v-btn
        color="light-blue lighten-1"
        style="width:100%;"
        outlined
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
          this.$store.commit('setLoading', false)
          this.$store.commit('setFlash', {
            status: true,
            message: 'フォローしました'
          })
          setTimeout(() => {
            this.$store.commit('setFlash', {})
          }, 2000)
          this.$router.replace('/')
        })
    }
  }
}
</script>
