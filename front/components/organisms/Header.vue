<template>
  <v-app-bar
    app
    dark
    fixed
  >
    <n-link to="/" style="text-decoration:none;">
      <AppLogo />
    </n-link>
    <v-toolbar-title>
      {{ appName }}
    </v-toolbar-title>
    <v-spacer />
    <div class="header-list">
      <v-btn
        v-if="!currentUser"
        to="/login"
        text
        color="white"
        :outlined="true"
        small
      >
        ログイン
      </v-btn>
      <v-btn
        v-if="!currentUser"
        to="/signup"
        text
        color="white"
        :outlined="true"
        small
      >
        新規登録
      </v-btn>
      <v-btn
        v-if="currentUser"
        to="/login"
        text
        color="white"
        :outlined="true"
        small
        @click="logOut"
      >
        ログアウト
      </v-btn>
    </div>
  </v-app-bar>
</template>

<script>
import firebase from '@/plugins/firebase'

export default {
  data () {
    return {
      appName: 'Part t mana'
    }
  },
  computed: {
    currentUser () {
      return this.$store.state.currentUser
    }
  },
  methods: {
    logOut () {
      firebase.auth().signOut()
        .then(() => {
          this.$store.commit('setUser', null)
          this.$router.push('/login')
        })
        .catch((error) => {
          console.log(error)
        })
    }
  }
}
</script>

<style>
.app-title {
 margin-left: 200px;
 font-size: 1.5em;
 letter-spacing: 2px;
}

.header-list {
   display: flex;
   margin-right: 200px;
}

@media (max-width: 1024px) {
 .app-title {
   margin-left: 50px;
   font-size: 1.2em;
 }

 .header-list {
   margin-right: 50px;
 }

}

@media (max-width: 480px) {
 .app-title {
   margin-left: 0;
   font-size: 1em;
   letter-spacing: 1px;
}

.header-list {
    margin-right: 0;
  }
}

</style>
