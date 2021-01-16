<template>
  <div class="add-link-box">
    <v-card-title>
      <h3>
        URLを追加
      </h3>
    </v-card-title>

    <ValidationProvider
      v-slot="{ errors }"
      :rules="rules"
      :name="$attrs.label"
    >
      <div class="url-input">
        <input
          v-model="firstUrlForVeeValidate"
          type="text"
          placeholder="1つ目のURLは必須項目です"
          @input="$emit('update:firstUrl', $event.target.value)"
        >
        <div class="error-message">
          {{ errors[0] }}
        </div>
      </div>
    </ValidationProvider>

    <ValidationProvider
      v-slot="{ errors }"
      :rules="rules"
      :name="$attrs.label"
    >
      <div class="url-input">
        <input
          v-model="secondUrlForVeeValidate"
          type="text"
          placeholder="2つ目は添付しなくても良い"
          @input="$emit('update:secondUrl', $event.target.value)"
        >
        <div class="error-message">
          {{ errors[0] }}
        </div>
      </div>
    </ValidationProvider>

    <ValidationProvider
      v-slot="{ errors }"
      :rules="rules"
      :name="$attrs.label"
    >
      <div class="url-input">
        <input
          v-model="thirdUrlForVeeValidate"
          type="text"
          placeholder="3つ目も添付しなくても良い"
          @input="$emit('update:thirdUrl', $event.target.value)"
        >
        <div class="error-message">
          {{ errors[0] }}
        </div>
      </div>
    </ValidationProvider>
  </div>
</template>

<script>
export default {
  props: {
    rules: {
      type: [Object, String],
      required: true
    },
    firstUrl: {
      type: String,
      default: ''
    },
    secondUrl: {
      type: String,
      default: ''
    },
    thirdUrl: {
      type: String,
      default: ''
    }
  },
  data () {
    return {
      firstUrlForVeeValidate: this.firstUrl,
      secondUrlForVeeValidate: this.secondUrl,
      thirdUrlForVeeValidate: this.thirdUrl
    }
  },
  watch: {
  }
}
</script>
