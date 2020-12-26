<template>
  <div>
    <LoggedInNavDrawer />
    <p>
      ストック一覧
    </p>
  </div>
</template>

<script>
import LoggedInNavDrawer from '~/components/organisms/loggedIn/LoggedInNavDrawer.vue'

export default {
  components: {
    LoggedInNavDrawer
  }
}
</script>
