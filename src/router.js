import index from './views/index'
import register from './views/pages/register'
import login from './views/pages/login'
import home from './views/pages/home'
import orderExercise from './views/pages/orderExercise'
import chapterExercise from './views/pages/chapterExercise'
import chapterUi from './views/pages/chapterUi'
import simulationExercise from './views/pages/simulationExercise'
import errorExercise from './views/pages/errorExercise'
import adminManagement from './views/pages/adminManagement'
import adminAdd from './views/pages/admin/add'
import adminEdit from './views/pages/admin/edit'
import QAdd from './views/pages/admin/question/add'
import QEdit from './views/pages/admin/question/edit'
import QAll from './views/pages/admin/question/all'
import TAdd from './views/pages/admin/tag/add'
import TEdit from './views/pages/admin/tag/edit'
import TAll from './views/pages/admin/tag/all'


const routers = [
    {
        path: '/',
        meta: {
            title: ''
        },
        component: index
    },
    {
        path: '/register',
        component: register
    },
    {
        path: '/login',
        component: login
    },
    {
        path: '/home',
        component: home
    },
    {
        path: '/orderExercise',
        component: orderExercise,
        meta: {keepAlive: false} // 这是不会被keepalive的
    },
    {
        path: '/chapterExercise',
        component: chapterExercise
    },
    {
        path: '/chapterUi',
        component: chapterUi
    },
    {
        path: '/simulationExercise',
        component: simulationExercise
    },
    {
        path: '/errorExercise',
        component: errorExercise
    },
    {
        path: '/adminManagement',
        component: adminManagement
    },
    {
        path: '/adminAdd',
        component: adminAdd
    },
    {
        path: '/adminEdit',
        component: adminEdit
    },
    {
        path: '/QAdd',
        component: QAdd
    },
    {
        path: '/QEdit',
        component: QEdit
    },
    {
        path: '/QAll',
        component: QAll
    },
    {
        path: '/TAdd',
        component: TAdd
    },
    {
        path: '/TEdit',
        component: TEdit
    },
    {
        path: '/TAll',
        component: TAll
    },

];
export default routers;