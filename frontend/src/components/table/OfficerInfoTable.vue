<script setup>
import * as caseUtils from '@/plugins/caseUtils.js'
import * as roleUtils from '@/plugins/roleUtils.js'
import * as pageUtils from '@/plugins/pageUtils.js'
</script>

<template>
    <v-container class="fill-height" style="display: block;">
        <v-data-table :headers="headersforofficers" :items="officers">
            <template v-slot:top>
                <v-dialog v-model="dialogEdit" max-width="800px">
                    <v-card>
                        <v-card-text>
                            <v-container>
                                <v-row>
                                    <v-col cols="12" sm="6" md="4">
                                        <v-text-field v-model="editedItem.u_name" label="警官名"></v-text-field>
                                    </v-col>
                                    <v-col cols="12" sm="6" md="4">
                                        <v-select v-model="editedItem.u_sex" label="性别" :items="['男', '女']"></v-select>
                                    </v-col>
                                    <v-col cols="12" sm="6" md="4">
                                        <v-text-field v-model="editedItem.u_phone" label="联系方式"></v-text-field>
                                    </v-col>
                                    <v-col cols="12" sm="6" md="4">
                                        <v-select v-model="editedItem.u_stat" label="状态" :items="['任务中', '空闲']"></v-select>
                                    </v-col>
                                </v-row>
                            </v-container>
                        </v-card-text>

                        <v-card-actions>
                            <v-spacer></v-spacer>
                            <v-btn color="blue-darken-1" variant="text" @click="close">
                                取消
                            </v-btn>
                            <v-btn color="blue-darken-1" variant="text" @click="save">
                                保存
                            </v-btn>
                        </v-card-actions>
                    </v-card>
                </v-dialog>
                <v-dialog v-model="dialogDelete" max-width="500px">
                    <v-card>
                        <v-card-title class="text-h5">确认要删除吗？</v-card-title>
                        <v-card-actions>
                            <v-spacer></v-spacer>
                            <v-btn color="blue-darken-1" variant="text" @click="closeDelete">取消</v-btn>
                            <v-btn color="blue-darken-1" variant="text" @click="deleteItemConfirm">确认</v-btn>
                            <v-spacer></v-spacer>
                        </v-card-actions>
                    </v-card>
                </v-dialog>
            </template>

            <template v-slot:item.o_stat="{ item }">
                <v-chip :color="getOfficerStaColor(item.columns.o_stat)">
                    {{ item.columns.o_stat }}
                </v-chip>
            </template>
            <template v-slot:item.actions="{ item }">
                <v-icon size="small" class="me-2" @click="editItem(item.raw)">
                    mdi-pencil
                </v-icon>
                <v-icon size="small" @click="deleteItem(item.raw)">
                    mdi-delete
                </v-icon>
            </template>
        </v-data-table>
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
            officers: [],
            headersforofficers: [
                { title: '警员编号', align: 'start', key: 'o_no', },
                { title: '警员名', align: 'end', key: 'u_name' },
                { title: '性别', align: 'end', key: 'u_sex' },
                { title: '手机号码', align: 'end', key: 'u_phone' },
                { title: '警员状态', align: 'end', key: 'o_stat' },
                { title: '所在辖区', align: 'end', key: 's_no' },
                { title: '编辑', key: 'actions', sortable: false },
            ],
            dialogEdit: false,
            dialogDelete: false,
            editedIndex: -1,
            editedItem: {
                u_name: "",
                u_sex: "",
                u_phone: "",
                o_stat: "",
            },
            defaultItem: {
                u_name: "",
                u_sex: "",
                u_phone: "",
                o_stat: "",
            },
        }
    },
    watch: {
        dialog(val) {
            val || this.close()
        },
        dialogDelete(val) {
            val || this.closeDelete()
        },
    },
    methods: {
        getAllData() {
            this.$axios.get('/officer/getAllOfficers').then(res => {
                this.officers = res.data;
            });
        },
        getOfficerStaColor(o_stat) {
            if (o_stat == '任务中') return 'red'
            else if (o_stat == '空闲') return 'green'
            else return 'orange'
        },
        editItem(item) {
            this.editedIndex = this.officers.indexOf(item)
            this.editedItem = Object.assign({}, item)
            this.dialogEdit = true
        },
        deleteItem(item) {
            this.editedIndex = this.officers.indexOf(item)
            this.editedItem = Object.assign({}, item)
            this.dialogDelete = true
        },
        deleteItemConfirm() {
            this.officers.splice(this.editedIndex, 1)
            this.closeDelete()
        },
        close() {
            this.dialogEdit = false
            this.$nextTick(() => {
                this.editedItem = Object.assign({}, this.defaultItem)
                this.editedIndex = -1
            })
        },
        closeDelete() {
            this.dialogDelete = false
            this.$nextTick(() => {
                this.editedItem = Object.assign({}, this.defaultItem)
                this.editedIndex = -1
            })
        },
        save() {
            // if (this.editedIndex > -1) {
            //     Object.assign(this.officers[this.editedIndex], this.editedItem)
            // } else {
            //     this.officers.push(this.editedItem)
            // }
            // this.close()
        },
    },
    mounted() {
        this.getAllData();
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

.hoverable:hover {
    cursor: pointer;
}
</style>