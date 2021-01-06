<template>
  <v-dialog
    v-model="dialogStatus"
    max-width="500px"
    persistent
  >
    <v-card width="500px" class="mx-auto">
      <v-toolbar flat>
        <v-toolbar-title>
          現在フォロー中のユーザー
        </v-toolbar-title>
        <v-spacer />
        <v-btn
          icon
          @click="closeDialog"
        >
          <v-icon>mdi-close</v-icon>
        </v-btn>
      </v-toolbar>
      <v-list>
        <v-list-item
          v-for="f in follow"
          :key="f.id"
        >
          <v-list-item-title>
            <v-avatar>
              <img
                v-if="f.avatar_url"
                :src="f.avatar_url"
                size="40"
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
              :to="`/users/${f.id}`"
              style="color:#37474F;"
            >
              {{ f.name }}
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
    dialog: {
      type: Boolean,
      required: true
    },
    follow: {
      type: [Object, Array],
      default: () => {}
    }
  },
  data () {
    return {
      dialogStatus: this.dialog
    }
  },
  watch: {
    dialog (newValue) {
      this.dialogStatus = newValue
    }
  },
  methods: {
    closeDialog () {
      this.$emit('closeDialog')
    }
  }
}
</script>
