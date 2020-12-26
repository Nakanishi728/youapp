<template>
  <v-dialog
    v-model="dialogStatus"
    max-width="500px"
    persistent
  >
    <v-card width="500px" class="mx-auto">
      <v-toolbar flat>
        <v-toolbar-title>
          編集
        </v-toolbar-title>
        <v-spacer />
        <v-btn
          icon
          @click="closeDialog"
        >
          <v-icon>mdi-close</v-icon>
        </v-btn>
      </v-toolbar>
      <v-form>
        <ValidationObserver ref="obs" v-slot="{ invalid }">
          <div class="post-edit-box mt-2 pa-3">
            <TextField
              v-model="viewTitle"
              label="タイトル"
              rules="max:50|required"
            />
            <AddLink
              rules="regex:https?://([\w-]+\.)+[\w-]+(/[\w- .?%&=]*)?"
              label="URL"
              :firstUrl.sync="firstUrl"
              :secondUrl.sync="secondUrl"
              :thirdUrl.sync="thirdUrl"
            />
            <TextArea
              v-model="viewPoint"
              label="説明"
              rules="max:140|required"
              :counter="140"
            />
            <v-row justify="center">
              <v-btn
                color="light-blue lighten-3"
                class="white--text"
                :disabled="invalid"
                @click="updatePost"
              >
                編集
              </v-btn>
            </v-row>
          </div>
        </ValidationObserver>
      </v-form>
    </v-card>
  </v-dialog>
</template>

<script>
import axios from '@/plugins/axios'
import TextField from '~/components/atoms/TextField.vue'
import TextArea from '~/components/atoms/TextArea.vue'
import AddLink from '~/components/molecules/AddLink.vue'

export default {
  components: {
    TextField,
    TextArea,
    AddLink
  },
  props: {
    dialog: {
      type: Boolean,
      required: true
    },
    title: {
      type: String,
      required: true
    },
    links: {
      type: Array,
      required: true
    },
    point: {
      type: String,
      required: true
    },
    currentUser: {
      type: null,
      required: true
    }
  },
  data () {
    return {
      dialogStatus: this.dialog,
      patchForTitle: '',
      patchForPoint: '',
      patchForTFirstUrl: '',
      patchForTSecondUrl: '',
      patchForTThirdUrl: ''
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
    },
    updatePost () {
      this.$store.commit('setLoading', true)
      axios
        .patch(`/v1/posts/${this.$route.params.id}`, {
          title: this.patchForTitle,
          user_id: this.currentUser.id,
          links: this.editLinks,
          point: this.patchForPoint
        })
        .then((res) => {
          this.$store.commit('setLoading', false)
          this.$store.commit('setFlash', {
            status: true,
            message: '投稿を編集しました'
          })
          setTimeout(() => {
            this.$store.commit('setFlash', {})
          }, 2000)
          this.$router.replace('/')
        })
    }
  }
}
</script>
