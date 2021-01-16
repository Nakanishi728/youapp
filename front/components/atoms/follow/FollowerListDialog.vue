<template>
  <v-dialog
    v-model="followerdialogStatus"
    max-width="500px"
    persistent
  >
    <v-card width="500px" class="mx-auto">
      <v-toolbar flat>
        <v-toolbar-title>
          現在フォローされているユーザー
        </v-toolbar-title>
        <v-spacer />
        <v-btn
          icon
          @click="followercloseDialog"
        >
          <v-icon>mdi-close</v-icon>
        </v-btn>
      </v-toolbar>
      <v-list>
        <v-list-item
          v-for="fr in follower"
          :key="fr.id"
        >
          <v-list-item-title>
            <UsersAvatar
              :size="36"
              :user="fr"
            />
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
