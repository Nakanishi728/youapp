<template>
  <div>
    <div
      v-for="(foll, l) in follower"
      :key="l"
    >
      <v-btn
        v-if="currentUser && currentUser.name === foll.name"
        class="white--text"
        style="width:100%;background-color:blue;"
        outlined
        @click="unfollow"
      >
        フォロー解除
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
      required: true
    },
    follower: {
      type: [Object, Array],
      default: () => {}
    }
  },
  computed: {
    currentUser () {
      return this.$store.state.currentUser
    }
  },
  methods: {
    unfollow () {
      const params = {
        follower_id: this.currentUser.id,
        following_id: this.$route.params.id
      }
      axios
        .delete('/v1/relationships', { params })
        .then((res) => {
          this.$store.commit('setFlash', {
            status: true,
            message: 'フォロー解除しました'
          })
          setTimeout(() => {
            this.$store.commit('setFlash', {})
          }, 2000)
          this.$router.replace(`/users/${this.$store.state.currentUser.id}`)
        })
    }
  }
}
</script>
