<script setup>
import * as roleUtils from '@/plugins/roleUtils.js'
</script>

<template>
    <Snackbar ref="mychild" />
    <v-container class="fill-height" style="display: block;">
        <v-card>
            <v-card-title>
                <h2>电子报案</h2>
            </v-card-title>
            <MapSelectItem style="margin-bottom:20px;" @getLoc="getLoc">
            </MapSelectItem>
            <v-card-text>
                <v-form ref="form">
                    <v-row align="center">
                        <v-col cols="6">
                            <v-text-field v-model="title" label="标题" required></v-text-field>
                        </v-col>
                        <v-col cols="6">
                            <v-text-field v-model="loc.address" label="具体位置" required></v-text-field>
                        </v-col>
                    </v-row>
                    <v-row align="center">
                        <v-col cols="3">
                            <v-text-field v-model="loc.lon" label="经度" required></v-text-field>
                        </v-col>
                        <v-col cols="3">
                            <v-text-field v-model="loc.lat" label="纬度" required></v-text-field>
                        </v-col>
                        <v-col cols="6">
                            <v-text-field type="datetime-local" v-model="date" label="时间" required></v-text-field>
                        </v-col>
                    </v-row>
                    <v-textarea v-model="description" label="描述" required></v-textarea>
                    <v-checkbox v-model="urgent" label="紧急" color="primary"></v-checkbox>
                    <v-btn color="primary" @click="submitForm">提交</v-btn>
                </v-form>
            </v-card-text>
        </v-card>
    </v-container>
</template>
  
<script>
import MapSelectItem from '@/components/MapSelectItem.vue'
import Snackbar from '@/components/Snackbar.vue';
//TODO:界面美化
export default {
    components: {
        MapSelectItem,
        Snackbar
    },
    data() {
        return {
            title: '',
            date: '',
            loc: {
                lon: '',
                lat: '',
                province: '',
                city: '',
                area: '',
                address: '',
            },
            description: '',
            urgent: false
        };
    },
    methods: {
        getLoc(data) { //MapSelectItem传来的数据
            this.loc = data;
        },
        submitForm() {
            console.log(this.isManager)
            if (!roleUtils.isLogin) {
                this.$refs.mychild.showSnackbar('未登录，不能执行该操作！', 'error');
                return;
            }

            var a = {
                c_title: this.title,
                c_text: this.description,
                c_date: this.date,
                c_level: (this.urgent) ? 1 : 0,
                c_province: this.loc.province,
                c_city: this.loc.city,
                c_area: this.loc.area,
                c_address: this.loc.address,
                c_lon: this.loc.lon,
                c_lat: this.loc.lat,
                c_stat: 0,
                u_no: this.$cookies.get("userid"),
            };
            console.log(a);
            this.$axios.post(`/case/addCase`,
                {
                    c_title: this.title,
                    c_text: this.description,
                    c_date: this.date,
                    c_level: (this.urgent) ? 1 : 0,
                    c_province: this.loc.province,
                    c_city: this.loc.city,
                    c_area: this.loc.area,
                    c_address: this.loc.address,
                    c_lon: this.loc.lon,
                    c_lat: this.loc.lat,
                    c_stat: 0,
                    u_no: parseInt(this.$cookies.get("userid")),
                    isOfficer: roleUtils.isOfficer,
                })
                .then(res => {
                    this.$refs.mychild.showSnackbar("成功报案，请在个人主页查看信息", "green-darken-3");
                    setTimeout(() => {
                        console.log(res.data);
                        this.$router.push('/person');
                    }, 3000);
                })
                .catch(err => {
                    console.log(err);
                });
        }
    },
    mounted() {
        roleUtils.checkLoginStatus(this);
        roleUtils.updateRole(this);
    },
};
</script>
  