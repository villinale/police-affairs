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
            isLogin: false,
            isManager: false,
            isOfficer: false,
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
        checkLoginStatus() {
            if (this.$cookies.get("userid") != null) {
                this.isLogin = true;
            }
        },
        updateRole() {
            if (this.$cookies.get("role") == "管理员") {
                this.isManager = true;
            } else if (this.$cookies.get("role") == "警员") {
                this.isOfficer = true;
            }
        },
        getLoc(data) { //MapSelectItem传来的数据
            this.loc = data;
        },
        submitForm() {
            console.log(this.isManager)
            if (!this.isLogin) {
                this.$refs.mychild.showSnackbar('未登录，不能执行该操作！', 'error');
                return;
            }
            else if (this.isManager || this.isOfficer) {
                this.$refs.mychild.showSnackbar('不是用户，不能执行该操作！', 'error');
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
                    u_no: this.$cookies.get("userid"),
                })
                .then(res => {
                    console.log(res.data);
                })
                .catch(err => {
                    console.log(err);
                });
        }
    },
    mounted() {
        this.checkLoginStatus();
        this.updateRole();
    },
};
</script>
  