<template>
  <div>
    <v-card flat>
      <v-card-title class="justify-center display-1">
        サイトについて
      </v-card-title>
      <v-card-text class="text-center">
        プログラミング初心者に優しいURLを共有するアプリケーションです
      </v-card-text>
    </v-card>
    <v-card-title class="text-subtitle-2 justify-center">
      Programming + URL + Sharing + Service
    </v-card-title>
    <v-card-title class="text-subtitle-2 justify-center">
      採用技術
    </v-card-title>
    <v-container
      fluid
      :style="{ maxWidth: '960px' }"
    >
      <v-row justify="space-around">
        <div
          v-for="(tec, i) in technologies"
          :key="`tec-${i}`"
          class="text-center pa-2"
        >
          <v-avatar
            :color="tec.color"
            size="80"
          >
            <span class="white--text">
              {{ tec.name }}
            </span>
          </v-avatar>
          <div class="pt-2 text-body-2 my-grey">
            {{ tec.use }}
          </div>
          <div class="pt-2 text-body-2 my-grey">
            {{ tec.v }}
          </div>
        </div>
      </v-row>
    </v-container>
  </div>
</template>

<script>
export default {
  data () {
    return {
      technologies: [
        { name: 'Docker', v: 'v19.03+', use: '開発環境', color: '#2496ED' },
        { name: 'Rails api', v: 'v6.0+', use: 'サーバーサイド', color: '#CC0000' },
        { name: 'Postgre SQL', v: '', use: 'データベース', color: '#336791' },
        { name: 'Nuxt.js spa', v: 'v2.14+', use: 'フロントエンド', color: '#00C48D' },
        { name: 'AWS', v: '', use: '本番稼働', color: '#6762A6' },
        { name: 'Vuetify', v: 'v2.3+', use: 'CSSフレームワーク', color: '#1867C0' }
      ]
    }
  }
}
</script>
