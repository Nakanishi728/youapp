<template>
  <v-container>
    <ErrorAnnounce
      :status="notFound"
    />
    <div v-if="!notFound" class="my-page-box">
      <v-row>
        <v-col lg="4" md="4" sm="4" cols="12">
          <UsersInfo
            :user="user"
            :follow="follow"
            :follower="follower"
          />
          <UsersLinks />
        </v-col>
        <v-col lg="8" md="8" sm="8" cols="12">
          <UsersChange />
          <UsersPickUp />
          <UsersContents />
        </v-col>
      </v-row>
    </div>
  </v-container>
</template>

<script>
import axios from '@/plugins/axios'
import ErrorAnnounce from '~/components/molecules/ErrorAnnounce.vue'
import UsersInfo from '~/components/organisms/users/UsersInfo.vue'
import UsersLinks from '~/components/organisms/users/UsersLinks.vue'
import UsersContents from '~/components/organisms/users/UsersContents.vue'
import UsersPickUp from '~/components/organisms/users/UsersPickUp.vue'
import UsersChange from '~/components/organisms/users/UsersChange.vue'

export default {
  components: {
    ErrorAnnounce,
    UsersInfo,
    UsersLinks,
    UsersContents,
    UsersPickUp,
    UsersChange
  },
  data () {
    return {
      user: {},
      follow: {},
      follower: {},
      notFound: false
    }
  },
  computed: {
    currentUser () {
      return this.$store.state.currentUser
    }
  },
  mounted () {
    axios
      .get(`/v1/users/${this.$route.params.id}`)
      .then((res) => {
        const user = res.data
        this.user = user
      })
      .catch((error) => {
        if (error.response.status === 404) {
          this.notFound = true
        }
      })
    axios
      .get(`/v1/users/${this.$route.params.id}/following`)
      .then((res) => {
        const follow = res.data
        this.follow = follow
      })
      .catch((error) => {
        if (error.response.status === 404) {
          this.notFound = true
        }
      })
    axios
      .get(`/v1/users/${this.$route.params.id}/followers`)
      .then((res) => {
        const follower = res.data
        this.follower = follower
      })
      .catch((error) => {
        if (error.response.status === 404) {
          this.notFound = true
        }
      })
  }
}
</script>
