<script setup>
import * as caseUtils from '@/plugins/caseUtils.js'
import * as roleUtils from '@/plugins/roleUtils.js'
import * as pageUtils from '@/plugins/pageUtils.js'
</script>

<template>
    <Snackbar ref="mychild" />
    <v-container class="fill-height" style="display: block;">
        <v-data-table :headers="headersforcases" :items="cases" :search="search">
            <template v-slot:top>
                <v-toolbar flat>
                    <v-toolbar-title>所有案件信息</v-toolbar-title>
                    <v-spacer></v-spacer>

                    <v-text-field v-model="search" append-icon="mdi-magnify" label="Search" single-line
                        hide-details></v-text-field>
                    <v-btn color="primary" dark class="mb-2" @click="pageUtils.goToReportCase(this)">
                        新增案件
                    </v-btn>

                    <v-dialog v-model="dialogEdit" max-width="800px">

                        <v-card>
                            <v-card-text>
                                <v-container>
                                    <v-row>
                                        <v-col cols="12" sm="6" md="4">
                                            <v-text-field v-model="editedItem.c_title" label="案件名称"></v-text-field>
                                        </v-col>
                                        <v-col cols="12" sm="6" md="4">
                                            <v-text-field v-model="editedItem.c_area" label="所在区"></v-text-field>
                                        </v-col>
                                        <v-col cols="12" sm="6" md="4">
                                            <v-text-field v-model="editedItem.c_address" label="详细位置"></v-text-field>
                                        </v-col>
                                        <v-col cols=" 12" sm="6" md="4">
                                            <v-select v-model="editedItem.c_level" label="级别"
                                                :items="['轻微', '一般', '较大', '严重']"></v-select>
                                        </v-col>
                                        <v-col cols="12" sm="6" md="4">
                                            <v-text-field type="datetime-local" v-model="editedItem.c_enddate"
                                                label="结案时间"></v-text-field>
                                        </v-col>
                                        <v-col cols="12" sm="6" md="4">
                                            <v-select v-model="editedItem.c_stat" label="状态"
                                                :items="['待分配', '处理中', '已结束']"></v-select>
                                        </v-col>
                                        <v-col v-if="roleUtils.isManager || roleUtils.isOfficer" cols="12" sm="6" md="4">
                                            <v-text-field v-model="editedItem.o_no" label="负责警员"></v-text-field>
                                        </v-col>
                                        <v-col cols=" 12" sm="6" md="4">
                                            <v-text-field v-model="editedItem.s_no" label="负责辖区"></v-text-field>
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
                </v-toolbar>
            </template>

            <template v-slot:item.c_title="{ item }" class="hoverable">
                <div @click="pageUtils.goToCaseInfoView(this, item.columns.c_no)">{{ item.columns.c_title }}</div>
            </template>
            <template v-slot:item.c_no="{ item }" class="hoverable">
                <div @click="pageUtils.goToCaseInfoView(this, item.columns.c_no)">{{ item.columns.c_no }}</div>
            </template>
            <template v-slot:item.c_level="{ item }">
                <v-chip :color="caseUtils.getLevelColor(item.columns.c_level)">
                    {{ item.columns.c_level }}
                </v-chip>
            </template>
            <template v-slot:item.c_stat="{ item }">
                <v-chip :color="caseUtils.getStatusColor(item.columns.c_stat)">
                    {{ item.columns.c_stat }}
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
import Snackbar from '@/components/Snackbar.vue';
export default {
    components: {
        VDataTable,
        Snackbar
    },
    data() {
        return {
            search: "",
            uid: this.$cookies.get('userid'),
            cases: [],
            headersforcases: [
                { title: '案件编号', align: 'start', key: 'c_no', },
                { title: '案件名称', align: 'start', key: 'c_title', },
                { title: '所在区', align: 'end', key: 'c_area' },
                { title: '详细位置', align: 'end', key: 'c_address' },
                { title: '级别', align: 'end', key: 'c_level' },
                { title: '发生时间', align: 'end', key: 'c_startdate' },
                { title: '结案时间', align: 'end', key: 'c_enddate' },
                { title: '状态', align: 'end', key: 'c_stat' },
                { title: '上报人', align: 'end', key: 'u_no' },
                { title: '负责警员', align: 'end', key: 'o_no' },
                { title: '负责辖区', align: 'end', key: 's_no' },
                { title: '编辑', key: 'actions', sortable: false },
            ],
            dialogEdit: false,
            dialogDelete: false,
            editedIndex: -1,
            editedItem: {
                c_title: "",
                c_area: "",
                c_address: "",
                c_level: "",
                c_enddate: "",
                c_stat: "",
                o_no: "",
                s_no: "",
            },
            defaultItem: {
                c_title: "",
                c_area: "",
                c_address: "",
                c_level: "",
                c_enddate: "",
                c_stat: "",
                o_no: "",
                s_no: "",
            },
        }
    },
    watch: {
        dialogEdit(val) {
            val || this.close()
        },
        dialogDelete(val) {
            val || this.closeDelete()
        },
    },
    methods: {
        getAllData() {
            console.log(this.uid)
            console.log(roleUtils.isOfficer)
            if (!(roleUtils.isOfficer)) {
                this.$axios.get('/case/getAllCases').then(res => {
                    console.log(res.data)
                    this.cases = res.data;
                });
            }
            else {
                this.$axios
                    .get(`/case/getUserCasesByUId/` + this.uid + '/' + roleUtils.isOfficer)
                    .then(res => {
                        this.cases = res.data;
                        console.log(this.cases);
                    })
                    .catch(err => {
                        console.log(err);
                    });
            }
        },
        editItem(item) {
            this.editedIndex = this.cases.indexOf(item)
            this.editedItem = Object.assign({}, item)
            this.dialogEdit = true
        },
        deleteItem(item) {
            this.editedIndex = this.cases.indexOf(item)
            this.editedItem = Object.assign({}, item)
            this.dialogDelete = true
        },
        deleteItemConfirm() {
            this.cases.splice(this.editedIndex, 1)
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
            if (this.editedIndex > -1) {
                let c_title = Object.assign({}, this.editedItem).c_title;
                let c_address = Object.assign({}, this.editedItem).c_address;
                let c_level = Object.assign({}, this.editedItem).c_level;
                let c_enddate = Object.assign({}, this.editedItem).c_enddate;
                let c_stat = Object.assign({}, this.editedItem).c_stat;
                let o_no = Object.assign({}, this.editedItem).o_no;
                let s_no = Object.assign({}, this.editedItem).s_no;
                this.$axios.post('/case/updateCaseInfo', {
                    c_no: this.cases[this.editedIndex].c_no,
                    c_title: c_title,
                    c_address: c_address,
                    c_level: c_level,
                    c_stat: c_stat,
                    c_enddate: c_enddate,
                    o_no: o_no,
                    s_no: s_no,
                })
                    .then(res => {
                        console.log(res.data)
                        if (res.data == true)
                            Object.assign(this.cases[this.editedIndex], Object.assign({}, this.editedItem))
                        else
                            this.$refs.mychild.showSnackbar("修改失败", 'error');
                        this.close();
                    })
                    .catch(err => {
                        console.log(err);
                        this.$refs.mychild.showSnackbar("修改失败", 'error');
                        this.close();
                    });
            }
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
    /* 修改为您希望的鼠标样式，例如： */
    /* cursor: pointer; */
    /* cursor: grab; */
    /* cursor: crosshair; */
    /* cursor: move; */
    /* cursor: help; */
    /* ... */
}
</style>