<template>
  <v-card v-show="currentUser && currentUser.id === like.user.id" class="mx-auto mt-4 pa-3" width="600px">
    <v-card-title class="py-2">
      <nuxt-link
        :to="`/posts/${like.post.id}`"
        style="color:#263238; text-decoration:none;"
      >
        {{ like.post.title }}
      </nuxt-link>
    </v-card-title>
    <v-divider />
    <v-card-text>
      <div class="post-index-point mt-2">
        {{ like.post.point }}
      </div>
      <div class="post-container">
        <div class="post-show-change-box">
          <v-btn
            outlined
            fab
            small
            color="black lighten-3"
            @click="deleteLike"
          >
            <v-icon>mdi-minus</v-icon>
          </v-btn>
        </div>
      </div>
    </v-card-text>
  </v-card>
</template>

<script>
import axios from '@/plugins/axios'

export default {
  props: {
    like: {
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
    deleteLike () {
      axios
        .delete(`/v1/likes/${this.like.id}`, { id: this.like.id })
        .then((res) => {
          this.$store.commit('setLoading', false)
          this.$store.commit('setFlash', {
            status: true,
            message: 'ストックから削除しました'
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

<style type="scoped">
.post-index-point {
  white-space: pre-line;
}

.post-container {
  display: flex;
  justify-content: flex-end;
}
</style>
