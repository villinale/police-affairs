<template>
    <v-container class="fill-height" style="display: block;">
        <v-card>
            <v-card-title>
                <h2>电子报案</h2>
            </v-card-title>
            <v-card-text>
                <v-form ref="form">
                    <v-text-field v-model="title" label="标题" required></v-text-field>
                    <v-row align="center">
                        <v-col cols="6">
                            <v-text-field v-model="loc" label="地点" required></v-text-field>
                        </v-col>
                        <v-col cols="6">
                            <v-text-field type="date" v-model="date" label="时间" required></v-text-field>
                        </v-col>
                    </v-row>
                    <v-textarea v-model="description" label="描述" required></v-textarea>
                    <v-checkbox v-model="urgent" label="紧急" color="primary"></v-checkbox>
                    <v-btn color="primary" @click="submitForm">提交</v-btn>
                </v-form>
            </v-card-text>
        </v-card>
    </v-container>
</template>
  
<script>
//TODO:界面美化
export default {
    data() {
        return {
            title: '',
            date: null,
            loc: '',
            description: '',
            urgent: false
        };
    },
    methods: {
        submitForm() {
            var a = {
                c_title: this.title,
                c_date: this.date,
                c_loc: this.loc,
                c_text: this.description,
                c_level: (this.urgent) ? 1 : 0,
                c_stat: 0,
            };
            console.log(a);
            this.$axios.post(`/case/addCase`,
                {
                    c_title: this.title,
                    c_date: this.date,
                    c_loc: this.loc,
                    c_text: this.description,
                    c_level: (this.urgent) ? 1 : 0,
                    c_stat: 0,
                })
                .then(res => {
                    console.log(res.data);
                })
                .catch(err => {
                    console.log(err);
                });
        }
    }
};
</script>
  