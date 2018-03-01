<template>
    <div class="wrapper">
        <div class="left">
            <div @click="clickLeft">
                <Icon type="android-arrow-back" size="25" color="#80848f"></Icon>
            </div>
        </div>
        <div class="center">
            标题
        </div>
        <div class="right">
            <Icon type="gear-a" size="25" color="#80848f"></Icon>
        </div>
    </div>
</template>

<script>
    export default {
        name: "navPage",
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