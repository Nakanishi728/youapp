<template>
  <div>
    <v-row>
      <v-card
        class="mx-auto mt-4 pa-3"
        width="600px"
        color="white--text"
        style="background-color:gray;"
      >
        <v-card-title>
          ストック
        </v-card-title>
      </v-card>
    </v-row>
    <v-row>
      <Stock
        v-for="like in likes"
        :key="like.id"
        :like="like"
      />
    </v-row>
  </div>
</template>

<script>
import axios from '@/plugins/axios'
import Stock from '~/components/molecules/project/Stock.vue'

export default {
  components: {
    Stock
  },
  data () {
    return {
      likes: []
    }
  },
  mounted () {
    axios
      .get('/v1/likes')
      .then((res) => {
        this.likes = res.data
      })
  }
}
</script>
