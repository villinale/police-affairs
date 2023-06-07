<script setup>
import * as caseUtils from '@/plugins/caseUtils.js'
import * as roleUtils from '@/plugins/roleUtils.js'
</script>

<template>
    <Snackbar ref="mychild" />
    <v-container class="fill-height" style="display: block;">
        <v-card>
            <v-card-title>
                <v-row align="center" style="margin-top: auto;">
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
                <v-row style="margin-bottom:20px ;">
                    <v-col align="center" cols="3">
                        <div class="card">
                            <div style="align-items: center;justify-items: center;">
                                <label class="avatar">
                                    <span style="font-size: 20px;color: #1976d2;">
                                        <v-btn variant="text" :icon="'mdi-file-document-check-outline'"></v-btn>
                                    </span>
                                </label>
                                <label class="info">
                                    <span class="info-1">结案总数</span>
                                </label>
                            </div>
                            <div class="content">
                                <div class="content-1">
                                    <countTo :startVal='0' :endVal='statics.closedCases' :duration='3000'></countTo>
                                </div>
                            </div>
                        </div>
                    </v-col>
                    <v-col align="center" cols="3">
                        <div class="card">
                            <label class="avatar">
                                <span style="font-size: 20px;color: #1976d2;">
                                    <v-btn variant="text" :icon="'mdi-file-document-check-outline'"></v-btn>
                                </span>
                            </label>
                            <label class="info">
                                <span class="info-1">案件总数</span>
                            </label>
                            <div class="content">
                                <div class="content-1">
                                    <countTo :startVal='0' :endVal='statics.totalCases' :duration='3000'></countTo>
                                </div>
                            </div>
                        </div>
                    </v-col>
                    <v-col align="center" cols="3">
                        <div class="card-month">
                            <label class="avatar">
                                <span style="font-size: 20px;color: #1976d2;">
                                    <v-btn variant="text" :icon="'mdi-file-document-check-outline'"></v-btn>
                                </span>
                            </label>
                            <label class="info">
                                <span class="info-1">月结案总数</span>
                            </label>
                            <div class="content">
                                <div class="content-1">
                                    <countTo :startVal='0' :endVal='statics.monthClosedCases' :duration='3000'></countTo>
                                </div>
                            </div>
                        </div>
                    </v-col>
                    <v-col align="center" cols="3">
                        <div class="card-month">
                            <label class="avatar">
                                <span style="font-size: 20px;color: #1976d2;">
                                    <v-btn variant="text" :icon="'mdi-file-document-check-outline'"></v-btn>
                                </span>
                            </label>
                            <label class="info">
                                <span class="info-1">月案件总数</span>
                            </label>
                            <div class="content">
                                <div class="content-1">
                                    <countTo :startVal='0' :endVal='statics.monthCases' :duration='3000'></countTo>
                                </div>
                            </div>
                        </div>
                    </v-col>
                </v-row>
                <v-row style="height: 300px;">
                    <DoughnutChart style="height: 270px;" ref="myDoughnutChart" />
                    <v-col style="height: 300px;margin-top:10px;weight:800px;justify-content: center;">
                        <LineChart ref="myLineChart" />
                    </v-col>
                </v-row>
            </v-card-text>
        </v-card>
    </v-container>
</template>

<script>
import countTo from '@/components/count-to';
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
        countTo,
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
            for (let i = 0; i < 7; i++) {
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
    created() {
        roleUtils.checkLoginStatus(this);
        roleUtils.updateRole(this);
        this.getStationInfo();
    },
    mounted() {
        roleUtils.checkLoginStatus(this);
        roleUtils.updateRole(this);
        this.getStationInfo();
    },
};
</script>
<style scoped>
.card {
    width: 190px;
    height: 180px;
    border-radius: 5px;
    background: lightgrey;
    background: linear-gradient(145deg, #f6f6f6, #dfecf6);
    box-shadow: 2px 3px 3px #d5d9ed,
        2px 3px 3px #e2f0fb;
}

.card-month {
    width: 190px;
    height: 180px;
    border-radius: 5px;
    background: lightgrey;
    background: linear-gradient(145deg, #f6f6f6, #b8d8ef);
    box-shadow: 2px 3px 3px #d5d9ed,
        2px 3px 3px #e2f0fb;
}

.avatar {
    width: 45px;
    height: 45px;
    display: inline-block;
    background-color: rgba(255, 255, 255, 0.9);
    margin: 30px 10px 10px 10px;
    border-radius: 14px;
}

.info {
    display: inline-block;
    vertical-align: top;
    margin-top: 40px;
    width: 120px;
    justify-content: center;
    align-items: left;
}

.info-1 {
    display: inline-block;
    font-size: 23px;
    width: 100%;
    display: flex;
    color: rgb(102, 102, 102);
}

.content {
    height: 50%;
    display: flex;
    justify-content: center;
    align-items: center;
}

.content-1 {
    height: 40px;
    margin: auto;
    font-size: 60px;
    color: #1a237e;
}
</style>
