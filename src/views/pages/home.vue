<template>
    <div class="wrapper">
        <navPage/>
        <Carousel autoplay v-model="value" loop>
            <CarouselItem>
                <div class="demo-carousel">
                    <img class="img" src="http://oxjvsyqoj.bkt.clouddn.com/Grp1%2000469.png" alt="">
                </div>
            </CarouselItem>
            <CarouselItem>
                <div class="demo-carousel">
                    <img class="img" src="http://oxjvsyqoj.bkt.clouddn.com/Grp1%2001770.png" alt="">
                </div>
            </CarouselItem>
            <CarouselItem>
                <div class="demo-carousel">
                    <img class="img" src="http://oxjvsyqoj.bkt.clouddn.com/Grp1%2001807.png" alt="">
                </div>
            </CarouselItem>
        </Carousel>

        <Alert style="margin-top: 10px;" type="warning" show-icon closable>本程序可能于 1018年3月1日更新</Alert>


        <div class="wrapper-selector">
            <Alert type="success">
                <Button @click="$router.push('orderExercise')">顺序练习</Button>
                <template slot="desc">
                    一题一题做,一点一点成长~
                </template>
            </Alert>
            <Alert type="success">

                <Button @click="$router.push('chapterExercise')">章节练习</Button>
                <template slot="desc">
                    针对每个章节,进行强化训练~
                </template>
            </Alert>
            <Alert type="success">

                <Button @click="$router.push('homework')">随机出题</Button>

                <template slot="desc">
                    随机生成50道题,检验自己~
                </template>
            </Alert>
            <Alert type="success">

                <Button @click="$router.push('errorQuestion')">错题本</Button>

                <template slot="desc">
                    错题虐我千百遍,我待错题如初恋~
                </template>
            </Alert>
        </div>


    </div>

</template>

<script>
    import navPage from '../components/nav/navPage'

    export default {
        name: "home",
        components: {navPage},
        created() {
            if (this.$store.state.user.id == '') {
                this.$router.replace('/login')
            }
        },
        data() {
            return {
                value: 0
            }
        }
    }
</script>

<style scoped>
    .wrapper {

    }

    .wrapper-selector {
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
</style>