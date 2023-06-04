<script setup>
import * as caseUtils from '@/plugins/caseUtils.js'
import * as roleUtils from '@/plugins/roleUtils.js'
import * as pageUtils from '@/plugins/pageUtils.js'
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
                <v-list-item v-if="roleUtils.isLogin && roleUtils.isManager && !roleUtils.isOfficer"
                    prepend-icon="mdi-account-cog-outline" title="人员管理" value="人员管理" link @click="changeManage('officer')">
                </v-list-item>
                <v-list-item v-if="roleUtils.isLogin && roleUtils.isManager && !roleUtils.isOfficer"
                    prepend-icon="mdi-home-silo-outline" title="辖区管理" value="辖区管理" link @click="changeManage('station')">
                </v-list-item>
                <v-list-item v-if="roleUtils.isLogin && roleUtils.isManager && !roleUtils.isOfficer"
                    prepend-icon="mdi-file-cog-outline" title="案件管理" value="案件管理" link @click="changeManage('cases')">
                </v-list-item>
            </v-list>
        </v-navigation-drawer>
    </div>

    <v-container class="fill-height" style="display: block;">
        <template v-if="manageType == 'officer'">
            <OfficerInfoTable />
            <!-- <v-data-table :headers="headersforofficers" :items="officers">
                <template v-slot:item.o_stat="{ item }">
                    <v-chip :color="getOfficerStaColor(item.columns.o_stat)">
                        {{ item.columns.o_stat }}
                    </v-chip>
                </template>
            </v-data-table> -->
        </template>

        <template v-if="manageType == 'station'">
            <v-data-table :headers="headersforstations" :items="stations">
                <template v-slot:item.s_no="{ item }" class="hoverable">
                    <div @click="pageUtils.goToStationInfoView(this, item.columns.s_no)">{{ item.columns.s_no }}</div>
                </template>
                <template v-slot:item.s_name="{ item }" class="hoverable">
                    <div @click="pageUtils.goToStationInfoView(this, item.columns.s_no)">{{ item.columns.s_name }}</div>
                </template>
            </v-data-table>
        </template>

        <template v-if="manageType == 'cases'">
            <v-data-table :headers="headersforcases" :items="cases">
                <template v-slot:item.c_title="{ item }" class="hoverable">
                    <div @click="pageUtils.goToCaseInfoView(this, item.columns.c_no)">{{ item.columns.c_title }}</div>
                </template>
                <template v-slot:item.c_no="{ item }" class="hoverable">
                    <div @click="pageUtils.goToCaseInfoView(this, item.columns.c_no)">{{ item.columns.c_no }}</div>
                </template>
                <template v-slot:item.c_level="{ item }">
                    <v-chip :color="caseUtils.getLevelColor(item.columns.c_level)">
                        {{ item.columns.c_level }}
                    </v-chip>
                </template>
                <template v-slot:item.c_stat="{ item }">
                    <v-chip :color="caseUtils.getStatusColor(item.columns.c_stat)">
                        {{ item.columns.c_stat }}
                    </v-chip>
                </template>
            </v-data-table>
        </template>

    </v-container>
</template>

<script>
import { VDataTable } from 'vuetify/labs/VDataTable'
import OfficerInfoTable from '@/components/OfficerInfoTable.vue'
export default {
    components: {
        VDataTable,
        OfficerInfoTable,
    },
    data() {
        return {
            manageType: "officer",
            drawer: true,
            rail: true,
            officers: [],
            stations: [],
            cases: [],
            headersforofficers: [
                { title: '警员编号', align: 'start', key: 'o_no', },
                { title: '警员名', align: 'end', key: 'u_name' },
                { title: '性别', align: 'end', key: 'u_sex' },
                { title: '手机号码', align: 'end', key: 'u_phone' },
                { title: '警员状态', align: 'end', key: 'o_stat' },
                { title: '站点编号', align: 'end', key: 's_no' },
                { title: '编辑', key: 'actions', sortable: false },
            ],
            headersforstations: [
                { title: '派出所编号', align: 'start', key: 's_no', },
                { title: '派出所名', align: 'end', key: 's_name' },
                { title: '电话', align: 'end', key: 's_phone' },
                { title: '所在区', align: 'end', key: 's_area' },
                { title: '详细地址', align: 'end', key: 's_address' },
            ],
            headersforcases: [
                { title: '案件编号', align: 'start', key: 'c_no', },
                { title: '案件名称', align: 'start', key: 'c_title', },
                { title: '所在区', align: 'end', key: 'c_area' },
                { title: '详细位置', align: 'end', key: 'c_address' },
                { title: '级别', align: 'end', key: 'c_level' },
                { title: '发生时间', align: 'end', key: 'c_startdate' },
                { title: '结案时间', align: 'end', key: 'c_enddate' },
                { title: '状态', align: 'end', key: 'c_stat' },
                { title: '上报人', align: 'end', key: 'u_no' },
                { title: '负责人', align: 'end', key: 'o_no' },
                { title: '负责辖区', align: 'end', key: 's_no' },
            ],
        }
    },
    methods: {
        getAllData() {
            this.$axios.get('/officer/getAllOfficers').then(res => {
                this.officers = res.data;
            });
            this.$axios.get('/station/getAllStations').then(res => {
                this.stations = res.data;
            });
            this.$axios.get('/case/getAllCases').then(res => {
                console.log(res.data)
                this.cases = res.data;
            });
        },
        changeManage(data) {
            if (data == "officer" || data == "station" || data == "cases")
                this.manageType = data;
        },
        toggleRail() {
            this.rail = !this.rail;
        },
        getOfficerStaColor(o_stat) {
            if (o_stat == '任务中') return 'red'
            else if (o_stat == '空闲') return 'green'
            else return 'orange'
        },
    },
    mounted() {
        roleUtils.checkLoginStatus(this);
        roleUtils.updateRole(this);
        console.log(this.isLogin)
        this.getAllData();
    },
}
</script>

<style>
.login-wrapper {
    position: relative;
}

.login-icon {
    position: absolute;
    top: -24px;
    left: 50%;
    transform: translateX(-50%);
}

.drawer-container {
    flex-grow: 1;
}

.hoverable:hover {
    cursor: pointer;
    /* 修改为您希望的鼠标样式，例如： */
    /* cursor: pointer; */
    /* cursor: grab; */
    /* cursor: crosshair; */
    /* cursor: move; */
    /* cursor: help; */
    /* ... */
}
</style>