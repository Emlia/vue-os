<template>
    <div class="wrapper">
        <navPage>
            <div slot="left" class="left-left" @click="$router.replace('/login')">
                返回登录
            </div>
            <div v-if="username=='admin'" class="nav-right" slot="right" @click="$router.push('/admin/Management')">
                <div class="left-left">管理员操作</div>
                <Icon type="navicon" size="25" color="#80848f"
                      style="margin-left: 10px;"></Icon>
            </div>
        </navPage>
        <Carousel autoplay v-model="value" loop>
            <CarouselItem>
                <div class="demo-carousel">
                    <img class="img" src="http://img2.imgtn.bdimg.com/it/u=623517359,1993145847&fm=27&gp=0.jpg" alt="">
                </div>
            </CarouselItem>
            <CarouselItem>
                <div class="demo-carousel">
                    <img class="img" src="http://file06.16sucai.com/2016/0507/8e79ee5bc3d1669833c42cc224e7ac84.jpg"
                         alt="">
                </div>
            </CarouselItem>
            <CarouselItem>
                <div class="demo-carousel">
                    <img class="img" src="http://pic.58pic.com/58pic/12/24/25/25458PICEy8.jpg" alt="">
                </div>
            </CarouselItem>
        </Carousel>

        <Alert v-if="mySwitch" style="margin-top: 10px;" type="warning" show-icon closable>{{notice}}</Alert>


        <div class="wrapper-selector">
            <Alert type="success">
                <Button class="home-btn" type="info" @click="$router.push('orderExercise/0')">顺序练习</Button>
                <template slot="desc">
                    <div class="home-label">一题一题做,一点一点成长~</div>

                </template>
            </Alert>
            <Alert type="success">

                <Button class="home-btn" type="success" @click="$router.push('chapterUi')">章节练习</Button>
                <template slot="desc">
                    <div class="home-label">
                        针对每个章节,进行强化训练~
                    </div>
                </template>
            </Alert>
            <Alert type="success">

                <Button class="home-btn" type="warning" @click="$router.push('simulationExercise/0')">随机出题</Button>

                <template slot="desc">
                    <div class="home-label">
                        随机生成50道题,检验自己~
                    </div>

                </template>
            </Alert>
            <Alert type="success">

                <Button class="home-btn" type="error" @click="$router.push('errorExercise/0')">错 题 本</Button>

                <template slot="desc">
                    <div class="home-label">错题虐我千百遍,我待错题如初恋~</div>

                </template>
            </Alert>
        </div>


    </div>

</template>

<script>
    import navPage from '../components/nav/navPage'
    import mixin from '../../libs/mixin'

    export default {
        name: "home",
        components: {navPage},
        mixins: [mixin],
        data() {
            return {
                value: 0
            }
        },
        mounted() {
            this.$store.commit('getConfiguration')
        },
        computed: {
            notice() {
                return this.$store.state.configuration.notice
            },
            mySwitch() {
                return this.$store.state.configuration.switch
            },
            username() {
                return this.$store.state.user.username
            },
        }
    }
</script>

<style scoped>
    .wrapper {

    }

    .wrapper-selector {
        margin-top: 20px;
        margin-left: 10%;
        margin-right: 10%;
    }

    .demo-carousel {
        width: 100%;
        height: 200px;
        background: #fff;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .img {
        height: 100%;
    }

    .home-btn {
        font-size: 13px;
        font-weight: 700;
    }

    .left-left {
        margin-left: 10px;
        color: #666;
        font-size: 14px;
        cursor: pointer;
    }

    .home-label {
        margin-top: 8px;
        margin-left: 50px;
        font-size: 12px;
        font-weight: 400;
    }
</style>