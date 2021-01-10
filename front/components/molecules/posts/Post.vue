<template>
  <v-card
    hover
    elevation="0"
    class="mx-auto mt-3"
    width="350"
  >
    <v-card-text>
      <UsersLink
        :user="user"
      />
    </v-card-text>
    <v-carousel
      :continuous="false"
      :cycle="cycle"
      :show-arrows="false"
      color="black"
      delimiter-icon="mdi-minus"
      height="150"
    >
      <PostLinkCard
        v-for="link in post.links"
        :key="link.id"
        :link="link"
      />
    </v-carousel>
      <v-list two-line>
        <v-list-item>
          <v-list-item-content>
            <v-list-item-title>
              <nuxt-link
                :to="`/posts/${post.id}`"
                style="color:#263238; text-decoration:none;"
              >
                {{ post.title }}
              </nuxt-link>
            </v-list-item-title>
          </v-list-item-content>
          <v-list-item-action>
            <LikeButton
              v-if="currentUser"
              :user="post.user"
              :post="post"
            />
          </v-list-item-action>
        </v-list-item>
      </v-list>
  </v-card>
</template>

<script>
export default {
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
  data () {
    return {
      colors: [
        'green',
        'secondary',
        'yellow darken-4',
        'red lighten-2',
        'orange darken-1'
      ],
      cycle: false,
      slides: [
        'First',
        'Second',
        'Third',
        'Fourth',
        'Fifth'
      ]
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
