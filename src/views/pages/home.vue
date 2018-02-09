<template>
    <div class="wrapper">

        <Carousel autoplay v-model="value" loop>
            <CarouselItem>
                <div class="demo-carousel">1</div>
            </CarouselItem>
            <CarouselItem>
                <div class="demo-carousel">2</div>
            </CarouselItem>
            <CarouselItem>
                <div class="demo-carousel">3</div>
            </CarouselItem>
            <CarouselItem>
                <div class="demo-carousel">4</div>
            </CarouselItem>
        </Carousel>

        <Alert type="warning" show-icon closable>A warning prompt</Alert>


        <div class="wrapper-selector">
            <Alert type="success">
                顺序练习
                <template slot="desc">Content of prompt. Content of prompt. Content of prompt. Content of prompt.
                </template>
            </Alert>
            <Alert type="success">
                章节练习
                <template slot="desc">Content of prompt. Content of prompt. Content of prompt. Content of prompt.
                </template>
            </Alert>
            <Alert type="success">
                课后习题
                <template slot="desc">Content of prompt. Content of prompt. Content of prompt. Content of prompt.
                </template>
            </Alert>
            <Alert type="success">
                错题本
                <template slot="desc">Content of prompt. Content of prompt. Content of prompt. Content of prompt.
                </template>
            </Alert>
        </div>


    </div>

</template>

<script>

    export default {
        name: "home",
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
        text-align: center;
        background: #2d8cf0;
        color: white;
    }
</style>