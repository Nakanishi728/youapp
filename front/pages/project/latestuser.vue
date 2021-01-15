<template>
  <v-container>
    <div>
      <v-row>
        <v-col>
          <Tabs />
        </v-col>
      </v-row>
      <v-row>
        <v-col>
          <UsersLatest />
        </v-col>
      </v-row>
      <v-row>
        <v-col>
          <ScrollTop />
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
