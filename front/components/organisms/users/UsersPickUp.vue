<template>
  <v-card class="mx-auto mt-4">
    <PostPickUpDialog
      :posts="posts"
      :dialog="dialog"
      @closeDialog="dialog = false"
    />
    <v-card-title>
      <v-icon
        color="blue lighten-1"
      >
        mdi-check-bold
      </v-icon>
      <h4>
        ユーザーイチオシのURL
      </h4>
    </v-card-title>
    <v-list-item>
      <v-list-item-content>
        <template v-for="(pickup, index) in pickups">
          <v-list-item :key="pickup.id">
            <v-list-item-content>
              <v-list-item-title class="py-2">
                <nuxt-link
                  :to="`/posts/${pickup.post.id}`"
                  style="color:#263238; text-decoration:none;"
                >
                  {{ pickup.post.title }}
                </nuxt-link>
                <v-driver />
              </v-list-item-title>
              <div class="pickup-container">
                <div class="pickup-show-item-box">
                  {{ pickup.post.id }}
                </div>
              </div>
            </v-list-item-content>
          </v-list-item>
          <v-divider
            v-if="index < pickups.length - 1"
            :key="index"
          />
        </template>
        <v-card-text>
          <div v-if="currentUser && currentUser.id === user.id" class="pickup-container">
            <div class="post-pickup-change-box">
              <v-btn
                fab
                small
                color="blue lighten-3"
                @click="dialog = !dialog"
              >
                <v-icon>mdi-xml</v-icon>
              </v-btn>
            </div>
          </div>
        </v-card-text>
      </v-list-item-content>
    </v-list-item>
  </v-card>
</template>

<script>
import axios from '@/plugins/axios'

export default {
  props: {
    user: {
      type: Object,
      required: true
    },
    posts: {
      type: [Object, Array],
      required: true
    }
  },
  data () {
    return {
      dialog: false,
      pickups: []
    }
  },
  computed: {
    currentUser () {
      return this.$store.state.currentUser
    }
  },
  mounted () {
    axios
      .get(`/v1/pickups/${this.$route.params.id}`)
      .then((res) => {
        const pickups = res.data
        this.pickups = pickups
      })
  },
  methods: {
    openDialog () {
      this.dialog = true
    }
  }
}
</script>

<style type="scoped">
.pickup-container {
  display: flex;
  justify-content: flex-end;
}

.post-index-point {
  white-space: pre-line;
}
</style>
