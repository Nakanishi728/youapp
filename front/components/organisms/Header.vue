<template>
  <v-app-bar
    app
    dark
    fixed
  >
    <AppLogo />
    <v-toolbar-title>
        {{ appName }}
    </v-toolbar-title>
  </v-app-bar>
</template>

<script>
export default {
  data () {
    return {
      appName: 'Part t mana'
    }
  }
}
</script>
