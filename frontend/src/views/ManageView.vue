<template>
    <div class="drawer-container">
        <v-navigation-drawer v-model="drawer" :rail="rail" permanent @click="rail = false">
            <v-list dense>
                <v-list-item nav>
                    <template v-slot:append>
                        <v-btn variant="text" :icon="rail ? 'mdi-chevron-right' : 'mdi-chevron-left'"
                            @click.stop="toggleRail"></v-btn>
                    </template>
                </v-list-item>
                <v-list-item v-if="isLogin && isManager && !isOfficer" prepend-icon="mdi-account-cog-outline" title="人员管理"
                    value="人员管理" link @click="changeManage('officer')">
                </v-list-item>
                <v-list-item v-if="isLogin && isManager && !isOfficer" prepend-icon="mdi-home-map-marker" title="辖区管理"
                    value="辖区管理" link @click="changeManage('station')">
                </v-list-item>
            </v-list>
        </v-navigation-drawer>
    </div>
    <v-container class="fill-height">
    </v-container>
</template>

<script>
import { VDataTable } from 'vuetify/labs/VDataTable'
export default {
    components: {
        VDataTable,
    },
    data() {
        return {
            manageType: "officer",
            drawer: true,
            rail: true,
            isLogin: false,
            isManager: false,
            isOfficer: false,
        }
    },
    methods: {
        checkLoginStatus() {
            if (this.$cookies.get("userid") != null) {
                this.isLogin = true;
            }
            console.log(this.isLogin);
        },
        changeManage(data) {
            if (data == "officer" || data == "station")
                this.manageType = data;
        },
        updateRole() {
            if (this.$cookies.get("role") == "管理员") {
                this.isManager = true;
            } else if (this.$cookies.get("role") == "警员") {
                this.isOfficer = true;
            }
        },
        toggleRail() {
            this.rail = !this.rail;
        },
        goToLogin() {
            this.$router.push('/login');
        },
        goToReportCase() {
            console.log("go to report case");
            this.$router.push('/report');
        },
    },
    mounted() {
        this.checkLoginStatus();
        this.updateRole();
    },
}
</script>

<style>
.login-wrapper {
    position: relative;
}

.login-icon {
    position: absolute;
    top: -24px;
    left: 50%;
    transform: translateX(-50%);
}

.drawer-container {
    flex-grow: 1;
}
</style>