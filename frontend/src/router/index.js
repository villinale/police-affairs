/*
 * @Author: yingxin wang
 * @Date: 2023-06-02 08:06:43
 * @LastEditors: yingxin wang
 * @LastEditTime: 2023-06-04 19:14:33
 * @Description: 请填写简介
 */
// Composables
import { createRouter, createWebHistory } from 'vue-router'

const routes = [
  {
    path: '/test',
    name: 'test',
    component: () => import('@/components/MapItem.vue'),
  },
  {
    path: '/',
    component: () => import('@/layouts/DefaultLayout.vue'),
    children: [
      {
        path: '',
        name: 'Home',
        component: () => import('@/views/HomeView.vue'),
      },
      {
        path: 'person',
        name: 'personInfo',
        component: () => import('@/views/PersonInfoView.vue'),
      },
      {
        path: 'report',
        name: 'report',
        component: () => import('@/views/ReportCaseView.vue'),
      },
      {
        path: 'manage',
        name: 'manage',
        component: () => import('@/views/ManageView.vue'),
      },
      {
        path: 'caseInfo/:cid',
        name: 'case',
        component: () => import('@/views/CaseInfoView.vue')
      },
    ],
  },
  {
    path: '/login',
    name: 'Login',
    component: () => import('@/views/LoginView.vue'),
  },
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes,
})

export default router
