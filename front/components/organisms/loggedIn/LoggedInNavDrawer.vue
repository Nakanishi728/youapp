<template>
  <v-navigation-drawer
    v-if="currentUser"
    app
    mobile-breakpoint="960"
  >
    <v-list>
      <v-list-item>
        <v-list-item-icon>
          <v-icon>
            mdi-home
          </v-icon>
        </v-list-item-icon>
        <v-list-item-content>
          <n-link
            to="/"
          >
            ホーム
          </n-link>
        </v-list-item-content>
      </v-list-item>
      <v-divider />
      <v-list-item>
        <v-list-item-icon>
          <v-icon>
            mdi-send
          </v-icon>
        </v-list-item-icon>
        <v-list-item-content>
          <n-link
            to="/posts/create"
            class="mr-2"
            color="white"
            :outlined="true"
            small
          >
            投稿
          </n-link>
        </v-list-item-content>
      </v-list-item>
      <v-divider />
      <v-list-item>
        <v-list-item-icon>
          <v-icon>
            mdi-file-search-outline
          </v-icon>
        </v-list-item-icon>
        <v-list-item-content>
          <n-link
            to="/project/search"
          >
             検索
          </n-link>
        </v-list-item-content>
      </v-list-item>
      <v-divider />
      <v-list-item>
        <v-list-item-icon>
          <v-icon>
            mdi-playlist-check
          </v-icon>
        </v-list-item-icon>
        <v-list-item-content>
          <n-link
            to="/project/stock"
          >
            ストック一覧
          </n-link>
        </v-list-item-content>
      </v-list-item>
      <v-divider />
      <v-list-item>
        <v-list-item-icon>
          <v-icon>
            mdi-cog
          </v-icon>
        </v-list-item-icon>
        <v-list-item-content>
          <n-link
            to="/project/settings"
          >
            設定
          </n-link>
        </v-list-item-content>
      </v-list-item>
      <v-divider />
      <v-list-item>
        <v-list-item-icon>
          <v-icon>
            mdi-information-outline
          </v-icon>
        </v-list-item-icon>
        <v-list-item-content>
          <n-link
            to="/project/help"
          >
             各機能説明
          </n-link>
        </v-list-item-content>
      </v-list-item>
      <v-divider />
    </v-list>
  </v-navigation-drawer>
</template>

<script>
export default {
  computed: {
    currentUser () {
      return this.$store.state.currentUser
    }
  }
}
</script>
