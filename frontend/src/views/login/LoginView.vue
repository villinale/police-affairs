<!--
 * @Author: yingxin wang
 * @Date: 2023-04-24 14:05:40
 * @LastEditors: yingxin wang
 * @LastEditTime: 2023-04-24 14:05:47
 * @Description: 登陆注册页面
-->
<template>
    <v-container>
        <v-card>
            <v-tabs v-model="tab" background-color="transparent">
                <v-tab>Login</v-tab>
                <v-tab>Register</v-tab>
            </v-tabs>
            <v-card-text>
                <v-form v-if="tab === 0">
                    <v-text-field label="Email" v-model="email" required></v-text-field>
                    <v-text-field label="Password" v-model="password" required></v-text-field>
                    <v-btn color="primary" @click="login">Login</v-btn>
                </v-form>
                <v-form v-else>
                    <v-text-field label="Email" v-model="email" required></v-text-field>
                    <v-text-field label="Password" v-model="password" required></v-text-field>
                    <v-text-field label="Confirm Password" v-model="confirmPassword" required></v-text-field>
                    <v-btn color="primary" @click="register">Register</v-btn>
                </v-form>
            </v-card-text>
        </v-card>
    </v-container>
</template>
  
<script>
export default {
    data() {
        return {
            tab: 0,
            email: '',
            password: '',
            confirmPassword: '',
        }
    },
    methods: {
        login() {
            // TODO: 实现登录逻辑
        },
        register() {
            // TODO: 实现注册逻辑
        }
    }
}
</script>
  