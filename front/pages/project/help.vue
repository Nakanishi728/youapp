<template>
  <div>
    <v-row
      align="center"
      justify="center"
    >
      <v-col
        cols="12"
        class="text-center"
      >
        <h1 class="display-1 mb-4">
          ヘルプページ
        </h1>
        <h4
          class="subheading"
          :style="{ letterSpacing: '5px' }"
        >
          各機能の詳細が記載されています
        </h4>
      </v-col>
    </v-row>
    <v-sheet>
      <v-container
        fluid
        :style="{ maxWidth: '1280px' }"
      >
        <v-row>
          <v-col cols="12">
            <WelAbout />
          </v-col>
        </v-row>
        <v-row>
          <v-col cols="12">
            <WelProducts />
          </v-col>
        </v-row>
        <v-row>
          <v-col cols="12">
            <WelContact />
          </v-col>
        </v-row>
      </v-container>
    </v-sheet>
  </div>
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
