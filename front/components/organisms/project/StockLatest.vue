<template>
  <div>
    <v-list two-line>
      <v-list-item>
        <v-list-item-title>
          <UsersAvatar
            :size="36"
            :user="like.user"
          />
          <nuxt-link
            v-not-visible="'mobile'"
            :to="`/users/${like.user.id}`"
            style="color:#37474F;"
          >
            {{ like.user.name }}
          </nuxt-link>
          <v-divider
            class="mx-3"
            vertical
          />
          <nuxt-link
            :to="`/posts/${post.id}`"
            style="color:#37474F;"
          >
            {{ post.title }}
          </nuxt-link>
        </v-list-item-title>
        <v-list-item-action>
          <v-icon small>
            mdi-open-in-new
          </v-icon>
        </v-list-item-action>
      </v-list-item>
      <v-divider />
    </v-list>
  </div>
</template>

<script>
export default {
  props: {
    post: {
      type: Object,
      required: true
    },
    like: {
      type: Object,
      required: true
    }
  }
}
</script>
