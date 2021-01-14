<template>
  <v-app style="background-color: #ECEFF1;">
    <Flash />
    <div>
      <Loading
        v-show="loading === true"
      />
    </div>
    <Header />
    <v-main>
      <v-container>
        <Nuxt />
      </v-container>
    </v-main>
  </v-app>
</template>

<script>

export default {
  computed: {
    loading () {
      return this.$store.state.loading
    }
  }
}
</script>
