<template>
    <Dashboard />
    <v-card class="mx-auto pe-continer" max-width="400">
        <v-card-title class="primary">
            <span class="pe-header-text">用户信息</span>
        </v-card-title>
        <v-card-text>
            <v-list dense>
                <v-list-item>
                    <v-list-item-content>
                        <v-list-item-title class="font-weight-bold">姓名:</v-list-item-title>
                        <v-list-item-subtitle>{{ userInfo.u_name }}</v-list-item-subtitle>
                    </v-list-item-content>
                </v-list-item>
                <v-list-item>
                    <v-list-item-content>
                        <v-list-item-title class="font-weight-bold">性别:</v-list-item-title>
                        <v-list-item-subtitle>{{ userInfo.u_sex }}</v-list-item-subtitle>
                    </v-list-item-content>
                </v-list-item>
                <v-list-item>
                    <v-list-item-content>
                        <v-list-item-title class="font-weight-bold">手机号:</v-list-item-title>
                        <v-list-item-subtitle>{{ userInfo.u_phone }}</v-list-item-subtitle>
                    </v-list-item-content>
                </v-list-item>
                <v-list-item>
                    <v-list-item-content>
                        <v-list-item-title class="font-weight-bold">身份:</v-list-item-title>
                        <v-list-item-subtitle>{{ userInfo.u_role }}</v-list-item-subtitle>
                    </v-list-item-content>
                </v-list-item>
            </v-list>
        </v-card-text>
    </v-card>
</template>
  
<script>
import Dashboard from '../components/DashBoardInPersonal.vue';

//TODO:界面美化
export default {
    components: {
        Dashboard
    },
    data() {
        return {
            uid: this.$cookies.get('userid'),
            userInfo: {
                u_no: 0,
                u_role: '',
                u_name: '',
                u_psw: '',
                u_sex: '',
                u_phone: ''
            }
        };
    },
    created() {
        if (this.uid) {
            this.$axios
                .get(`/user/getUserInfoById/` + this.uid)
                .then(res => {
                    console.log(res.data);
                    this.userInfo = res.data;
                })
                .catch(err => {
                    console.log(err);
                });
        }
    }
};
</script>
  
<style scoped>
.pe-continer {
    margin-top: 20px;
    display: contents;
}

.primary {
    background-color: #1976d2;
}

.pe-header-text {
    font-size: 20px;
    color: white;
}

.font-weight-bold {
    font-weight: bold;
}
</style>
  