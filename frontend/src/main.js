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

import axios from 'axios'
import x2js from 'x2js'


axios.defaults.baseURL = "http://127.0.0.1:8080/"
axios.defaults.withCredentials = true

const app = createApp(App)
app.config.globalProperties.$L = L
app.config.globalProperties.$axios = axios
app.config.globalProperties.$x2js = new x2js()

app.use(VueCookies)

registerPlugins(app)

app.mount('#app')
