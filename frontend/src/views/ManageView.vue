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
                <v-list-item v-if="isLogin && isManager && !isOfficer" prepend-icon="mdi-account-cog-outline" title="人员管理"
                    value="人员管理" link @click="changeManage('officer')">
                </v-list-item>
                <v-list-item v-if="isLogin && isManager && !isOfficer" prepend-icon="mdi-home-map-marker" title="辖区管理"
                    value="辖区管理" link @click="changeManage('station')">
                </v-list-item>
                <v-list-item v-if="isLogin && isManager && !isOfficer" prepend-icon="mdi-home-map-marker" title="案件管理"
                    value="案件管理" link @click="changeManage('station')">
                </v-list-item>
            </v-list>
        </v-navigation-drawer>
    </div>
    <v-container class="fill-height" style="display: block;">
        <template v-if="manageType == 'officer'">
            <v-data-table :headers="headersforofficers" :items="officers">
                <template v-slot:item.o_stat="{ item }">
                    <v-chip :color="getColor(item.columns.o_stat)">
                        {{ item.columns.o_stat }}
                    </v-chip>
                </template>
            </v-data-table>
        </template>


        <template v-if="manageType == 'station'">
            <v-data-table :headers="headersforstations" :items="stations">
            </v-data-table>
        </template>
    </v-container>
</template>

<script>
import { VDataTable } from 'vuetify/labs/VDataTable'
import * as roleUtils from '@/plugins/roleUtils.js'
export default {
    components: {
        VDataTable,
        roleUtils,
    },
    data() {
        return {
            manageType: "officer",
            drawer: true,
            rail: true,
            isLogin: false,
            isManager: false,
            isOfficer: false,
            officers: [],
            stations: [],
            headersforofficers: [
                { title: '警员编号', align: 'start', key: 'o_no', },
                { title: '警员名', align: 'end', key: 'u_name' },
                { title: '性别', align: 'end', key: 'u_sex' },
                { title: '手机号码', align: 'end', key: 'u_phone' },
                { title: '警员状态', align: 'end', key: 'o_stat' },
                { title: '站点编号', align: 'end', key: 's_no' },
            ],
            headersforstations: [
                { title: '派出所编号', align: 'start', key: 's_no', },
                { title: '派出所名', align: 'end', key: 's_name' },
                { title: '电话', align: 'end', key: 's_phone' },
                { title: '所在区', align: 'end', key: 's_area' },
                { title: '详细地址', align: 'end', key: 's_address' },
            ],
        }
    },
    methods: {
        getAllData() {
            this.$axios.get('/officer/getAllOfficers').then(res => {
                this.officers = res.data;
            });
            this.$axios.get('/station/getAllStations').then(res => {
                console.log(res.data)
                this.stations = res.data;
            });
        },
        changeManage(data) {
            if (data == "officer" || data == "station")
                this.manageType = data;
        },
        toggleRail() {
            this.rail = !this.rail;
        },
        getColor(o_stat) {
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
</style>