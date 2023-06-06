<template>
    <v-card class="mx-auto pe-continer" max-width="400" min-width="350" min-height="300">
        <v-card-title class="primary">
            <span class="pe-header-text">用户信息</span>
        </v-card-title>
        <v-card-text>
            <v-list>
                <v-list-item>
                    <v-list-item-content>
                        <v-list-item-title class="font-weight-bold">姓名:</v-list-item-title>
                        <v-list-item-subtitle class="sub-text">{{ userInfo.u_name }}</v-list-item-subtitle>
                    </v-list-item-content>
                </v-list-item>
                <v-list-item>
                    <v-list-item-content>
                        <v-list-item-title class="font-weight-bold">性别:</v-list-item-title>
                        <v-list-item-subtitle class="sub-text">{{ userInfo.u_sex }}</v-list-item-subtitle>
                    </v-list-item-content>
                </v-list-item>
                <v-list-item>
                    <v-list-item-content>
                        <v-list-item-title class="font-weight-bold">手机号:</v-list-item-title>
                        <v-list-item-subtitle class="sub-text">{{ userInfo.u_phone }}</v-list-item-subtitle>
                    </v-list-item-content>
                </v-list-item>
                <v-list-item>
                    <v-list-item-content>
                        <v-list-item-title class="font-weight-bold">身份:</v-list-item-title>
                        <v-list-item-subtitle class="sub-text">{{ userInfo.u_role }}</v-list-item-subtitle>
                    </v-list-item-content>
                </v-list-item>
            </v-list>
        </v-card-text>
    </v-card>
</template>
  
<script>
export default {
    props: {
        userInfo: {
            type: Object,
            required: true
        }
    }
};
</script>
  
<style scoped>
.pe-continer {
    margin-top: 20px;
}

.primary {
    background-color: #1976d2;
    align-content: center;
    justify-content: center;
    display: flex;
    flex-wrap: wrap;
}

.pe-header-text {
    font-size: 20px;
    color: white;
}

.font-weight-bold {
    font-size: 17px;
    font-weight: bold;
    line-height: 30px;
}

.sub-text {
    font-size: 16px;
    color: #757575;
    margin-bottom: 2px;
    line-height: 30px;
}
</style>
  