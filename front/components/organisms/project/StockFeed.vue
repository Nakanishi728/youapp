<template>
  <div>
    <v-row>
      <v-col>
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
      </v-col>
    </v-row>
    <v-row>
      <v-col>
        <Stock
          v-for="like in likes"
          :key="like.id"
          :like="like"
        />
      </v-col>
    </v-row>
    <v-row>
      <v-col>
        <ScrollTop />
      </v-col>
    </v-row>
  </div>
</template>

<script>
import axios from '@/plugins/axios'

export default {
  data () {
    return {
      likes: []
    }
  },
  mounted () {
    this.$store.commit('setLoading', true)
    axios
      .get('/v1/likes')
      .then((res) => {
        this.$store.commit('setLoading', false)
        this.likes = res.data
      })
  }
}
</script>
