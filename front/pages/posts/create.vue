<template>
  <v-card class="mx-auto mt-5 pa-5" width="600px">
    <v-card-title>
      <h2 class="create-post-h2">
        投稿(シェア)
      </h2>
    </v-card-title>
    <v-form>
      <ValidationObserver ref="obs">
        <div class="create-post-box">
          <TextField
            v-model="title"
            label="必須)Rails,Docker (短的に)"
            rules="max:30|required"
          />
          <AddLink
            rules="regex:https?://([\w-]+\.)+[\w-]+(/[\w- .?%&=]*)?"
            label="URL"
            :first-url.sync="firstUrl"
            :second-url.sync="secondUrl"
            :third-url.sync="thirdUrl"
          />
          <TextArea
            v-model="point"
            label="必須) 自身の体験を踏まえて"
            rules="max:140|required"
            :counter="140"
          />
          <v-row justify="center">
            <p v-if="error" class="errors">
              {{ error }}
            </p>
          </v-row>
          <v-row justify="center">
            <v-btn
              color="white lighten-3"
              class="black--text"
              @click="createPost"
            >
              シェア
            </v-btn>
          </v-row>
        </div>
      </ValidationObserver>
    </v-form>
  </v-card>
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
      title: '',
      point: '',
      firstUrl: '',
      secondUrl: '',
      thirdUrl: '',
      error: ''
    }
  },
  computed: {
    currentUser () {
      return this.$store.state.currentUser
    },
    links () {
      const links = [this.firstUrl, this.secondUrl, this.thirdUrl]
      return links
    }
  },
  methods: {
    createPost () {
      this.$store.commit('setLoading', true)
      axios
        .post('/v1/posts', {
          title: this.title,
          user_id: this.currentUser.id,
          links: this.links,
          point: this.point
        })
        .then((res) => {
          this.$store.commit('setLoading', false)
          this.$store.commit('setFlash', {
            status: true,
            message: '投稿が完了しました'
          })
          setTimeout(() => {
            this.$store.commit('setFlash', {})
          }, 2000)
          this.$router.replace(`/posts/${res.data.id}`)
        })
        .catch((error) => {
          this.error = ((code) => {
            switch (code) {
              default:
                return '投稿内容を確認してください'
            }
          })(error.code)
          this.$store.commit('setLoading', false)
        })
    }
  }
}
</script>

<style>
.create-post-h2 {
  font-size: 24px;
}
</style>
