<template>
    <v-app-bar app color="primary" dark>
        <router-link to="/" class="title">
            <v-toolbar-title>城市犯罪管理平台</v-toolbar-title>
        </router-link>
        <v-spacer></v-spacer>
        <v-btn text>信息查看</v-btn>
        <v-btn v-if="isManager" @click="goToManage" text>人员管理</v-btn>
        <v-btn @click="goToPerson" text>个人主页</v-btn>
    </v-app-bar>
</template>

<script>
export default {
    data() {
        return {
            isLogin: true,
            isManager: false,
            isOfficer: false,
        };
    },
    methods: {
        checkLoginStatus() {
            if (this.$cookies.get("userid") != null) {
                this.isLogin = true;
            }
            console.log(this.isLogin);
        },
        updateRole() {
            if (this.$cookies.get("role") == "管理员") {
                this.isManager = true;
            } else if (this.$cookies.get("role") == "警员") {
                this.isOfficer = true;
            }
        },
        goToPerson() {
            this.$router.push('/person');
        },
        goToManage() {
            this.$router.push('/manage');
        }
    },
    mounted() {
        this.checkLoginStatus();
        this.updateRole();
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
