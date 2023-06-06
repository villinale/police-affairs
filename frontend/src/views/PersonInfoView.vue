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
        <v-container>
            <v-row>
                <UserInfoCard v-if="manageType == 'personInfo'" :user-info="userInfo" />

                <v-card v-if="manageType == 'personInfo'" class=" mx-auto pe-continer" max-width="400" min-width="350">
                    <v-card-title class="primary">
                        <span class="pe-header-text">结案量</span>
                    </v-card-title>
                    <v-card-text>
                        <v-row style="height: 270px;margin-top: 10px;justify-content: center;">
                            <DoughnutChart ref="myDoughnutChart" />
                        </v-row>
                    </v-card-text>
                </v-card>

            </v-row>
        </v-container>

        <CaseCards v-if="(manageType == 'casesInfo') && (!roleUtils.isOfficer)" :casesInfoList="casesInfo" />

        <CaseInfoTable v-if="(manageType == 'casesInfo') && (roleUtils.isOfficer)" ref="myCaseInfoTable" />
    </div>
</template>
  
<script>
import UserInfoCard from "@/components/UserInfoCard.vue";
import CaseCards from "@/components/CaseCards.vue";
import DoughnutChart from '@/components/chart/DoughnutChart.vue';
import CaseInfoTable from '@/components/table/CaseInfoTable.vue';

export default {
    components: {
        UserInfoCard,
        CaseCards,
        CaseInfoTable,
        DoughnutChart,
    },
    data() {
        return {
            manageType: "personInfo",
            drawer: true,
            rail: true,
            uid: this.$cookies.get('userid'),
            userInfo: {},
            casesInfo: {},
            statics: [],
        };
    },
    methods: {
        setDoughnutChart() {
            var labels = ['结案数', '未结案数'];
            var data = [this.statics.closedCases, this.statics.totalCases - this.statics.closedCases];
            var backgroundColor = ['#1A237E', '#BBDEFB'];
            var title = `结案数 vs 案件数\n比例: ${this.statics.closedRatio}`;
            this.$refs.myDoughnutChart.createChart(labels, data, backgroundColor, title);
        },
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
    mounted() {
        console.log(this.uid);
        if (this.uid) {
            this.$axios
                .get(`/user/getUserInfoById/` + this.uid)
                .then(res => {
                    console.log(res.data);
                    this.userInfo = res.data;
                    this.$axios
                        .get(`/case/getStatisticsByUNo/` + this.uid + '/' + roleUtils.isOfficer)
                        .then((response) => {
                            console.log(response.data);

                            this.statics = response.data;
                            this.setDoughnutChart();
                        }).catch((error) => {
                            console.log(error.response)
                        });
                })
                .catch(err => {
                    console.log(err);
                });
            if (!(roleUtils.isOfficer)) {
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
        }
    },
    created() {
        roleUtils.checkLoginStatus(this);
        roleUtils.updateRole(this);
    },
};
</script>
  
<style scoped>
.drawer-container {
    flex-grow: 1;
}

.pe-continer {
    margin-top: 20px;
}

.primary {
    background-color: #1976d2;
    align-content: center;
    justify-content: center;
    display: flex;
    flex-wrap: wrap;
}

.pe-header-text {
    font-size: 20px;
    color: white;
}
</style>
  