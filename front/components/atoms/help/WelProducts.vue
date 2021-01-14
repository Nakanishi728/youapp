<template>
  <v-card flat>
    <v-card-title class="justify-center display-1">
      サービス
    </v-card-title>
    <v-card-text class="text-center">
      Service
    </v-card-text>
    <v-row>
      <v-col
        cols="12"
        sm="6"
      >
        <v-list flat>
          <v-list-item
            v-for="(point, i) in points"
            :key="`point-${i}`"
          >
            <v-list-item-icon>
              <v-icon
                size="30"
                :color="point.color"
                v-text="point.icon"
              />
            </v-list-item-icon>
            <v-list-item-content>
              <div
                class="text-subtitle-1"
                v-text="point.text"
              />
            </v-list-item-content>
          </v-list-item>
        </v-list>
      </v-col>
      <v-col
        cols="12"
        sm="6"
      >
        <v-list flat>
          <v-list-item
            v-for="(item, i) in items"
            :key="`point-${i}`"
          >
            <v-list-item-icon>
              <v-icon
                size="30"
                :color="item.color"
                v-text="item.icon"
              />
            </v-list-item-icon>
            <v-list-item-content>
              <div
                class="text-subtitle-1"
                v-text="item.text"
              />
            </v-list-item-content>
          </v-list-item>
        </v-list>
      </v-col>
    </v-row>
  </v-card>
</template>

<script>
export default {
  data () {
    return {
      points: [
        {
          icon: 'mdi-send',
          color: 'blue',
          text: '新規投稿(新しい投稿を行ってシェアしてください)'
        },
        {
          icon: 'mdi-magnify',
          color: 'green accent-4',
          text: 'URL検索(ヒットさせたいキーワードを検索してください)'
        },
        {
          icon: 'mdi-playlist-check',
          color: 'deep-orange',
          text: 'ストック機能(帰宅後などにゆっくり整理しよう)'
        }
      ],
      items: [
        {
          icon: 'mdi-account-plus',
          color: '#1867C0',
          text: 'フォロー機能(シェア友を見つけましょう)'
        },
        {
          icon: 'mdi-xml',
          color: '#CC0000',
          text: 'ピックアップ機能(投稿後イチオシのURLを追加しよう)'
        },
        {
          icon: 'mdi-plus',
          color: 'pink',
          text: 'ストック追加(ストックに追加しよう)'
        }
      ]
    }
  }
}
</script>
