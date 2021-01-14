<template>
  <v-dialog
    v-model="dialogStatus"
    max-width="400px"
    persistent
  >
    <v-card width="500px" class="mx-auto">
      <v-toolbar flat>
        <v-toolbar-title>
          再認証
        </v-toolbar-title>
        <v-spacer />
        <v-btn
          icon
          @click="closeDialog"
        >
          <v-icon>mdi-close</v-icon>
        </v-btn>
      </v-toolbar>
      <v-card-text>
        <v-form>
          <p v-if="error" class="errors">
            {{ error }}
          </p>
          <TextField
            v-model="password"
            label="現在のパスワード"
            rules="required|min:6"
            :type="show1 ? 'text' : 'password'"
            :append-icon="show1 ? 'mdi-eye' : 'mdi-eye-off'"
            vid="password"
            @click:append="show1 = !show1"
          />
          <v-card-actions>
            <v-row justify="end">
              <v-btn
                color="black lighten-3"
                class="white--text"
                @click="destroyUser"
              >
                再認証
              </v-btn>
            </v-row>
          </v-card-actions>
        </v-form>
      </v-card-text>
    </v-card>
  </v-dialog>
</template>

<script>
import axios from '@/plugins/axios'
import firebase from '@/plugins/firebase'
import TextField from '~/components/atoms/TextField.vue'

export default {
  components: {
    TextField
  },
  props: {
    dialog: {
      type: Boolean,
      required: true
    },
    email: {
      type: String,
      required: true
    }
  },
  data () {
    return {
      password: '',
      show1: false,
      error: '',
      dialogStatus: this.dialog
    }
  },
  watch: {
    dialog (newValue) {
      this.dialogStatus = newValue
    }
  },
  methods: {
    destroyUser () {
      const user = firebase.auth().currentUser
      this.$store.commit('setLoading', true)
      user.delete().then(() => {
        axios.delete(`/v1/users/${this.currentUser.id}`)
          .then(() => {
            this.$store.commit('setFlash', {
              status: true,
              message: 'ユーザーを削除しました'
            })
            setTimeout(() => {
              this.$store.commit('setFlash', {})
            }, 2000)
            this.$router.replace('/')
          })
      })
    },
    closeDialog () {
      this.$emit('closeDialog')
    }
  }
}
</script>
