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
                        <span v-if="(!roleUtils.isManager) && (!roleUtils.isOfficer)" class="pe-header-text">您上报的案件数</span>
                        <span v-if="roleUtils.isOfficer" class="pe-header-text">您负责的案件数</span>
                    </v-card-title>
                    <v-card-text class="case-count">
                        <span class="closed-cases">{{ statics.closedCases }}</span>
                        <span class="divider">/</span>
                        <span class="total-cases">{{ statics.totalCases }}</span>
                    </v-card-text>
                    <v-card-text class="fo-case-count">
                        <span class="fo-closed-cases">结案数</span>
                        <span class="fo-divider">/</span>
                        <span class="fo-total-cases">总案件数</span>
                    </v-card-text>
                    <v-card-text class="fo-case-count">
                        <span style="font-size: 20px;color: #1976d2;">感谢您的付出
                            <v-btn variant="text" :icon="'mdi-hand-heart-outline'"></v-btn>
                        </span>
                    </v-card-text>

                </v-card>

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

                <v-card v-if="manageType == 'personInfo'" class=" mx-auto pe-continer" max-width="1000" min-width="1000">
                    <v-card-title class="primary">
                        <span class="pe-header-text">近七天结案量</span>
                    </v-card-title>
                    <v-card-text>
                        <v-row style="height: 300px;margin-top:10px;weight:1000px;justify-content: center;">
                            <LineChart ref="myLineChart" />
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
import LineChart from '@/components/chart/LineChart.vue';

export default {
    components: {
        UserInfoCard,
        CaseCards,
        CaseInfoTable,
        DoughnutChart,
        LineChart,
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
            var title = `未结案数 vs 结案数`;
            this.$refs.myDoughnutChart.createChart(labels, data, backgroundColor, title);
        },
        setLineChart() {
            var labels = [];
            var newCases = [];
            var closeCases = [];
            for (let i = 0; i < 6; i++) {
                labels.push(this.statics.dailyNewCases[i].key);
                newCases.push(this.statics.dailyNewCases[i].value);
                closeCases.push(this.statics.dailyClosedCases[i].value);
            }
            var datasets = [
                {
                    label: '新增案件数',
                    data: newCases,
                    borderColor: 'rgba(26, 34, 127, 0.63)',
                    fill: false,
                },
                {
                    label: '新增结案数',
                    data: closeCases,
                    borderColor: 'rgba(187, 222, 251, 0.63)',
                    fill: false,
                },
            ];
            var title = '近7日案件数统计';
            this.$refs.myLineChart.createChart(labels, datasets, title);
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
                            this.setLineChart();
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

.case-count {
    margin-top: 20px;
    text-align: center;
    display: flex;
    align-items: center;
    justify-content: center;
    line-height: unset;
}

.closed-cases {
    font-weight: bold;
    font-size: 60px;
}

.divider {
    font-size: 40px;
    margin: 0 20px;
    color: #000000;
}

.total-cases {
    font-weight: bold;
    font-size: 60px;
}

.fo-case-count {
    text-align: center;
    display: flex;
    align-items: center;
    justify-content: center;
    line-height: unset;
}

.fo-closed-cases {
    font-size: 27px;
    color: #484848;
}

.fo-divider {
    font-size: 26px;
    margin: 0 15px;
    color: #484848;
}

.fo-total-cases {
    font-size: 27px;
    color: #484848;
}
</style>
  