<!--
 * @Author: yingxin wang
 * @Date: 2023-04-24 14:05:40
 * @LastEditors: yingxin wang
 * @LastEditTime: 2023-06-02 10:31:14
 * @Description: 登陆注册页面
-->
<template>
    <Snackbar ref="mychild" />
    <v-container>
        <v-row>
            <v-col class="d-flex justify-center">
                <span class="mdi mdi-police-station header-icon"></span>
            </v-col>
        </v-row>
        <v-row>
            <v-col class="header">
                <h1 style="font-weight: 100;">智慧交通警务系统</h1>
            </v-col>
        </v-row>
        <v-card class="cardBox">
            <v-tabs v-model="tab" background-color="transparent">
                <v-tab>登录</v-tab>
                <v-tab>注册</v-tab>
            </v-tabs>
            <v-card-text>
                <v-form v-if="tab === 0">
                    <v-text-field label="手机号" v-model="ltelephone" required></v-text-field>
                    <v-text-field label="密码" v-model="lpassword" type="password" required></v-text-field>
                    <v-btn color="primary" @click="login">登录</v-btn>
                </v-form>
                <v-form v-else>
                    <v-text-field label="手机号" v-model="telephone" required></v-text-field>
                    <v-text-field label="姓名" v-model="name" required></v-text-field>
                    <v-text-field label="密码" v-model="password" type="password" required></v-text-field>
                    <v-text-field label="再确认密码" v-model="confirmPassword" type="password" required></v-text-field>
                    <v-btn color="primary" @click="register">注册</v-btn>
                </v-form>
            </v-card-text>
        </v-card>
    </v-container>
</template>
  
<script>
import SvgIcon from '@jamescoyle/vue-icon';
import Snackbar from '@/components/Snackbar.vue';

export default {
    components: {
        SvgIcon,
        Snackbar
    },
    data() {
        return {
            tab: 0,
            ltelephone: '',
            lpassword: '',
            telephone: '',
            password: '',
            name: '',
            confirmPassword: '',
            snackbarVisible: false,
            snackbarText: '',
            snackbarColor: ''
        }
    },
    methods: {
        showSnackbar(text, color) {
            this.$refs.mychild.showSnackbar(text, color);
        },
        login() {
            console.log(this.telephone, this.password)
            // 根据手机号和密码查询数据库
            this.$axios.post('/user/login',
                {
                    phone: this.ltelephone,
                    psw: this.lpassword
                })
                .then((res) => {
                    if (res.data.u_no != null) {// -100：错误
                        const user = res.data // 查询结果
                        if (user) {
                            // 登录成功，设置cookie
                            this.$cookies.set('userid', user.u_no)
                            this.$cookies.set('name', user.u_name)
                            this.$cookies.set('role', user.u_role)
                            // 跳转到主页
                            this.$router.push('/')
                        } else {
                            this.showSnackbar('账号不存在或密码错误，登录失败！', 'error');
                        }
                    }
                    else {
                        this.showSnackbar('账号不存在或密码错误，登录失败！', 'error');
                    }
                })
                .catch(err => {
                    console.log(err);
                });
        },
        register() {
            if (this.password !== this.confirmPassword) {
                this.showSnackbar('两次输入的密码不一致！', 'error');
                return;
            }
            console.log(this.telephone, this.password)
            // 根据手机号和密码查询数据库
            this.$axios.post('/user/hasPhone?' +
                'phone=' + this.telephone)
                .then((res) => {
                    console.log(res.data)
                    if (res.data === true) {
                        this.showSnackbar('该手机号已被注册！请重换', 'error');
                    }
                    else if (res.data === false) {
                        this.$axios.post('/user/register',
                            {
                                phone: this.telephone,
                                name: this.name,
                                psw: this.password
                            })
                            .then((res) => {
                                console.log(res.data)
                                if (res.data === true) {
                                    this.showSnackbar('注册成功', 'success');
                                    this.tab = 0;
                                }
                                else {
                                    this.showSnackbar('注册失败，请联系管理员', 'error');
                                }
                            })
                            .catch(err => {
                                console.log(err);
                            });
                    }
                    else {
                        this.showSnackbar('注册失败', 'error');
                    }
                })
                .catch(err => {
                    console.log(err);
                });
        }
    }
}
</script>
  
<style>
@import url('https://fonts.googleapis.com/css?family=Noto+Sans+SC');

.header-icon {
    font-size: 70px;
    color: #1867c0;
    margin-top: 50px;
    margin-bottom: -20px;
}

.header {
    text-align: center;
    width: 400px;
    font-family: 'Noto Sans SC', sans-serif;
    margin-bottom: -20px;
}

.cardBox {
    width: 400px;
    margin: 50px auto;
}
</style>