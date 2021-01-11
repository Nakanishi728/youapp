<template>
  <v-toolbar>
    <v-tabs
      dark
      background-color="primary"
      grow
      show-arrows
    >
      <v-tab
        v-for="(tab, i) in tabs"
        :key="i"
        :to="tab.to"
        exact
      >
        <v-badge
          size="22"
          :icon="tab.icon"
          :color="tab.color"
        >
          {{ tab.name }}
        </v-badge>
      </v-tab>
    </v-tabs>
  </v-toolbar>
</template>

<script>
export default {
  data () {
    return {
      tabs: [
        {
          name: '最新',
          to: '/',
          icon: 'mdi-home',
          color: 'pink'
        },
        {
          name: 'ユーザー',
          to: '/project/latestuser',
          icon: 'mdi-human-greeting',
          color: 'green'
        },
        {
          name: 'ストック',
          to: '/project/lateststock',
          icon: 'mdi-thumb-up',
          color: 'deep-purple'
        }
      ]
    }
  }
}
</script>
