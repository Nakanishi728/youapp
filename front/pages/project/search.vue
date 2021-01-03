<template>
  <div>
    <LoggedInNavDrawer />
    <keep-alive>
      <SearchForm />
    </keep-alive>
  </div>
</template>

<script>
import SearchForm from '~/components/atoms/SearchForm.vue'

export default {
  components: {
    SearchForm
  }
}
</script>
