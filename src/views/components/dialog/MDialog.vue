<template>
    <div class="dialog-wrapper" >
        <div class="mask" @click="$emit('maskClick')"></div>
        <div class="dialog-item" @click="$emit('panelClick')">
            <!--<div class="dialog-item-title">标题</div>-->
            <slot></slot>
            <div v-if="bottom" class="dialog-item-bottom">
                <div @click="$emit('left')" class="dialog-item-bottom-text" style="border-right: 1px solid #eee;">重新开始
                </div>
                <div @click="$emit('right')" class="dialog-item-bottom-text">继续上次</div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        name: "MDialog",
        props: {
            bottom: {
                type: Boolean,
                default() {
                    return true
                }
            }
        }
    }
</script>

<style scoped>
    .dialog-wrapper {
        position: absolute;
        display: flex;
        top: 0;
        bottom: 0;
        left: 0;
        right: 0;
        justify-content: center;
        align-items: center;
        z-index: 777;
    }

    .mask {
        position: fixed;
        top: 0;
        bottom: 0;
        left: 0;
        right: 0;
        background-color: rgba(0, 0, 0, 0.5);
        z-index: 888;
    }

    .dialog-item {
        width: 70%;
        /*height: 130px;*/
        border-radius: 5px;
        background-color: #fff;
        display: flex;
        flex-direction: column;
        justify-content: flex-start;
        align-items: center;
        z-index: 999;
    }

    .dialog-item-bottom {
        width: 100%;
        display: flex;
        flex-direction: row;
        justify-content: flex-start;
        align-items: center;
    }

    .dialog-item-bottom-text {
        width: 50%;
        height: 30px;
        text-align: center;
        line-height: 25px;
        font-size: 16px;
        border-top: 1px solid #eee;
    }

    .dialog-item-title {
        font-size: 18px;
    }
</style>