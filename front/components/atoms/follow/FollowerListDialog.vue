<template>
  <v-dialog
    v-model="followerdialogStatus"
    max-width="500px"
    persistent
  >
    <v-card width="500px" class="mx-auto">
      <v-toolbar flat>
        <v-toolbar-title>
          フォロワー
        </v-toolbar-title>
        <v-spacer />
        <v-btn
          icon
          @click="followercloseDialog"
        >
          <v-icon>mdi-close</v-icon>
        </v-btn>
      </v-toolbar>
      <v-divider />
      <v-card-title>
        現在フォローされているユーザー
      </v-card-title>
      <v-list>
        <v-list-item
          v-for="fr in follower"
          :key="fr.id"
        >
          <v-list-item-title>
            <v-avatar>
              <img
                v-if="fr.avatar_url"
                :src="fr.avatar_url"
                size="40"
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
              :to="`/users/${fr.id}`"
              style="color:#37474F;"
            >
              {{ fr.name }}
            </nuxt-link>
          </v-list-item-title>
        </v-list-item>
      </v-list>
    </v-card>
  </v-dialog>
</template>

<script>
export default {
  props: {
    followerdialog: {
      type: Boolean,
      required: true
    },
    follower: {
      type: [Object, Array],
      default: () => {}
    }
  },
  data () {
    return {
      followerdialogStatus: this.followerdialog
    }
  },
  watch: {
    followerdialog (newValue) {
      this.followerdialogStatus = newValue
    }
  },
  methods: {
    followercloseDialog () {
      this.$emit('followercloseDialog')
    }
  }
}
</script>
