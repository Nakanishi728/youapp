<template>
  <v-container>
    <v-row
      justify="center"
    >
      <v-card
        flat
        width="500"
        class="mx-auto"
      >
        <v-card-title>
          退会確定画面
        </v-card-title>
        <v-card-title class="justify-center">
          退会
        </v-card-title>
        <v-divider />
        <v-card-text class="justify-center">
          {{ deletemessage }}
        </v-card-text>
        <v-divider />
        <v-card-actions class="justify-center align-baseline">
          <div>
            <v-row justify="center">
              <v-checkbox
                v-model="checkbox"
                class="mx-3"
                :label="'上記の理由に同意し退会確定に進む'"
              />
            </v-row>
            <v-row justify="center">
              <v-btn
                v-show="checkbox === true"
                class="mb-5"
                color="red--text white accent-3"
                @click="destroyUser"
              >
                退会
              </v-btn>
            </v-row>
          </div>
        </v-card-actions>
      </v-card>
    </v-row>
  </v-container>
</template>

<script>
import axios from '@/plugins/axios'
import firebase from '@/plugins/firebase'

export default {
  data () {
    return {
      deletemessage: 'この度は、PUSHARをご利用いただき誠にありがとうございます。PUSHARを退会すると、ご利用履歴などの一切の情報を削除いたします。なお、一度退会されたアカウント情報の復元は不可になります。上記に同意の上、退会を希望される場合は以下から退会確定をお願いいたします。',
      email: '',
      originEmail: '',
      disabled: false,
      dialog: false,
      isEmail: false,
      isPassword: false,
      isDeleteAccount: false,
      checkbox: false
    }
  },
  computed: {
    currentUser () {
      return this.$store.state.currentUser
    }
  },
  mounted () {
    const setDefaultData = () => {
      axios
        .get(`/v1/users/${this.currentUser.id}`)
        .then((res) => {
          this.email = res.data.email
          this.originEmail = res.data.email
        })
    }
    if (this.currentUser.id) {
      setDefaultData()
    } else {
      setTimeout(setDefaultData, 1000)
    }
  },
  methods: {
    loginSuccess () {
      if (this.isEmail) {
        this.isEmail = false
        this.changeUsersEmail()
      } else if (this.isPassword) {
        this.isPassword = false
        this.changeUsersPassword()
      }
    },
    destroyUser () {
      const user = firebase.auth().currentUser
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
    openDialogForDeleteAccount () {
      this.isDeleteAccount = true
      this.dialog = true
    }
  }
}
</script>
