<template>
  <v-dialog
    v-model="dialogStatus"
    max-width="700px"
    persistent
  >
    <v-card width="700px" class="mx-auto">
      <v-toolbar flat>
        <v-toolbar-title>
          イチオシに追加する(3つまで)
        </v-toolbar-title>
        <v-spacer />
        <v-btn
          icon
          @click="closeDialog"
        >
          <v-icon>mdi-close</v-icon>
        </v-btn>
      </v-toolbar>
      <v-form>
        <div class="mt-2 pa-3">
          <v-row justify="center">
            <v-card-text>
              <template v-for="(post, i) in posts">
                <v-list-item :key="i">
                  <v-list-item-content>
                    <v-list-item-title class="py-2">
                      {{ post.title }}
                    </v-list-item-title>
                    <div class="pickup-plus-box">
                      <div class="pickup-plus-show-box">
                        <v-icon
                          class="green--text"
                          @click="updatePickUp(post.id)"
                        >
                          mdi-plus-box-outline
                        </v-icon>
                      </div>
                    </div>
                  </v-list-item-content>
                </v-list-item>
              </template>
            </v-card-text>
          </v-row>
        </div>
      </v-form>
    </v-card>
  </v-dialog>
</template>

<script>
import axios from '@/plugins/axios'

export default {
  props: {
    dialog: {
      type: Boolean,
      required: true
    },
    posts: {
      type: [Object, Array],
      required: true
    }
  },
  data () {
    return {
      dialogStatus: this.dialog,
      notFound: false
    }
  },
  computed: {
    currentUser () {
      return this.$store.state.currentUser
    }
  },
  watch: {
    dialog (newValue) {
      this.dialogStatus = newValue
    }
  },
  mounted () {
    axios
      .get(`/v1/posts/${this.$route.params.id}`)
      .then((res) => {
        this.title = res.data.title
        this.point = res.data.point
      })
      .catch((error) => {
        if (error.response.status === 404) {
          this.notFound = true
        }
      })
  },
  methods: {
    updatePickUp (i) {
      axios
        .post(`/v1/pickups/${i}`, {
          user_id: this.currentUser.id
        })
        .then((res) => {
          this.$store.commit('setFlash', {
            status: true,
            message: 'イチオシに追加しました'
          })
          setTimeout(() => {
            this.$store.commit('setFlash', {})
          }, 2000)
          this.reload()
        })
    },
    closeDialog () {
      this.$emit('closeDialog')
    },
    reload () {
      this.$router.go({ path: this.$router.currentRoute.path, force: true })
    }
  }
}
</script>

<style type="scoped">
.pickup-plus-box {
  display: flex;
  justify-content: flex-end;
}
</style>
