<template>
    <div>
        <transition :name="fade">
            <!--<router-view class="app-fade"></router-view>-->
            <router-view></router-view>
        </transition>
    </div>
</template>
<script>
    export default {
        data() {
            return {
                fade: 'app-fadein'
            };
        },
        mounted() {

        },
        beforeDestroy() {

        },
        methods: {},
        watch: {
            '$route'(to, from) {
                const toDepth = to.path.split('/').length
                const fromDepth = from.path.split('/').length
                this.fade = toDepth > fromDepth ? 'app-fadein' : 'app-fadeout'
            }
        }
    };
</script>
<style>
    .app-fade {
        /*position: relative;*/
        transition: all .8s cubic-bezier(.55, 0, .1, 1);
    }

    .app-fadein-enter-active {
        z-index: 1;
        transform: translate(0px, 0)
    }

    .app-fadein-leave-active {
        z-index: 0;
    }

    .app-fadein-enter {
        transform: translate(96%, 0)
    }

    .app-fadeout-enter-active {
        z-index: 0;
    }

    .app-fadeout-leave-active {
        z-index: 1;
        transform: translate(100%, 0);
    }
</style>