<script setup>
import * as roleUtils from '@/plugins/roleUtils.js'
import * as pageUtils from '@/plugins/pageUtils.js'
</script>

<template>
	<v-container class="fill-height">
		<mymap style="margin-bottom:20px;"></mymap>
		<v-responsive class="d-flex align-center text-center">
			<v-row class="d-flex align-center justify-center">
				<v-col v-if="!roleUtils.isManager && !roleUtils.isOfficer" cols="auto">
					<v-btn href="" min-width="164" rel="noopener noreferrer" size="x-large" target="_blank" variant="text"
						@click="pageUtils.goToReportCase(this)">
						<v-icon icon="mdi-file-arrow-up-down" size="large" start />
						电子报案
					</v-btn>
				</v-col>

				<v-col v-if="!isLogin" cols="auto">
					<div class="login-wrapper">
						<v-btn color="primary" min-width="228" rel="noopener noreferrer" size="x-large" target="_blank"
							variant="flat" prepend-icon="mdi-login" @click="pageUtils.goToLogin(this)">
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
		}
	},
	methods: {
	},
	mounted() {
		roleUtils.checkLoginStatus(this);
		roleUtils.updateRole(this);
	},
	//TODO:路由守卫
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
