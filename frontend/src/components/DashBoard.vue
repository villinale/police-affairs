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
                <v-list-item v-if="isLogin" prepend-icon="mdi-account" title="个人信息" value="个人信息" link>
                </v-list-item>
                <v-list-item v-if="isLogin" prepend-icon="mdi-file" title="我的报案" value="我的报案" link>
                </v-list-item>
                <v-list-item v-if="isLogin" prepend-icon="mdi-checkbox-marked-circle-outline" title="我的处理" value="我的处理"
                    link>
                </v-list-item>
            </v-list>
        </v-navigation-drawer>
    </div>
</template>
  
<script>
export default {
    data() {
        return {
            drawer: true,
            rail: true,
            isLogin: true,
            isManager: false,
            isOfficer: false,
        };
    },
    methods: {
        checkLoginStatus() {
            if (this.$cookies.get("userid") != null) {
                this.isLogin = true;
            }
            console.log(this.isLogin);
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
    },
    mounted() {
        this.checkLoginStatus();
    },
};
</script>
  
<style scoped>
.drawer-container {
    flex-grow: 1;
}
</style>  