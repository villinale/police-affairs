<!--
 * @Author: yingxin wang
 * @Date: 2023-04-24 13:53:02
 * @LastEditors: yingxin wang
 * @LastEditTime: 2023-04-28 22:07:44
 * @Description: 顶部导航栏
-->
<template>
  <v-app-bar app color="primary" dark>
    <router-link to="/" class="title">
      <v-toolbar-title>智慧交通警务系统</v-toolbar-title>
    </router-link>
    <v-spacer></v-spacer>
    <v-btn text>个人主页</v-btn>
    <v-btn text>信息查看</v-btn>
  </v-app-bar>
</template>

<script>
export default {
  data() {
  },
}
</script>

<style>
.title {
  margin-left: 30px;
  text-decoration: none;
  color: white;
  font-family: 'Noto Sans SC', sans-serif;
}
</style>
