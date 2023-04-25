<!--
 * @Author: yingxin wang
 * @Date: 2023-04-25 15:14:19
 * @LastEditors: yingxin wang
 * @LastEditTime: 2023-04-25 15:14:23
 * @Description: 个人信息
-->
<template>
    <v-form v-model="valid">
        <v-container>
            <v-row>
                <v-col cols="12" md="6">
                    <v-text-field v-model="firstName" :rules="nameRules" label="First name"></v-text-field>
                </v-col>
                <v-col cols="12" md="6">
                    <v-text-field v-model="lastName" :rules="nameRules" label="Last name"></v-text-field>
                </v-col>
            </v-row>

            <v-row>
                <v-col cols="12" md="6">
                    <v-text-field v-model="email" :rules="emailRules" label="E-mail"></v-text-field>
                </v-col>
                <v-col cols="12" md="6">
                    <v-text-field v-model="phone" :rules="phoneRules" label="Phone number"></v-text-field>
                </v-col>
            </v-row>

            <v-row>
                <v-col cols="12">
                    <v-btn color="primary" @click="submit">Save</v-btn>
                </v-col>
            </v-row>
        </v-container>
    </v-form>
</template>
  
<script>
export default {
    data() {
        return {
            valid: false,
            firstName: '',
            lastName: '',
            email: '',
            phone: '',
            nameRules: [
                v => !!v || 'Name is required',
                v => (v && v.length <= 10) || 'Name must be less than 10 characters'
            ],
            emailRules: [
                v => !!v || 'E-mail is required',
                v => /.+@.+/.test(v) || 'E-mail must be valid'
            ],
            phoneRules: [
                v => !!v || 'Phone number is required',
                v => /^\d{10}$/.test(v) || 'Phone number must be valid'
            ]
        }
    },
    methods: {
        submit() {
            if (this.$refs.form.validate()) {
                // 保存用户信息的代码
            }
        }
    }
}
</script>
  