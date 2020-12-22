<template>
  <ValidationProvider
    v-slot="{ errors, valid }"
    :name="$attrs.label"
    :rules="rules"
  >
    <v-file-input
      v-model="inputValue"
      :label="$attrs.label"
      :error-messages="errors"
      :success="valid"
      v-bind="$attrs"
      v-on="$listeners"
    />
  </ValidationProvider>
</template>

<script>
export default {
  props: {
    rules: {
      type: [Object, String],
      required: true
    },
    value: {
      type: null,
      required: true
    }
  },
  data () {
    return {
    }
  },
  computed: {
    inputValue: {
      get () {
        return this.value
      },
      set (value) {
        this.$emit('input', value)
      }
    }
  }
}
</script>
