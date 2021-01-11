<template>
  <v-list>
    <v-list-item
      v-for="(nav, i) in navMenus"
      :key="i"
      :to="nav.to"
      exact
    >
      <v-list-item-icon class="mr-2">
        <v-icon size="22" v-text="nav.icon" />
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
          name: '投稿',
          to: '/posts/create',
          icon: 'mdi-send'
        },
        {
          name: '検索',
          to: '/project/search',
          icon: 'mdi-magnify'
        },
        {
          name: 'ストック一覧',
          to: '/project/stock',
          icon: 'mdi-playlist-check'
        },
        {
          name: '設定',
          to: '/project/settings',
          icon: 'mdi-cog'
        },
        {
          name: '各機能説明',
          to: '/project/help',
          icon: 'mdi-information-outline'
        }
      ],
      defaultMenus: [
        {
          name: 'ホーム',
          to: '/',
          icon: 'mdi-home'
        },
        {
          name: '検索',
          to: '/project/search',
          icon: 'mdi-magnify'
        },
        {
          name: '設定',
          to: '/project/settings',
          icon: 'mdi-cog'
        },
        {
          name: '各機能説明',
          to: '/project/help',
          icon: 'mdi-information-outline'
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
