<!--
 * @Author: yingxin wang
 * @Date: 2023-04-28 09:57:01
 * @LastEditors: yingxin wang
 * @LastEditTime: 2023-04-28 20:28:52
 * @Description: 默认样式，有一个导航栏，一个主体
-->
<template>
  <v-app>
    <default-bar />

    <v-main>
      <router-view />
    </v-main>
  </v-app>
</template>

<script setup>
import DefaultBar from '../components/AppBarItem.vue'
</script>
