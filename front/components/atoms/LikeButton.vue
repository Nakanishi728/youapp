<template>
  <div class="post-container">
    <div class="post-show-change-box">
      <v-btn
        fab
        small
        color="green lighten-3"
        @click="registerLike"
      >
        <v-icon>mdi-plus</v-icon>
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
      default: () => {}
    },
    post: {
      type: Object,
      default: () => {}
    }
  },
  data () {
    return {
      likeList: []
    }
  },
  computed: {
    currentUser () {
      return this.$store.state.currentUser
    }
  },
  methods: {
    registerLike () {
      axios
        .post('/v1/likes', {
          user_id: this.currentUser.id,
          post_id: this.post.id
        })
        .then((res) => {
          this.$store.commit('setLoading', false)
          this.$store.commit('setFlash', {
            status: true,
            message: 'ストックに追加しました'
          })
          setTimeout(() => {
            this.$store.commit('setFlash', {})
          }, 2000)
          this.$router.replace('/project/stock')
        })
    }
  }
}
</script>

<style type="scoped">
.post-container {
  display: flex;
  justify-content: flex-end;
}
</style>
