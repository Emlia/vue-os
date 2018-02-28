import index from './views/index'
import register from './views/pages/register'
import login from './views/pages/login'
import home from './views/pages/home'
import orderExercise from './views/pages/orderExercise'
import chapterExercise from './views/pages/chapterExercise'
import homework from './views/pages/homework'
import errorQuestion from './views/pages/errorQuestion'

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
        component: orderExercise
    },
    {
        path: '/chapterExercise',
        component: chapterExercise
    },
    {
        path: '/homework',
        component: homework
    },
    {
        path: '/errorQuestion',
        component: errorQuestion
    },

];
export default routers;