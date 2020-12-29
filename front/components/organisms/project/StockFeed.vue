<template>
  <div>
    <Stock
      v-for="like in likes"
      :key="like.id"
      :user="like.user"
      :like="like"
    />
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
