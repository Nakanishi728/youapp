<template>
  <v-container>
    <v-card class="mx-auto mt-5 pa-5" width="600px">
      <v-card-title>
        <h2 class="user-profile-title">
          プロフィール
        </h2>
      </v-card-title>
      <v-card-text>
        <v-form>
          <ChangeUsersAvater
            rules="size:300"
          />
          <ChangeUsersName
            v-model="name"
            label="名前"
            rules="max:30|required"
          />
          <ChangeUsersProfile
            v-model="profile"
            label="プロフィール文"
            rules="max:140"
            :counter="140"
          />
        </v-form>
      </v-card-text>
    </v-card>
  </v-container>
</template>

<script>
import axios from '@/plugins/axios'
import ChangeUsersName from '~/components/organisms/users/ChangeUsersName.vue'
import ChangeUsersProfile from '~/components/organisms/users/ChangeUsersProfle.vue'
import ChangeUsersAvater from '~/components/organisms/users/ChangeUsersAvater.vue'

export default {
  components: {
    ChangeUsersName,
    ChangeUsersProfile,
    ChangeUsersAvater
  },
  fetch ({ store, redirect }) {
    store.watch(
      state => state.currentUser,
      (newUser, oldUser) => {
        if (!newUser) {
          return redirect('/login')
        }
      }
    )
  },
  data () {
    return {
      name: '',
      profile: '',
      avatar: '',
      currentAvatarUrl: ''
    }
  },
  computed: {
    currentUser () {
      return this.$store.state.currentUser
    }
  },
  mounted () {
    const setDefaultData = () => {
      axios
        .get(`/v1/users/${this.currentUser.id}`)
        .then((res) => {
          this.name = res.data.name
          this.profile = res.data.profile
          this.currentAvatarUrl = res.data.avatar_url
        })
    }
    if (this.currentUser.id) {
      setDefaultData()
    } else {
      setTimeout(setDefaultData, 1000)
    }
  }
}
</script>

<style type="scoped">
.user-profile-title {
  font-size: 24px;
}
</style>
