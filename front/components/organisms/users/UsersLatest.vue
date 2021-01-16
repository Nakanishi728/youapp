<template>
  <div>
    <v-card
      elevation="0"
      class="mx-auto my-4"
    >
      <v-card-title>
        USER最新50<span v-not-visible="'mobile'">(PUSHARを使い始めて間もないユーザーが掲示されています)</span>
      </v-card-title>
    </v-card>
    <v-list two-line>
      <template v-for="(user, index) in users">
        <v-list-item :key="user.index">
          <v-list-item-title>
            <UsersAvatar
              :size="36"
              :user="user"
            />
            <nuxt-link
              :to="`/users/${user.id}`"
              style="color:#37474F;"
            >
              {{ user.name }}
            </nuxt-link>
            <v-list-item-content class="py-1">
              <v-list-item-subtitle>
                {{ user.profile }}
              </v-list-item-subtitle>
            </v-list-item-content>
          </v-list-item-title>
          <v-list-item-action>
            <v-icon small>
              mdi-open-in-new
            </v-icon>
          </v-list-item-action>
        </v-list-item>
        <v-divider
          v-if="index < users.length - 1"
          :key="index"
        />
      </template>
    </v-list>
  </div>
</template>

<script>
import axios from '@/plugins/axios'

export default {
  data () {
    return {
      users: {}
    }
  },
  mounted () {
    axios
      .get('/v1/users/latest/all')
      .then((res) => {
        const users = res.data
        this.users = users
      })
      .catch((error) => {
        if (error.response.status === 404) {
          this.notFound = true
        }
      })
  },
  methods: {
    show (str) {
      alert(str)
    }
  }
}
</script>
