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
                <v-caseinfo ref="caseinfo">
                    <v-row align="center">
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
                    <v-row>
                        <DoughnutChart />
                    </v-row>
                </v-caseinfo>
            </v-card-text>
        </v-card>
    </v-container>
</template>

<script>
import MapShowItem from '@/components/MapShowItem.vue'
import Snackbar from '@/components/Snackbar.vue';
import DoughnutChart from '@/components/chart/DoughnutChart.vue'; // 根据实际路径进行引入


export default {
    components: {
        MapShowItem,
        Snackbar,
        DoughnutChart,
    },
    data() {
        return {
            stationinfo: {},
            sid: this.$route.params.sid,
            statics: {},
        };
    },
    methods: {
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
<style scoped></style>
