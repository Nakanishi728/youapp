<template>
  <v-list>
    <v-list-item
      v-for="(nav, i) in navMenus"
      :key="i"
      :to="nav.to"
      exact
    >
      <v-list-item-icon class="mr-2">
        <v-icon size="22" color="blue" v-text="nav.icon" />
      </v-list-item-icon>
      <v-list-item-content>
        <v-list-item-title>
          {{ nav.name }}
        </v-list-item-title>
      </v-list-item-content>
    </v-list-item>
  </v-list>
</template>

<script>
export default {
  data () {
    return {
      navMenus: [
        {
          name: 'ホーム',
          to: '/',
          icon: 'mdi-home'
        },
        {
          name: '新しい投稿',
          to: '/posts/create',
          icon: 'mdi-send'
        },
        {
          name: 'URL検索',
          to: '/project/search',
          icon: 'mdi-magnify'
        },
        {
          name: 'ストック一覧',
          to: '/project/stock',
          icon: 'mdi-playlist-check'
        },
        {
          name: 'ヘルプ',
          to: '/project/help',
          icon: 'mdi-information-outline'
        },
        {
          name: '退会申請',
          to: '/project/settings',
          icon: 'mdi-account-remove'
        }
      ]
    }
  },
  computed: {
    currentUser () {
      return this.$store.state.currentUser
    }
  }
}
</script>
