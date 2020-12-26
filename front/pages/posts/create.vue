<template>
  <v-card class="mx-auto mt-5 pa-5" width="600px">
    <LoggedInNavDrawer />
    <v-card-title>
      <h2 class="create-post-h2">
        投稿(シェア)
      </h2>
    </v-card-title>
    <v-form>
      <ValidationObserver ref="obs" v-slot="ObserverProps">
        <div class="create-post-box">
          <TextField
            v-model="title"
            label="例) Rails+Docker+Nuxt (短的に分かりやすく)"
            rules="max:80|required"
          />
          <AddLink
            rules="regex:https?://([\w-]+\.)+[\w-]+(/[\w- .?%&=]*)?"
            label="URL"
            :firstUrl.sync="firstUrl"
            :secondUrl.sync="secondUrl"
            :thirdUrl.sync="thirdUrl"
          />
          <TextArea
            v-model="point"
            label="例) ログイン機能実装の参考になりました (自身の体験を踏まえて)"
            rules="max:140|required"
            :counter="140"
          />
          <v-row justify="center">
            <v-btn
              color="white lighten-3"
              class="black--text"
              :disabled="ObserverProps.invalid || !ObserverProps.validated"
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
import LoggedInNavDrawer from '~/components/organisms/loggedIn/LoggedInNavDrawer.vue'
import AddLink from '~/components/molecules/AddLink.vue'
import TextField from '~/components/atoms/TextField.vue'
import TextArea from '~/components/atoms/TextArea.vue'

export default {
  components: {
    LoggedInNavDrawer,
    AddLink,
    TextField,
    TextArea
  },
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
      thirdUrl: ''
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
    }
  }
}
</script>

<style>
.create-post-h2 {
  font-size: 24px;
}
</style>
