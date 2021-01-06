<template>
  <v-card>
    <v-list two-line>
      <v-list-item-group
        v-model="selected"
        active-class="blue--text"
        multiple
      >
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
                  {{ like }}
                </div>
              </div>
            </v-list-item-content>
          </v-list-item>
          <v-divider
            v-if="index < posts.length - 1"
            :key="index"
          />
        </template>
      </v-list-item-group>
    </v-list>
  </v-card>
</template>

<script>
export default {
  props: {
    posts: {
      type: Object,
      required: true
    }
  },
  data () {
    return {
      like: 'お気に入り'
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
