<script setup>
import * as pageUtils from '@/plugins/pageUtils.js'
import * as roleUtils from '@/plugins/roleUtils.js'
</script>

<template>
    <v-app-bar app color="primary" dark>
        <router-link to="/" class="title">
            <v-toolbar-title>智慧警务平台</v-toolbar-title>
        </router-link>
        <v-spacer></v-spacer>
        <div v-if="isHome && roleUtils.isLogin" style="margin-right: 10px;">
            <v-btn variant="text" :icon="'mdi-account-tie'"></v-btn>欢迎你，{{ username }}
        </div>
        <div v-if="!isHome">
            <v-btn text @click="pageUtils.goToOpenInfo(this)">信息公开</v-btn>
            <v-btn v-if="roleUtils.isManager" @click="pageUtils.goToManage(this)" text>信息管理</v-btn>
            <v-btn v-if="roleUtils.isLogin" @click="pageUtils.goToPerson(this)" text>个人主页</v-btn>
        </div>
    </v-app-bar>
</template>

<script>
export default {
    data() {
        return {
            username: this.$cookies.get("name"),
            isHome: true,
        };
    },
    methods: {
        setIsHome(isHome) {
            this.isHome = isHome;
        },
    },
    watch: {
        $route(to, from) {
            let that = this;
            if (to.path != from.path) {
                that.isHome = (that.$route.path == "/");
            }
        }
    },
    mounted() {
        this.isHome = (this.$route.path == "/");
    },
    create() {
        roleUtils.checkLoginStatus(this);
        roleUtils.updateRole(this);
        this.isHome = (this.$route.path == "/");
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
