<template>
  <v-avatar
    :size="size"
  >
    <img
      v-if="user.avatar_url"
      :src="user.avatar_url"
      alt="Avatar"
    >
    <v-icon
      v-else
      size="62"
      color="light-blue"
      alt="Avater"
    >
      mdi-account-circle
    </v-icon>
  </v-avatar>
</template>

<script>
export default {
  props: {
    size: {
      type: Number,
      required: true
    },
    user: {
      type: Object,
      required: true
    }
  }
}
</script>
