<template>
    <div>
        <!--<transition name="fade">-->
            <!-- 这里不会被keepalive -->
            <router-view v-if="!$route.meta.keepAlive"></router-view>
        <!--</transition>-->
    </div>
</template>
<script>
    export default {
        data() {
            return {};
        },
        mounted() {

        },
        beforeDestroy() {

        },
        methods: {},
        watch: {
            '$route'(to, from) {

            }
        }
    };
</script>
<style scoped>
    .fade-enter-active, .fade-leave-active {
        transition: opacity .5s;
    }

    .fade-enter, .fade-leave-to /* .fade-leave-active below version 2.1.8 */
    {
        opacity: 0;
        /*transform: translateX(-100%);*/
    }
</style>