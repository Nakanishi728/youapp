<template>
  <v-list two-line>
    <template v-for="(post, index) in posts">
      <v-list-item :key="post.id">
        <v-list-item-content>
          <v-list-item-title class="py-2">
            <nuxt-link
              :to="`/posts/${post.id}`"
              style="color:#263238; text-decoration:none;"
            >
              {{ post.title }}
            </nuxt-link>
          </v-list-item-title>
          <div class="post-like-box">
            <div class="post-like-item-box">
              {{ post.user.name }}{{ postmessage }}
            </div>
          </div>
        </v-list-item-content>
      </v-list-item>
      <v-divider
        v-if="index < posts.length - 1"
        :key="index"
      />
    </template>
  </v-list>
</template>

<script>
export default {
  props: {
    posts: {
      type: [Object, Array],
      required: true
    }
  },
  data () {
    return {
      postmessage: 'が投稿済み'
    }
  }
}
</script>

<style typw="scoped">
.post-like-box {
  display: flex;
  justify-content: flex-end;
}

.post-like-box {
  font-size: 12px;
}
</style>
