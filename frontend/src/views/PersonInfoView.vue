<script setup>
import * as roleUtils from '@/plugins/roleUtils.js'
</script>

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
                <v-list-item v-if="roleUtils.isLogin" @click="changeManage('personInfo')" prepend-icon=" mdi-account"
                    title="个人信息" value="个人信息" link>
                </v-list-item>
                <v-list-item v-if="roleUtils.isLogin" @click="changeManage('casesInfo')" prepend-icon="mdi-file"
                    title="我的案件" value="我的案件" link>
                </v-list-item>
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
        <CaseCards v-if="(manageType == 'casesInfo') && (!roleUtils.isOfficer)" :casesInfoList="casesInfo" />
        <CaseInfoTable v-if="(manageType == 'casesInfo') && (roleUtils.isOfficer)" ref="myCaseInfoTable" />
    </div>
</template>
  
<script>
import UserInfoCard from "@/components/UserInfoCard.vue";
import CaseCards from "@/components/CaseCards.vue";
import CaseInfoTable from '@/components/table/CaseInfoTable.vue';

export default {
    components: {
        UserInfoCard,
        CaseCards,
        CaseInfoTable,
    },
    data() {
        return {
            manageType: "personInfo",
            drawer: true,
            rail: true,
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
            this.$router.replace("/");
        },
    },
    created() {
        roleUtils.checkLoginStatus(this);
        roleUtils.updateRole(this);
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
            if (!roleUtils.isOfficer)
                this.$axios
                    .get(`/case/getUserCasesByUId/` + this.uid + '/' + roleUtils.isOfficer)
                    .then(res => {
                        this.casesInfo = res.data;
                        console.log(this.casesInfo);
                    })
                    .catch(err => {
                        console.log(err);
                    });
        }
    },
    mounted() {
    },
};
</script>
  
<style scoped>
.drawer-container {
    flex-grow: 1;
}
</style>
  