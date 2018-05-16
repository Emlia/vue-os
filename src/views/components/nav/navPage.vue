<template>
    <div class="nav-wrapper">
        <div class="nav-left">
            <div v-if="back" @click="clickLeft">
                <Icon type="android-arrow-back" size="25" color="#80848f"></Icon>
            </div>
            <slot name="left">
            </slot>
        </div>
        <slot name="center">

        </slot>
        <div class="nav-right">
            <slot name="right"></slot>
            <!--<div style="margin-left: 10px;" @click="setting=true">-->
            <!--<Icon type="gear-a" size="25" color="#80848f"></Icon>-->
            <!--</div>-->

        </div>
        <!--<Modal style="width: 60%"-->
        <!--title="设置"-->
        <!--v-model="setting"-->
        <!--&gt;-->
        <!--<p>Content of dialog</p>-->
        <!--<p>Content of dialog</p>-->
        <!--<p>Content of dialog</p>-->
        <!--</Modal>-->
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
        data() {
            return {
                setting: false
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
    .nav-wrapper {
        display: flex;
        flex-direction: row;
        justify-content: space-between;
        align-items: center;
        height: 40px;
        width: 100%;
        border-bottom: 1px solid #eee;
    }

    .nav-left {
        display: flex;
        flex-direction: row;
        justify-content: flex-start;
        align-items: center;
        margin-left: 15px;
    }

    .nav-right {
        display: flex;
        flex-direction: row;
        justify-content: flex-start;
        align-items: center;
        margin-right: 15px;
    }

    .left-left {
        margin-left: 10px;
        color: #666;
        font-size: 13px;
        cursor: pointer;
    }

    .vertical-center-modal {
        width: 60%;
        display: flex;
        align-items: center;
        justify-content: center;

    }
</style>