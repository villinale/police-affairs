<script setup>
import * as caseUtils from '@/plugins/caseUtils.js'
</script>

<template>
    <div>
        <v-container>
            <v-row>
                <v-col v-for="(info, index) in casesInfoList" :key="index" cols="12" sm="6" md="4">
                    <v-card class="mx-auto pe-container" max-width="400">
                        <v-card-title class="primary">
                            <span class="pe-header-text">NO.{{ info.c_no }} {{ info.c_title }}</span>
                        </v-card-title>
                        <v-card-text>
                            <div class="info-row">
                                <strong>发生日期:</strong> {{ info.c_startdate }}
                            </div>
                            <div v-if="caseUtils.isClose(info.c_stat)" class="info-row">
                                <strong>结案日期:</strong> {{ info.c_enddate }}
                            </div>
                            <div class="info-row">
                                <strong>位置:</strong> {{ caseUtils.getLocString(info) }}
                            </div>
                            <div class="info-row">
                                <strong>描述:</strong> {{ info.c_text }}
                            </div>
                            <div class="info-row">
                                <strong>所属辖区编号:</strong> {{ info.s_no }}
                            </div>
                            <div class="info-row">
                                <strong>负责警官编号:</strong> {{ info.o_no }}
                            </div>

                            <div class="info-row">
                                <v-chip class="ca-v-chip" label :color="caseUtils.getLevelColor(info.c_level)">{{
                                    info.c_level
                                }}</v-chip>
                                <v-chip class="ca-v-chip" label :color="caseUtils.getStatusColor(info.c_stat)">{{
                                    info.c_stat
                                }}</v-chip>
                            </div>
                        </v-card-text>
                    </v-card>
                </v-col>
            </v-row>
        </v-container>
    </div>
</template>
  
<script>
export default {
    props: {
        casesInfoList: {
            type: Array,
            required: true
        }
    },
    methods: {
        // isClose(status) {
        //     if (status == '已结束') return true
        //     else return false
        // },
        // getLocString(info) {
        //     return info.c_province + '-' + info.c_area + '-' + info.c_address;
        // },
        // getStatusColor(status) {
        //     if (status == '待分配') return 'red'
        //     else if (status == '调查中') return 'primary'
        //     else return 'grey-lighten-1'
        // },
        // getLevelColor(level) {
        //     if (level == '严重') return 'red'
        //     else if (level == '较大') return 'amber-accent-2'
        //     else if (level == '一般') return 'green-lighten-3'
        //     else if (level == '轻微') return 'grey-darken-1'
        // }
    }
};
</script>
  
<style scoped>
.pe-container {
    margin-top: 20px;
}

.pe-header-text {
    font-size: 20px;
    font-weight: bold;
    color: white;
}

.primary {
    background-color: #3f51b5;
    color: white;
    margin-bottom: 5px;
}

.secondary {
    background-color: #b0bec5;
    color: white;
}

.info-row {
    margin-bottom: 5px;
}

.ca-v-chip {
    margin-right: 5px;
}
</style>
  