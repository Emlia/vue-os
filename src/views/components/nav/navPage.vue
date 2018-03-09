<template>
    <div class="wrapper">
        <div class="left">
            <div v-if="back" @click="clickLeft">
                <Icon type="android-arrow-back" size="25" color="#80848f"></Icon>
            </div>
            <slot name="left">
            </slot>
        </div>
        <slot name="center">

        </slot>
        <div class="right">
            <!--<div @click="$router.push('adminManagement')">-->
                <!--<Icon type="gear-a" size="25" color="#80848f"></Icon>-->
            <!--</div>-->
            <slot name="right"></slot>
        </div>
    </div>
</template>

<script>
    export default {
        name: "navPage",
        props: {
            back: {
                type: Boolean,
                default() {
                    return true
                }
            }
        },
        methods: {
            clickLeft() {
                this.$router.go(-1)
            }
        }
    }
</script>

<style scoped>
    .wrapper {
        display: flex;
        flex-direction: row;
        justify-content: space-between;
        align-items: center;
        height: 40px;
        width: 100%;
        border-bottom: 1px solid #eee;
    }

    .left {
        margin-left: 15px;
    }

    .right {
        margin-right: 15px;
    }
</style>