<template>
  <v-card class="mx-auto mt-5 pa-5" width="400px">
    <v-card-title>
      <h1 class="resetting-title">
        パスワード再設定
      </h1>
      <p class="mx-auto mt-5 resetting-text">
        PUSHARに登録したメールアドレスをご入力ください。<br>PUSHAR@youapp-1211.firebaseapp.comから入力されたメールアドレス宛にパスワード再設定URLを発行します。
      </p>
    </v-card-title>
    <v-card-text>
      <v-form>
        <p v-if="error" class="errors">
          {{ error }}
        </p>
        <TextField
          v-model="email"
          label="メールアドレス"
          rules="max:255|required|email"
        />
        <v-row justify="center">
          <v-btn
            color="black lighten-3"
            class="mx-auto white--text mt-4"
            @click="resetting"
          >
            送信
          </v-btn>
        </v-row>
      </v-form>
    </v-card-text>
  </v-card>
</template>

<script>
import firebase from '@/plugins/firebase'

export default {
  data () {
    return {
      email: '',
      error: ''
    }
  },
  methods: {
    resetting () {
      firebase.auth().sendPasswordResetEmail(this.email)
        .then(() => {
          this.$store.commit('setFlash', {
            status: true,
            message: '送信完了'
          })
          setTimeout(() => {
            this.$store.commit('setFlash', {})
          }, 2000)
          this.$router.replace('/')
        })
        .catch((error) => {
          this.error = ((code) => {
            switch (code) {
              case 'auth/user-not-found':
                return 'メールアドレスが間違っています'
              default:
                return 'メールアドレスをご確認ください'
            }
          })(error.code)
        })
    }
  }
}
</script>

<style type="scoped">
.resetting-title {
  font-size: 24px;
}

.resetting-text {
  font-size: 12px;
  opacity: 0.5;
}
</style>
