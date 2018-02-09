import index from './views/index'
import register from './views/pages/register'
import login from './views/pages/login'
import home from './views/pages/home'


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
    }
];
export default routers;