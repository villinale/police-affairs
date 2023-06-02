<template>
    <div>
        <v-card>
            <v-card-title>
                <h2>创建事件</h2>
            </v-card-title>
            <v-card-text>
                <v-form ref="form" @submit="submitForm">
                    <v-text-field v-model="title" label="标题" required></v-text-field>
                    <v-date-picker v-model="date" label="时间" required></v-date-picker>
                    <v-textarea v-model="description" label="描述" required></v-textarea>
                    <v-btn type="submit" color="primary">提交</v-btn>
                </v-form>
            </v-card-text>
        </v-card>
    </div>
</template>
  
<script>
export default {
    data() {
        return {
            title: '',
            date: null,
            description: ''
        };
    },
    methods: {
        submitForm() {
            if (this.$refs.form.validate()) {
                // 在这里处理提交表单的逻辑，比如调用后端接口保存数据
                console.log('提交表单');
                console.log('标题:', this.title);
                console.log('时间:', this.date);
                console.log('描述:', this.description);
            }
        }
    }
};
</script>
  