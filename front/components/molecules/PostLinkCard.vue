<template>
  <div>
      <v-carousel-item height="100%">
        <v-sheet
          height="100%"
          tile
        >
          <v-row
            class="fill-height"
            align="center"
            justify="center"
          >
            <v-img
              :src="og_image"
              height="100%"
            />
          </v-row>
        </v-sheet>
      </v-carousel-item>
  </div>
</template>

<script>
export default {
  props: {
    link: {
      type: Object,
      required: true
    }
  },
  data () {
    return {
      og_url: this.link.og_url,
      og_title: this.link.og_title,
      og_image: this.link.og_image,
      og_description: this.link.og_description,
      show: false
    }
  }
}
</script>
