<script setup>
import * as caseUtils from '@/plugins/caseUtils.js'
import * as roleUtils from '@/plugins/roleUtils.js'
import * as pageUtils from '@/plugins/pageUtils.js'
</script>

<template>
    <Snackbar ref="mychild" />
    <v-container class="fill-height" style="display: block;">
        <v-data-table :headers="headersforstations" :items="stations" :search="search">
            <template v-slot:top>
                <v-toolbar flat>
                    <v-toolbar-title>所有辖区信息</v-toolbar-title>

                    <v-spacer></v-spacer>

                    <v-text-field v-model="search" append-icon="mdi-magnify" label="Search" single-line
                        hide-details></v-text-field>

                    <v-dialog v-model="dialogEdit" max-width="800px">
                        <template v-slot:activator="{ props }">
                            <v-btn color="primary" dark class="mb-2" v-bind="props" @click="setTitle('新增辖区')">
                                新增辖区
                            </v-btn>
                        </template>

                        <v-card>
                            <v-card-title v-if="formTitle != ''">
                                <span class="headline">{{ formTitle }}</span>
                            </v-card-title>

                            <v-card-text>
                                <v-container>
                                    <v-row>
                                        <v-col cols="12" sm="6" md="4">
                                            <v-text-field v-model="editedItem.s_name" label="派出所名"></v-text-field>
                                        </v-col>
                                        <v-col cols="12" sm="6" md="4">
                                            <v-text-field v-model="editedItem.s_phone" label="派出所电话"></v-text-field>
                                        </v-col>
                                        <v-col cols="12" sm="6" md="4">
                                            <v-text-field v-model="editedItem.s_area" label="派出所所在区"></v-text-field>
                                        </v-col>
                                        <v-col cols="12" sm="6" md="4">
                                            <v-text-field v-model="editedItem.s_lon" label="派出所经度"></v-text-field>
                                        </v-col>
                                        <v-col cols="12" sm="6" md="4">
                                            <v-text-field v-model="editedItem.s_lat" label="派出所纬度"></v-text-field>
                                        </v-col>
                                        <v-col cols=" 12" sm="6" md="4">
                                            <v-text-field v-model="editedItem.s_address" label="派出所具体位置"></v-text-field>
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
                            <v-card-title class="text-h5">
                                确认要删除吗？
                                <span class="headline">{{ formTitle }}</span>
                            </v-card-title>
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

            <template v-slot:item.s_no="{ item }" class="hoverable">
                <div @click="pageUtils.goToStationInfoView(this, item.columns.s_no)">{{ item.columns.s_no }}</div>
            </template>
            <template v-slot:item.s_name="{ item }" class="hoverable">
                <div @click="pageUtils.goToStationInfoView(this, item.columns.s_no)">{{ item.columns.s_name }}</div>
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
            formTitle: '',
            stations: [],
            headersforstations: [
                { title: '派出所编号', align: 'start', key: 's_no', },
                { title: '派出所名', align: 'end', key: 's_name' },
                { title: '电话', align: 'end', key: 's_phone' },
                { title: '所在区', align: 'end', key: 's_area' },
                { title: '详细地址', align: 'end', key: 's_address' },
                { title: '编辑', key: 'actions', sortable: false },
            ],
            dialogEdit: false,
            dialogDelete: false,
            editedIndex: -1,
            editedItem: {
                s_name: "",
                s_phone: "",
                s_lon: "",
                s_lat: "",
                s_area: "",
                s_address: "",
            },
            defaultItem: {
                s_name: "",
                s_phone: "",
                s_lon: "",
                s_lat: "",
                s_area: "",
                s_address: "",
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
        setTitle(formTitle) {
            this.formTitle = formTitle;
        },
        getAllData() {
            this.$axios.get('/station/getAllStations').then(res => {
                console.log(res.data);
                this.stations = res.data;
            });
        },
        editItem(item) {
            this.editedIndex = this.stations.indexOf(item)
            this.editedItem = Object.assign({}, item)
            this.dialogEdit = true
            this.setTitle('修改辖区新息 NO.' + item.s_no)
        },
        deleteItem(item) {
            this.editedIndex = this.stations.indexOf(item)
            this.editedItem = Object.assign({}, item)
            this.dialogDelete = true
            this.setTitle('NO.' + item.s_no + ' ' + item.s_name)
        },
        deleteItemConfirm() {
            this.stations.splice(this.editedIndex, 1)
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
            let s_name = Object.assign({}, this.editedItem).s_name;
            let s_phone = Object.assign({}, this.editedItem).s_phone;
            let s_lon = Object.assign({}, this.editedItem).s_lon;
            let s_lat = Object.assign({}, this.editedItem).s_lat;
            let s_area = Object.assign({}, this.editedItem).s_area;
            let s_address = Object.assign({}, this.editedItem).s_address;
            if (typeof s_lon === "string")
                s_lon = parseFloat(s_lon);
            if (typeof s_lat === "string")
                s_lat = parseFloat(s_lat);

            if (this.editedIndex > -1) { //修改信息
                this.$axios.post('/station/updateStationInfo', {
                    s_no: this.stations[this.editedIndex].s_no,
                    s_name: s_name,
                    s_phone: s_phone,
                    s_lon: s_lon,
                    s_lat: s_lat,
                    s_area: s_area,
                    s_address: s_address,
                })
                    .then(res => {
                        console.log(res.data)
                        if (res.data == true)
                            Object.assign(this.stations[this.editedIndex], Object.assign({}, this.editedItem))
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
            else {//新增信息
                this.$axios.post('/station/addStation', {
                    s_name: s_name,
                    s_phone: s_phone,
                    s_lon: s_lon,
                    s_lat: s_lat,
                    s_area: s_area,
                    s_address: s_address,
                })
                    .then(res => {
                        console.log(res.data)
                        if (res.data == true)
                            this.getAllData();
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