<template>
  <v-card class="mx-auto mt-5 pa-5" width="400px">
    <v-card-title>
      <h1 class="signup-title">
        新規登録
      </h1>
    </v-card-title>
    <v-card-text>
      <v-form>
        <TextField />
        <TextField />
        <TextField />
        <TextField />
      </v-form>
    </v-card-text>
  </v-card>
</template>

<script>
export default {
}
</script>

<style>
  .signup-title {
    font-size: 24px;
 }
</style>
