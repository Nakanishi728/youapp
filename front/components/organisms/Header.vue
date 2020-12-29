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
    <LoggedInAppBar />
  </v-app-bar>
</template>

<script>
import LoggedInAppBar from '~/components/organisms/loggedIn/LoggedInAppBar'

export default {
  components: {
    LoggedInAppBar
  },
  data () {
    return {
      appName: 'PUSHAR'
    }
  }
}
</script>

<style type="scoped">
.app-title {
 margin-left: 200px;
 font-size: 1.5em;
 letter-spacing: 2px;
}

.header-list {
   display: flex;
   margin-right: 200px;
}
</style>
