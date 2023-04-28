/**
 * main.js
 *
 * Bootstraps Vuetify and other plugins then mounts the App`
 */

// Components
import App from './App.vue'

// Composables
import { createApp } from 'vue'

// Plugins
import { registerPlugins } from '@/plugins'

//vue-coolkies引入
import VueCookies from 'vue-cookies'

//leaflet引入
import 'leaflet/dist/leaflet.css'
// 引入Leaflet对象 挂载到Vue上，便于全局使用，也可以单独页面中单独引用
import * as L from 'leaflet'


const app = createApp(App)


registerPlugins(app)

app.mount('#app')
app.use(VueCookies)
app.config.globalProperties.$L = L