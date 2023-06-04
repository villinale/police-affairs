<template>
    <div class="drawer-container">
        <v-navigation-drawer v-model="drawer" :rail="rail" permanent @click="rail = false">
            <v-list dense>
                <v-list-item nav>
                    <template v-slot:append>
                        <v-btn variant="text" :icon="rail ? 'mdi-chevron-right' : 'mdi-chevron-left'"
                            @click.stop="toggleRail"></v-btn>
                    </template>
                </v-list-item>
                <v-list-item v-if="isLogin" @click="changeManage('personInfo')" prepend-icon=" mdi-account" title="个人信息"
                    value="个人信息" link>
                </v-list-item>
                <v-list-item v-if="isLogin && !isManager && !isOfficer" @click="changeManage('casesInfo')"
                    prepend-icon="mdi-file" title="我的报案" value="我的报案" link>
                </v-list-item>
                <v-list-item v-if="isLogin && !isManager && isOfficer" prepend-icon="mdi-checkbox-marked-circle-outline"
                    title="我的案件" value="我的案件" link> </v-list-item>
            </v-list>

            <template v-if="!rail" v-slot:append>
                <div class="pa-2">
                    <v-btn prepend-icon="mdi-logout" block @click="logout">
                        退出
                    </v-btn>
                </div>
            </template>
        </v-navigation-drawer>
    </div>
    <div>
        <user-info-card v-if="manageType == 'personInfo'" :user-info="userInfo" />
        <CaseCards v-if="manageType == 'casesInfo'" :casesInfoList="casesInfo" />
    </div>
</template>
  
<script>
import * as roleUtils from '@/plugins/roleUtils.js'
import UserInfoCard from "@/components/UserInfoCard.vue";
import CaseCards from "@/components/CaseCards.vue";

//TODO:界面美化
export default {
    components: {
        roleUtils,
        UserInfoCard,
        CaseCards,
    },
    data() {
        return {
            manageType: "personInfo",
            drawer: true,
            rail: true,
            isLogin: true,
            isManager: false,
            isOfficer: false,
            uid: this.$cookies.get('userid'),
            userInfo: {},
            casesInfo: {},
        };
    },
    methods: {
        changeManage(data) {
            if (data == "personInfo" || data == "casesInfo")
                this.manageType = data;
        },
        toggleRail() {
            this.rail = !this.rail;
        },
        logout() {
            this.$cookies.remove("userid");
            this.$cookies.remove("role");
            this.$cookies.remove('name');
            this.$router.push("/");
        },
    },
    mounted() {
        roleUtils.checkLoginStatus(this);
        roleUtils.updateRole(this);
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
            this.$axios
                .get(`/case/getUserCasesByUId/` + this.uid)
                .then(res => {
                    this.casesInfo = res.data;
                    console.log(this.casesInfo);
                })
                .catch(err => {
                    console.log(err);
                });
        }
    }
};
</script>
  
<style scoped>
.drawer-container {
    flex-grow: 1;
}
</style>
  