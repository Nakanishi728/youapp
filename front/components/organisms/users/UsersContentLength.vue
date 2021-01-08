<template>
  <v-card style="background-color:gray;">
    <v-row>
      <div class="user-content" style="width:100%;">
        <div class="user-content-container">
          <v-col>
            <p class="user-info-box-name">
              投稿数: {{ posts.length }}
            </p>
          </v-col>
          <v-col>
            <p class="user-info-box-name" style="margin:auto;">
              ストック数: {{ likes.length }}
            </p>
          </v-col>
        </div>
      </div>
    </v-row>
  </v-card>
</template>

<script>
import axios from '@/plugins/axios'

export default {
  props: {
    posts: {
      type: [Object, Array],
      required: true
    }
  },
  data () {
    return {
      likes: []
    }
  },
  mounted () {
    axios
      .get(`/v1/likes/${this.$route.params.id}`)
      .then((res) => {
        this.likes = res.data
      })
  }
}
</script>

<style type="scoped">
.user-content-container {
  display: flex;
  justify-content: space-between;
  margin-left: 100px;
  color: white;
  font-weight: bold;
}
</style>
