/*
 * @Author: yingxin wang
 * @Date: 2023-04-24 13:53:02
 * @LastEditors: yingxin wang
 * @LastEditTime: 2023-04-25 20:40:55
 * @Description: 请填写简介
 */
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

import Vue from 'vue'
import VueCookies from 'vue-cookies'

const app = createApp(App)

registerPlugins(app)

app.mount('#app')
Vue.use(VueCookies)
this.$cookies.config('1d')
