<!--
 * @Author: yingxin wang
 * @Date: 2023-04-24 14:05:40
 * @LastEditors: yingxin wang
 * @LastEditTime: 2023-04-25 20:48:24
 * @Description: 登陆注册页面
-->
<template>
    <v-container>
        <v-row>
            <v-col class="d-flex justify-center">
                <span class="mdi mdi-police-station header-icon"></span>
            </v-col>
        </v-row>
        <v-row>
            <v-col class="header">
                <h1 style="font-weight: 100;">智慧警务系统</h1>
            </v-col>
        </v-row>
        <v-card class="cardBox">
            <v-tabs v-model="tab" background-color="transparent">
                <v-tab>登录</v-tab>
                <v-tab>注册</v-tab>
            </v-tabs>
            <v-card-text>
                <v-form v-if="tab === 0">
                    <v-text-field label="手机号" v-model="telephone" required></v-text-field>
                    <v-text-field label="密码" v-model="password" required></v-text-field>
                    <v-btn color="primary" @click="login">登录</v-btn>
                </v-form>
                <v-form v-else>
                    <v-text-field label="手机号" v-model="telephone" required></v-text-field>
                    <v-text-field label="密码" v-model="password" required></v-text-field>
                    <v-text-field label="再确认密码" v-model="confirmPassword" required></v-text-field>
                    <v-btn color="primary" @click="register">注册</v-btn>
                </v-form>
            </v-card-text>
        </v-card>
    </v-container>
</template>
  
<script>
import SvgIcon from '@jamescoyle/vue-icon';

export default {
    components: {
        SvgIcon
    },
    data() {
        return {
            tab: 0,
            telephone: '',
            password: '',
            confirmPassword: '',
        }
    },
    methods: {
        login() {
            // 根据手机号和密码查询数据库
            const user = // 查询结果
            if (user) {
                // 登录成功，设置cookie
                this.$cookies.set('userid', user.id)
                this.$cookies.set('role', user.role)
                // 跳转到主页
                this.$router.push('/')
            } else {
                // 登录失败，给出提示
                // TODO: 实现提示逻辑
            }
        },
        register() {
            // TODO: 实现注册逻辑
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