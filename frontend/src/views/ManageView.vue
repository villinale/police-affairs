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
        </template>

        <template v-if="manageType == 'station'">
            <StationInfoTable />
        </template>

        <template v-if="manageType == 'cases'">
            <CaseInfoTable />
        </template>

    </v-container>
</template>

<script>
import { VDataTable } from 'vuetify/labs/VDataTable'
import OfficerInfoTable from '@/components/OfficerInfoTable.vue'
import StationInfoTable from '@/components/StationInfoTable.vue'
import CaseInfoTable from '@/components/CaseInfoTable.vue'
export default {
    components: {
        VDataTable,
        OfficerInfoTable,
        StationInfoTable,
        CaseInfoTable,
    },
    data() {
        return {
            manageType: "officer",
            drawer: true,
            rail: true,
            cases: [],
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