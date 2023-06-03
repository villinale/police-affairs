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
