import Vue from 'vue'
import vueNotVisible from 'vue-not-visible'

/* const BREAKPOINTS = {
    mobile: 425,
    tablet: 768,
    tablet_landscape: 1024,
    desktop: 1200,
    desktop_large: 1440,
    hd: 1920,
}
*/
Vue.use(vueNotVisible, { tablet: 960 })
