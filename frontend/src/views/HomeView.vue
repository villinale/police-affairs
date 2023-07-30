<script setup>
import * as roleUtils from '@/plugins/roleUtils.js'
import * as pageUtils from '@/plugins/pageUtils.js'
</script>

<template>
	<v-container class="fill-height">
		<mymap></mymap>
		<v-responsive class="d-flex align-center text-center">
			<v-row class="d-flex align-center justify-center">
				<v-col v-if="isShowManage" cols="auto">
					<v-btn min-width="164" rel="noopener noreferrer" size="x-large" target="_blank" variant="text"
						@click="pageUtils.goToManage(this)">
						<v-icon icon="mdi-file-arrow-up-down" size="large" start />
						信息管理
					</v-btn>
				</v-col>

				<v-col v-if="isShowReport" cols="auto">
					<v-btn min-width="164" rel="noopener noreferrer" size="x-large" target="_blank" variant="text"
						@click="pageUtils.goToReportCase(this)">
						<v-icon icon="mdi-file-arrow-up-down" size="large" start />
						电子报案
					</v-btn>
				</v-col>

				<v-col v-if="isShowLogin" cols="auto">
					<div class="login-wrapper">
						<v-btn color="primary" min-width="228" rel="noopener noreferrer" size="x-large" target="_blank"
							variant="flat" prepend-icon="mdi-login" @click="pageUtils.goToLogin(this)">
							登录/注册
						</v-btn>
					</div>
				</v-col>

				<v-col v-if="isShowPerson" cols="auto">
					<div class="login-wrapper">
						<v-btn color="primary" min-width="228" rel="noopener noreferrer" size="x-large" target="_blank"
							variant="flat" prepend-icon="mdi-home-assistant" @click="pageUtils.goToPerson(this)">
							个人主页
						</v-btn>
					</div>
				</v-col>

				<v-col cols="auto">
					<v-btn min-width="164" rel="noopener noreferrer" size="x-large" target="_blank" variant="text"
						@click="pageUtils.goToOpenInfo(this)">
						<v-icon icon="mdi-message-bulleted" size="large" />
						信息公开
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
			isShowReport: false,
			isShowLogin: false,
			isShowPerson: false,
			isShowManage: false,
		}
	},
	methods: {
	},
	created() {
		roleUtils.checkLoginStatus(this);
		roleUtils.updateRole(this);
		this.isShowManage = roleUtils.isManager;
		this.isShowReport = (!roleUtils.isManager) && (!roleUtils.isOfficer);
		this.isShowLogin = (!roleUtils.isLogin);
		this.isShowPerson = (roleUtils.isLogin);
		console.log(this.isShowReport);
		console.log(this.isShowLogin);
	},
	watch: {
		$route(to, from) {
			let that = this;
			roleUtils.checkLoginStatus(that);
			roleUtils.updateRole(that);
			that.isShowManage = roleUtils.isManager;
			that.isShowReport = (!roleUtils.isManager) && (!roleUtils.isOfficer);
			that.isShowLogin = (!roleUtils.isLogin);
			that.isShowPerson = (roleUtils.isLogin);
		}
	},
	mounted() {
		roleUtils.checkLoginStatus(this);
		roleUtils.updateRole(this);
		this.isShowManage = roleUtils.isManager;
		this.isShowReport = (!roleUtils.isManager) && (!roleUtils.isOfficer) && (roleUtils.isLogin);
		this.isShowLogin = (!roleUtils.isLogin);
		this.isShowPerson = (roleUtils.isLogin);
		console.log(this.isShowReport);
		console.log(this.isShowLogin);
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
</style>
