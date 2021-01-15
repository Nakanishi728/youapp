<template>
  <v-container>
    <div>
      <v-row>
        <v-col>
          <Tabs />
        </v-col>
      </v-row>
      <v-row>
        <v-col>
          <v-card
            elevation="0"
            class="mx-auto my-4"
          >
            <v-card-title>
              USERストック一覧<span v-not-visible="'tablet'" @:click="show('tablet')">(他のユーザーがどんなURLに興味を持っているのか見てみよう)</span>
            </v-card-title>
          </v-card>
          <StockLatest
            v-for="like in likes"
            :key="like.id"
            :like="like"
            :post="like.post"
          />
        </v-col>
      </v-row>
      <v-row justify="center">
        <v-btn
          color="white lighten-2"
          class="mt-4 blue--text more-loading"
          style="width:60%;"
          @click="moreLoading"
        >
          STOCKをもっと見る
        </v-btn>
      </v-row>
      <v-row>
        <v-col>
          <ScrollTop />
        </v-col>
      </v-row>
    </div>
  </v-container>
</template>

<script>
import axios from '@/plugins/axios'

export default {
  fetch ({ store, redirect }) {
    store.watch(
      state => state.currentUser,
      (newUser, oldUser) => {
        if (!newUser) {
          return redirect('/login')
        }
      }
    )
  },
  data () {
    return {
      likes: {},
      likeCount: 0,
      morePost: true
    }
  },
  mounted () {
    axios
      .get('/v1/likes/latest/all')
      .then((res) => {
        this.likes = res.data
        this.likeCount = this.likes.length
      })
      .catch((error) => {
        if (error.response.status === 404) {
          this.notFound = true
        }
      })
  },
  methods: {
    moreLoading () {
      const params = {
        offset: this.likeCount
      }
      axios
        .get('/v1/likes/latest/all', { params })
        .then((res) => {
          const addPosts = res.data
          this.likes = this.likes.concat(addPosts)
          this.likeCount = this.likes.length
          if (addPosts.length < 20) {
            this.morePost = false
          }
        })
    },
    show (str) {
      alert(str)
    }
  }
}
</script>
