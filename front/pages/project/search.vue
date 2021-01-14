<template>
  <div>
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
  }
}
</script>
