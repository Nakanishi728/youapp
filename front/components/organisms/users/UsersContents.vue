<template>
  <v-card class="mx-auto mt-4">
    <v-card-title>
      <v-icon
        color="blue lighten-1"
      >
        mdi-square
      </v-icon>
      <h4>
        全ての投稿(シェア)
      </h4>
    </v-card-title>
    <PostContent
      :posts="posts"
    />
    <v-divider />
  </v-card>
</template>

<script>
export default {
  props: {
    posts: {
      type: [Object, Array],
      required: true
    }
  }
}
</script>
