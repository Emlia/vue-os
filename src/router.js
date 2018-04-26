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
import QEditUI from './views/pages/admin/question/editui'
import QEdit from './views/pages/admin/question/edit'
import QAll from './views/pages/admin/question/all'
import TAdd from './views/pages/admin/tag/add'
import TEdit from './views/pages/admin/tag/edit'
import TAll from './views/pages/admin/tag/all'
import forgetPassword from './views/pages/forgetPassword'
import resetPassword from './views/pages/resetPassword'
import noticeEdit from './views/pages/admin/notice/edit'

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
        path: '/forgetPassword',
        component: forgetPassword
    },
    {
        path: '/admin/resetPassword',
        component: resetPassword
    },
    {
        path: '/home',
        component: home
    },
    {
        path: '/orderExercise',
        component: orderExercise,
        // meta: {keepAlive: false} // 这是不会被keepalive的
    },
    {
        path: '/chapterExercise/:id',
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
        path: '/admin/Management',
        component: adminManagement
    },
    {
        path: '/admin/question/edit',
        component: QEditUI
    },
    {
        path: '/admin/question/edit/:id',
        component: QEdit
    },
    {
        path: '/admin/question/all',
        component: QAdd
    },
    {
        path: '/admin/notice/edit',
        component: noticeEdit
    }

];
export default routers;