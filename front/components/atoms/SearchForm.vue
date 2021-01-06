<template>
  <div>
    <h1>{{ message }}</h1>
    <v-form>
      <v-text-field
        ref="searchForm"
        v-model="search"
        hide-details
        placeholder="例) AWS、Docker、Python (ヒットさせたいキーワードをいくつか分けて)"
        dense
      />
    </v-form>
    <div class="search-container">
      <table>
        <thead>
          <tr>
            <th style="width:20%;">
              URLタイトル
            </th>
            <th style="width:80%;">
              URL詳細
            </th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="post in search_posts" :key="post.id">
            <td>
              <n-link
                :to="`/posts/${post.id}`"
                v-html="$sanitize(highLight(post.title))"
              />
            </td>
            <td v-html="$sanitize(highLight(post.point))" />
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>

<script>
import axios from '@/plugins/axios'

export default {
  data () {
    return {
      posts: [],
      search: '',
      message: 'URL検索'
    }
  },
  computed: {
    search_posts () {
      const searchWord = this.search.trim()
      if (searchWord === '') {
        return this.posts
      }
      return this.posts.filter((post) => {
        return post.title.includes(searchWord) ||
        post.point.includes(searchWord)
      })
    }
  },
  mounted () {
    axios
      .get('/v1/posts')
      .then((res) => {
        this.posts = res.data
      })
  },
  methods: {
    highLight (text) {
      const searchWord = this.search.trim()
      if (searchWord === '') {
        return text
      }
      if (!text.includes(searchWord)) {
        return text
      }
      const re = new RegExp(searchWord, 'ig')
      return text.replace(re, function (search) {
        return search
      })
    }
  }
}
</script>

<style type="scoped">
.search-container {
  margin-top: 20px;
}

table {
  border-collapse: collapse;
  width: 100%;
}
td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}
th {
  color:white;
  background-color: #1E90FF;
}
</style>
