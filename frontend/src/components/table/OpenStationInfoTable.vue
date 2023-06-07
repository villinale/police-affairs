<script setup>
import * as caseUtils from '@/plugins/caseUtils.js'
import * as roleUtils from '@/plugins/roleUtils.js'
import * as pageUtils from '@/plugins/pageUtils.js'
</script>

<template>
    <Snackbar ref="mychild" />
    <v-container class="fill-height" style="display: block;">
        <v-card>
            <v-card-title>
                所有辖区信息
                <v-spacer></v-spacer>
                <v-text-field v-model="search" append-icon="mdi-magnify" label="Search" single-line
                    hide-details></v-text-field>
            </v-card-title>

            <v-data-table :headers="headersforstations" :items="stations" :search="search">

                <template v-slot:item.s_no="{ item }" class="hoverable">
                    <div @click="pageUtils.goToStationInfoView(this, item.columns.s_no)">{{ item.columns.s_no }}</div>
                </template>
                <template v-slot:item.s_name="{ item }" class="hoverable">
                    <div @click="pageUtils.goToStationInfoView(this, item.columns.s_no)">{{ item.columns.s_name }}</div>
                </template>
            </v-data-table>
        </v-card>
    </v-container>
</template>

<script>
import { VDataTable } from 'vuetify/labs/VDataTable'
import Snackbar from '@/components/Snackbar.vue';
export default {
    components: {
        VDataTable,
        Snackbar
    },
    data() {
        return {
            search: "",
            stations: [],
            headersforstations: [
                { title: '派出所编号', align: 'start', key: 's_no', },
                { title: '派出所名', align: 'end', key: 's_name' },
                { title: '电话', align: 'end', key: 's_phone' },
                { title: '所在区', align: 'end', key: 's_area' },
                { title: '详细地址', align: 'end', key: 's_address' },
            ],
        }
    },
    watch: {
    },
    methods: {
        getAllData() {
            this.$axios.get('/station/getAllStations').then(res => {
                console.log(res.data);
                this.stations = res.data;
            });
        },
    },
    mounted() {
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