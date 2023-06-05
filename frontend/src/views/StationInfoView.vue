<script setup>
import * as caseUtils from '@/plugins/caseUtils.js'
import * as roleUtils from '@/plugins/roleUtils.js'
</script>

<template>
    <Snackbar ref="mychild" />
    <v-container class="fill-height" style="display: block;">
        <v-card>
            <v-card-title>
                <v-row align="center" style="margin: auto;">
                    <h2>NO.{{ stationinfo.s_no }} {{ stationinfo.s_name }}</h2>
                </v-row>
            </v-card-title>
            <MapShowItem ref="myMapShowItem" style="margin-top:20px;margin-bottom:20px;">
            </MapShowItem>
            <v-card-text>
                <v-row>
                    <v-col cols="3">
                        <v-text-field v-model="stationinfo.s_area" label="行政区划" readonly></v-text-field>
                    </v-col>
                    <v-col cols="6">
                        <v-text-field v-model="stationinfo.s_address" label="具体位置" readonly></v-text-field>
                    </v-col>
                    <v-col cols="3">
                        <v-text-field v-model="stationinfo.s_phone" label="联系方式" readonly></v-text-field>
                    </v-col>
                </v-row>
                <v-row style="height: 250px;">
                    <DoughnutChart ref="myDoughnutChart" />
                    <LineChart ref="myLineChart" />
                </v-row>
            </v-card-text>
        </v-card>
    </v-container>
</template>

<script>
import MapShowItem from '@/components/MapShowItem.vue'
import Snackbar from '@/components/Snackbar.vue';
import DoughnutChart from '@/components/chart/DoughnutChart.vue';
import LineChart from '@/components/chart/LineChart.vue';

export default {
    components: {
        MapShowItem,
        Snackbar,
        DoughnutChart,
        LineChart,
    },
    data() {
        return {
            stationinfo: {},
            sid: this.$route.params.sid,
            statics: {},
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
        setLineChart() {
            var labels = [];
            var newCases = [];
            var closeCases = [];
            for (let i = 0; i < 6; i++) {
                labels.push(this.statics.dailyNewCases[i].key);
                newCases.push(this.statics.dailyNewCases[i].value);
                closeCases.push(this.statics.dailyClosedCases[i].value);
            }
            console.log(labels);
            console.log(newCases);
            console.log(closeCases);
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
        async getStationInfo() {
            if (this.sid) {
                this.$axios
                    .get(`/station/getStationByNo`, {
                        params: {
                            s_no: this.sid,
                        },
                    })
                    .then((response) => {
                        this.stationinfo = response.data;
                        this.$refs.myMapShowItem.initMap(this.stationinfo.s_lon, this.stationinfo.s_lat, this.stationinfo.s_address);

                        this.$axios
                            .get(`/case/getStatisticsBySNo/` + this.sid)
                            .then((response) => {
                                console.log(response.data);

                                this.statics = response.data;
                                this.setDoughnutChart();
                                this.setLineChart();
                            }).catch((error) => {
                                console.log(error.response)
                            });
                    }).catch((error) => {
                        console.log(error.response)
                    });
            }
        },
        getLoc(data) {
            this.loc = data;
        },
    },
    mounted() {
        roleUtils.checkLoginStatus(this);
        roleUtils.updateRole(this);
        this.getStationInfo();
    },
};
</script>
<style scoped>
.t {
    color: rgba(26, 34, 127, 0.63);
}
</style>
