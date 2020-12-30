<template>
  <v-card class="mx-auto mt-4 pa-3" width="600px">
    <v-card-title class="py-2">
      <n-link
        :to="`/posts/${post.id}`"
        style="color:#263238; text-decoration:none;"
      >
        {{ post.title }}
      </n-link>
    </v-card-title>
    <v-divider />
    <v-card-text>
      <UsersLink
        :user="user"
      />
      <PostLinkCard
        v-for="link in post.links"
        :key="link.id"
        :link="link"
      />
      <div class="post-index-point mt-2">
        {{ post.point }}
      </div>
      <LikeButton
        v-if="currentUser"
        :user="post.user"
        :post="post"
      />
    </v-card-text>
  </v-card>
</template>

<script>
import UsersLink from '~/components/molecules/UsersLink.vue'
import PostLinkCard from '~/components/molecules/PostLinkCard.vue'
import LikeButton from '~/components/atoms/LikeButton.vue'

export default {
  components: {
    UsersLink,
    PostLinkCard,
    LikeButton
  },
  props: {
    post: {
      type: Object,
      required: true
    },
    user: {
      type: Object,
      required: true
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
.post-index-point {
  white-space: pre-line;
}
</style>
