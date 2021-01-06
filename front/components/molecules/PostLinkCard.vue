<template>
  <div class="link-box mt-2">
    <v-card
      max-width="600px"
      color="blue lighten-2"
      style="color:white;"
    >
      <v-card-actions>
        <v-btn
          color="white"
          text
          :href="og_url"
        >
          リンク先へ
        </v-btn>
        <v-spacer />
        <v-btn
          icon
          @click="show = !show"
        >
          <v-icon color="white">
            {{ show ? 'mdi-chevron-up' : 'mdi-chevron-down' }}
          </v-icon>
        </v-btn>
      </v-card-actions>
      <v-expand-transition>
        <div v-show="show">
          <v-divider />
          <v-card-text>
            <p>
              {{ og_title }}
            </p>
          </v-card-text>
        </div>
      </v-expand-transition>
    </v-card>
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
