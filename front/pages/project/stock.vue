<template>
  <v-container>
    <div>
      <v-row justify="center">
        <v-col>
          <StockFeed />
        </v-col>
      </v-row>
    </div>
  </v-container>
</template>

<script>
export default {
  fetch ({ store, redirect }) {
    store.watch(
      state => state.currentUser,
      (newUser, oldUser) => {
        if (!newUser) {
          return redirect('/login')
        }
      }
    )
  }
}
</script>
