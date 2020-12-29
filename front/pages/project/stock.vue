<template>
  <div>
    <LoggedInNavDrawer />
    <v-card class="mx-auto mt-4 pa-3" width="600px">
      <v-card-title>
        ストック一覧
      </v-card-title>
    </v-card>
    <StockFeed />
  </div>
</template>

<script>
import LoggedInNavDrawer from '~/components/organisms/loggedIn/LoggedInNavDrawer.vue'
import StockFeed from '~/components/organisms/project/StockFeed.vue'

export default {
  components: {
    LoggedInNavDrawer,
    StockFeed
  }
}
</script>
