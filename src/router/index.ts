import { createRouter, createWebHistory } from 'vue-router'
import MainPage from '../views/MainPage.vue'



const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
  {
      path: '/',
      name: 'main',
      component: MainPage
    },
    {
      path: '/grupy',
      name: 'groups',
      component: () => import('../views/GroupsPage.vue')
    },
    {
      path: '/statystyki',
      name: 'statistics',
      component: () => import('../views/StatisticsPage.vue')
    },
    {
      path: '/kalendarz',
      name: 'kalendarz',
      component: () => import('../views/CalendarPage.vue')
    }
  ],
})

export default router
