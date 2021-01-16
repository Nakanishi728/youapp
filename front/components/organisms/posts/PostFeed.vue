<template>
  <div>
    <v-row justify="center">
      <Post
        v-for="(post, $index) in posts"
        :key="$index"
        :user="post.user"
        :post="post"
      />
    </v-row>
    <v-row justify="center">
      <v-btn
        color="white lighten-2"
        class="mt-4 blue--text more-loading"
        style="width:60%;"
        @click="moreLoading"
      >
        URLをもっと見る
      </v-btn>
    </v-row>
  </div>
</template>

<script>
import axios from '@/plugins/axios'

export default {
  data () {
    return {
      postCount: 0,
      posts: [],
      morePost: true
    }
  },
  mounted () {
    axios
      .get('/v1/posts')
      .then((res) => {
        this.posts = res.data
        this.postCount = this.posts.length
      })
  },
  methods: {
    moreLoading () {
      const params = {
        offset: this.postCount
      }
      axios
        .get('/v1/posts', { params })
        .then((res) => {
          const addPosts = res.data
          this.posts = this.posts.concat(addPosts)
          this.postCount = this.posts.length
          if (addPosts.length < 20) {
            this.morePost = false
          }
        })
    }
  }
}
</script>

<style type="scoped">
.more-loading {
  max-width: 400px;
}
</style>
