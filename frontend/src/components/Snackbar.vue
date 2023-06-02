<template>
    <v-snackbar v-model="snackbar" :color="snackbarColor" :timeout="snackbarTimeout" :top="snackbarTop">
        {{ snackbarText }}
    </v-snackbar>
</template>

<script>
export default {
    data() {
        return {
            snackbar: false,
            snackbarTimeout: 3000, // 持续时间，单位为毫秒
            snackbarTop: false // 控制 Snackbar 在顶部显示或底部显示
        }
    },
    methods: {
        showSnackbar(text, color) {
            this.snackbarText = text;
            this.snackbarColor = color;
            this.snackbar = true;
        }
    }
}
</script>