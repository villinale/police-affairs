<script setup>
import * as caseUtils from '@/plugins/caseUtils.js'
import * as roleUtils from '@/plugins/roleUtils.js'
</script>

<template>
    <Snackbar ref="mychild" />
    <v-container class="fill-height" style="display: block;">
        <v-card>
            <v-card-title>
                <v-row align="center">
                    <h2>NO.{{ caseinfo.c_no }} {{ caseinfo.c_title }}</h2>
                    <v-col style="display: flex;justify-content: flex-end;">
                        <v-chip class="ca-v-chip" label :color="caseUtils.getLevelColor(caseinfo.c_level)">
                            {{ caseinfo.c_level }}
                        </v-chip>
                    </v-col>
                </v-row>
            </v-card-title>

            <v-timeline side="end" direction="horizontal" style="margin-top: 20px;margin-bottom: 20px;">
                <v-timeline-item size="small" :dot-color="(casestatInt < 1) ? 'blue-lighten-4' : 'blue-darken-4'">
                    <div
                        :style="(casestatInt < 1) ? { color: 'gray', 'font-weight': 'normal' } : { color: 'black', 'font-weight': 'bold' }">
                        待分配
                    </div>
                </v-timeline-item>

                <v-timeline-item size="small" :dot-color="(casestatInt < 2) ? 'blue-lighten-4' : 'blue-darken-4'">
                    <div
                        :style="(casestatInt < 2) ? { color: 'gray', 'font-weight': 'normal' } : { color: 'black', 'font-weight': 'bold' }">
                        处理中</div>
                </v-timeline-item>

                <v-timeline-item size="small" :dot-color="(casestatInt < 3) ? 'blue-lighten-4' : 'blue-darken-4'">
                    <div
                        :style="(casestatInt < 3) ? { color: 'gray', 'font-weight': 'normal' } : { color: 'black', 'font-weight': 'bold' }">
                        已结束</div>
                </v-timeline-item>
            </v-timeline>

            <MapShowItem ref="myMapShowItem" style="margin-bottom:20px;">
            </MapShowItem>
            <v-card-text>
                <v-caseinfo ref="caseinfo">
                    <v-row align="center">
                        <v-col cols="6">
                            <v-text-field v-model="caseinfo.c_address" label="具体位置" readonly></v-text-field>
                        </v-col>
                        <v-col cols="3">
                            <v-text-field v-model="caseinfo.s_no" label="所属辖区" readonly></v-text-field>
                        </v-col>
                        <v-col v-if="caseUtils.isAssigned(caseinfo.c_stat)" cols="3">
                            <v-text-field v-model="caseinfo.o_no" label="分配警员" readonly></v-text-field>
                        </v-col>
                    </v-row>
                    <v-row align="center">
                        <v-col cols="6">
                            <v-text-field v-model="userinfo.u_name" label="报案人" readonly></v-text-field>
                        </v-col>
                        <v-col cols="6">
                            <v-text-field v-model="userinfo.u_phone" label="报案人联系方式" readonly></v-text-field>
                        </v-col>
                    </v-row>
                    <v-row align="center">
                        <v-col cols="6">
                            <v-text-field type="datetime-local" v-model="caseinfo.c_startdate" label="报案时间"
                                readonly></v-text-field>
                        </v-col>
                        <v-col v-if="caseUtils.isClose(caseinfo.c_stat)" cols="6">
                            <v-text-field type="datetime-local" v-model="caseinfo.c_enddate" label="结案时间"
                                readonly></v-text-field>
                        </v-col>
                    </v-row>
                    <v-textarea v-model="caseinfo.c_text" label="描述" readonly></v-textarea>
                </v-caseinfo>
            </v-card-text>
        </v-card>
    </v-container>
</template>

<script>
import MapShowItem from '@/components/MapShowItem.vue'
import Snackbar from '@/components/Snackbar.vue';

export default {
    components: {
        MapShowItem,
        Snackbar,
    },
    data() {
        return {
            caseinfo: {},
            userinfo: {},
            casestatInt: 0,
            cid: this.$route.params.cid,
        };
    },
    methods: {
        async getCaseInfo() {
            if (this.cid) {
                this.$axios
                    .get(`/case/getCasesByCId/` + this.cid)
                    .then((response) => {
                        this.caseinfo = response.data;
                        this.casestatInt = caseUtils.getStatusInt(this.caseinfo.c_stat);
                        this.$refs.myMapShowItem.initMap(this.caseinfo.c_lon, this.caseinfo.c_lat, this.caseinfo.c_address);

                        this.$axios
                            .get(`/user/getUserInfoById/` + this.caseinfo.u_no)
                            .then((response) => {
                                this.userinfo = response.data;
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
        console.log(this.cid);
        this.getCaseInfo();
    },
};
</script>
<style scoped>
.ca-v-chip {
    margin-right: 5px;
}
</style>
