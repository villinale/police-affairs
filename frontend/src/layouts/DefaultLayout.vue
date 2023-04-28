<!--
 * @Author: yingxin wang
 * @Date: 2023-04-28 09:57:01
 * @LastEditors: yingxin wang
 * @LastEditTime: 2023-04-28 20:28:52
 * @Description: 请填写简介
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
