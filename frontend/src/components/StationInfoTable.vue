<script setup>
import * as caseUtils from '@/plugins/caseUtils.js'
import * as roleUtils from '@/plugins/roleUtils.js'
import * as pageUtils from '@/plugins/pageUtils.js'
</script>

<template>
    <v-container class="fill-height" style="display: block;">
        <v-data-table :headers="headersforstations" :items="stations">
            <template v-slot:top>
                <v-dialog v-model="dialogEdit" max-width="500px">
                    <v-card>
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
export default {
    components: {
        VDataTable,
    },
    data() {
        return {
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
                s_area: "",
                s_address: "",
            },
            defaultItem: {
                s_name: "",
                s_phone: "",
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
        },
        deleteItem(item) {
            this.editedIndex = this.stations.indexOf(item)
            this.editedItem = Object.assign({}, item)
            this.dialogDelete = true
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
    /* 修改为您希望的鼠标样式，例如： */
    /* cursor: pointer; */
    /* cursor: grab; */
    /* cursor: crosshair; */
    /* cursor: move; */
    /* cursor: help; */
    /* ... */
}
</style>