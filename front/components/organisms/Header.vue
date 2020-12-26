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
      <div v-if="!loggedIn" class="before-login-box">
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
      </div>
      <div v-if="loggedIn" class="after-login-box">
        <v-menu
          offset-y
          dense
          nav
        >
          <template v-slot:activator="{on, attrs}">
            <v-avatar
              size="40"
            >
              <img
                v-if="currentUser.avatar_url"
                :src="currentUser.avatar_url"
                alt="Avatar"
                v-bind="attrs"
                v-on="on"
              >
              <img
                v-else
                src="~/assets/image/default-icon.png"
                alt="Avater"
                v-bind="attrs"
                v-on="on"
              >
            </v-avatar>
          </template>
          <v-list
            dense
          >
          <v-subheader>
            ログイン中のユーザー
          </v-subheader>
          <v-list-item>
            <v-list-item-content>
              <v-list-item-subtitle>
                {{ this.$store.state.currentUser.name }}
              </v-list-item-subtitle>
            </v-list-item-content>
          </v-list-item>
          <v-divider />
            <v-list-item
              v-for="(link, l) in links"
              :key="l"
              :to="link.to"
              exact
            >
              <v-list-item-title>{{ link.name }}</v-list-item-title>
            </v-list-item>
          </v-list>
          <v-divider />
          <v-list
            dense
          >
            <v-list-item key="logout" @click="logOut">
              <v-list-item-title>ログアウト</v-list-item-title>
            </v-list-item>
          </v-list>
        </v-menu>
      </div>
    </div>
  </v-app-bar>
</template>

<script>
import firebase from '@/plugins/firebase'

export default {
  data () {
    return {
      appName: 'PUSHAR'
    }
  },
  computed: {
    currentUser () {
      return this.$store.state.currentUser
    },
    links () {
      const links = [
        {
          name: 'マイページ',
          to: `/users/${this.currentUser.id}`
        },
        {
          name: 'アカウント編集',
          to: '/users/edit'
        },
        {
          name: 'プロフィール編集',
          to: '/users/profile'
        }
      ]
      return links
    },
    loggedIn () {
      return this.$store.state.loggedIn
    }
  },
  methods: {
    logOut () {
      firebase
        .auth()
        .signOut()
        .then(() => {
          this.$store.commit('setFlash', {
            status: true,
            message: 'ログアウトしました'
          })
          setTimeout(() => {
            this.$store.commit('setFlash', {})
          }, 1500)
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

.before-login-box {
 display: flex;
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
