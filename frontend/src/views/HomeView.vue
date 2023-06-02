<template>
	<v-container class="fill-height">
		<mymap style="margin-bottom:20px;"></mymap>
		<v-responsive class="d-flex align-center text-center">
			<v-row class="d-flex align-center justify-center">
				<v-col v-if="!isManager && !isOfficer" cols="auto">
					<v-btn href="" min-width="164" rel="noopener noreferrer" size="x-large" target="_blank" variant="text">
						<v-icon icon="mdi-file-arrow-up-down" size="large" @click="goToReportCase" />
						电子报案
					</v-btn>
				</v-col>

				<v-col v-if="!isLogin" cols="auto">
					<div class="login-wrapper">
						<v-btn color="primary" min-width="228" rel="noopener noreferrer" size="x-large" target="_blank"
							variant="flat" prepend-icon="mdi-login" @click="goToLogin">
							登陆/注册
						</v-btn>
					</div>
				</v-col>

				<v-col cols="auto">
					<v-btn href="" min-width="164" rel="noopener noreferrer" size="x-large" target="_blank" variant="text">
						<v-icon icon="mdi-message-bulleted" size="large" start />
						最新消息
					</v-btn>
				</v-col>
			</v-row>
		</v-responsive>
	</v-container>
</template>

<script>
import mymap from '@/components/MapItem.vue'
export default {
	components: { mymap },
	data() {
		return {
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
		updateRole() {
			if (this.$cookies.get("role") == "管理员") {
				this.isManager = true;
			} else if (this.$cookies.get("role") == "警员") {
				this.isOfficer = true;
			}
		},
		goToLogin() {
			this.$router.push('/login');
		},
		goToReportCase() {
			this.$router.push('/report');
		},
	},
	mounted() {
		this.checkLoginStatus();
		this.updateRole();
	},
	// beforeRouteEnter(to, from, next) {
	// 	const isLoggedIn = this.isLogin;
	// 	const requiresAuth = to.matched.some(record => record.meta.requiresAuth);

	// 	if (requiresAuth && !isLoggedIn) {
	// 		next('/login');
	// 	} else {
	// 		next();
	// 	}
	// },
	// beforeRouteUpdate(to, from, next) {
	// 	// 在路由更新时进行相应的逻辑处理
	// 	const isLoggedIn = this.isLogin;
	// 	const requiresAuth = to.matched.some(record => record.meta.requiresAuth);

	// 	if (requiresAuth && !isLoggedIn) {
	// 		next('/login');
	// 	} else {
	// 		next();
	// 	}
	// },
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
</style>
