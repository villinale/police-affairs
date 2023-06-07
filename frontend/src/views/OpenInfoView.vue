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
                    prepend-icon="mdi-home-silo-outline" title="辖区查看" value="辖区查看" link @click="changeManage('station')">
                </v-list-item>
                <v-list-item v-if="roleUtils.isLogin && roleUtils.isManager && !roleUtils.isOfficer"
                    prepend-icon="mdi-file-cog-outline" title="公开案件查看" value="公开案件查看" link @click="changeManage('cases')">
                </v-list-item>
            </v-list>
        </v-navigation-drawer>
    </div>

    <v-container class="fill-height" style="display: block;">
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
import StationInfoTable from '@/components/table/StationInfoTable.vue'
import CaseInfoTable from '@/components/table/OpenCaseInfoTable.vue'
export default {
    components: {
        VDataTable,
        StationInfoTable,
        CaseInfoTable,
    },
    data() {
        return {
            manageType: "station",
            drawer: true,
            rail: true,
        }
    },
    methods: {
        changeManage(data) {
            if (data == "station" || data == "cases")
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
}
</style>