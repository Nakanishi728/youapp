<template>
  <div
    class="mx-auto"
    width="300"
  >
    <h5
      style="cursor:pointer"
      @click="drawer = !drawer"
    >
      カテゴリ一覧
      <v-icon>
        mdi-chevron-down
      </v-icon>
    </h5>
    <v-navigation-drawer
      v-model="drawer"
    >
      <v-list>
        <v-list-item
          v-for="(category, l) in categoryMenus"
          :key="l"
          :to="category.to"
          exact
        >
          <v-list-item-icon class="mr-2">
            <v-icon size="22" v-text="category.icon" />
          </v-list-item-icon>
          <v-list-item-title>{{ category.name }}</v-list-item-title>
        </v-list-item>
      </v-list>
    </v-navigation-drawer>
  </div>
</template>

<script>
export default {
  data () {
    return {
      drawer: false,
      categoryMenus: [
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
      ]
    }
  }
}
</script>
