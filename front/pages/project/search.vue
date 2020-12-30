<template>
  <div>
    <LoggedInNavDrawer />
    <keep-alive>
      <SearchForm />
    </keep-alive>
  </div>
</template>

<script>
import LoggedInNavDrawer from '~/components/organisms/loggedIn/LoggedInNavDrawer.vue'
import SearchForm from '~/components/atoms/SearchForm.vue'

export default {
  components: {
    LoggedInNavDrawer,
    SearchForm
  }
}
</script>
