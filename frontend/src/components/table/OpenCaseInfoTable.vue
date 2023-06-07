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
                所有案件信息
                <v-spacer></v-spacer>
                <v-text-field v-model="search" append-icon="mdi-magnify" label="Search" single-line
                    hide-details></v-text-field>
            </v-card-title>

            <v-data-table :headers="headersforcases" :items="cases" :search="search">

                <template v-slot:item.c_title="{ item }" class="hoverable">
                    <div @click="pageUtils.goToCaseInfoView(this, item.columns.c_no)">{{ item.columns.c_title }}</div>
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
            search: '',
            uid: this.$cookies.get('userid'),
            cases: [],
            headersforcases: [
                { title: '案件名称', align: 'start', key: 'c_title', },
                { title: '所在区', align: 'end', key: 'c_area' },
                { title: '详细位置', align: 'end', key: 'c_address' },
                { title: '级别', align: 'end', key: 'c_level' },
                { title: '发生时间', align: 'end', key: 'c_startdate' },
                { title: '结案时间', align: 'end', key: 'c_enddate' },
                { title: '状态', align: 'end', key: 'c_stat' },
                { title: '负责辖区', align: 'end', key: 's_no' },
            ],
        }
    },
    watch: {
    },
    methods: {
        getAllData() {
            this.$axios.get('/case/getAllOpenClosedCases').then(res => {
                console.log(res.data)
                this.cases = res.data;
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
}
</style>