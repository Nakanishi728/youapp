<template>
  <v-toolbar>
    <v-tabs
      dark
      background-color="primary"
      grow
    >
      <v-tab>
        <v-badge
          color="pink"
          icon="mdi-home"
        >
          <nuxt-link
            :to="'/'"
            style="color:white; text-decoration:none;"
          >
            最新
          </nuxt-link>
        </v-badge>
      </v-tab>

      <v-tab>
        <v-badge
          color="green"
          icon="mdi-human-greeting"
        >
          ユーザー
        </v-badge>
      </v-tab>

      <v-tab>
        <v-badge
          color="deep-purple"
          icon=" mdi-thumb-up"
        >
          ストック
        </v-badge>
      </v-tab>
    </v-tabs>
  </v-toolbar>
</template>
