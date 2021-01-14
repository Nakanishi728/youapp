<template>
  <div>
    <v-card
      elevation="0"
      class="mx-auto my-4"
    >
      <v-card-title>
        User最新50<span v-not-visible="'tablet'" @:click="show('tablet')">(PUSHARを使い始めて間もないユーザーが掲示されています)</span>
      </v-card-title>
    </v-card>
    <v-list two-line>
      <template v-for="(user, index) in users">
        <v-list-item :key="user.index">
          <v-list-item-title>
            <v-avatar
              class="mt-2"
            >
              <img
                v-if="user.avatar_url"
                :src="user.avatar_url"
                size="30"
                style="margin-bottom:15px;"
                alt="Avatar"
              >
              <v-icon
                v-else
                size="40"
                color="light-blue"
                alt="Avater"
              >
                mdi-account-circle
              </v-icon>
            </v-avatar>
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
