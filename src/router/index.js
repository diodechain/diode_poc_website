import Vue from 'vue'
import Router from 'vue-router'
import Rpi from '@/components/Rpi'

Vue.use(Router)

export default new Router({
  mode: 'history',
  routes: [
    {
      path: '/',
      name: 'Rpi',
      component: Rpi
    }
  ]
})
