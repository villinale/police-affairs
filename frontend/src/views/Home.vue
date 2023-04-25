<template>
	<v-container class="fill-height">
		<v-responsive class="d-flex align-center text-center fill-height">
			<v-row class="d-flex align-center justify-center">
				<v-col cols="auto">
					<v-btn href="" min-width="164" rel="noopener noreferrer" size="x-large" target="_blank" variant="text">
						<v-icon icon="mdi-file-arrow-up-down" size="large" start />
						电子报案
					</v-btn>
				</v-col>

				<v-col cols="auto">
					<div class="login-wrapper">
						<v-btn color="primary" href="/login" min-width="228" rel="noopener noreferrer" size="x-large"
							target="_blank" variant="flat" prepend-icon="mdi-login">
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

<style>
.login-wrapper {
	position: relative;
}

.login-icon {
	position: absolute;
	top: -24px;
	/* 调整icon的垂直位置 */
	left: 50%;
	/* 居中定位 */
	transform: translateX(-50%);
	/* 水平居中 */
}
</style>
