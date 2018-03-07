<template>
    <div class="wrapper">
        <div class="top" @click="cTop">
            <div class="left">
                <Icon type="ios-star-outline" size="25" color="#80848f"></Icon>
                <div class="font">收藏</div>
            </div>
            <div class="center">
                <Icon type="ios-checkmark-outline" size="25" color="#80848f"></Icon>
                <div class="font" style="color:blue">{{$store.getters.showTF.t.length}}</div>
                <Icon type="ios-close-outline" size="25" color="#80848f"></Icon>
                <div class="font" style="color:red">{{$store.getters.showTF.f.length}}</div>
            </div>
            <div class="right">
                <Icon type="grid" size="25" color="#80848f"></Icon>
                <div class="font">{{pos+1}}/{{num}}</div>
            </div>
        </div>
        <div v-show="show" class="bottom">
            <div @click="clickT(i)" class="cell" v-for="i in num" :key="i">{{i}}</div>
        </div>
        <!--<transition name="slide-fade">-->

        <!--</transition>-->
    </div>
</template>

<script>
    export default {
        name: "bottom-panel",
        props: {
            num: {
                type: Number,
                default() {
                    return 0
                }
            },
            pos: {
                type: Number,
                default() {
                    return 0
                }
            },
            show: {
                type: Boolean,
                default() {
                    return false
                }
            }
        },
        data() {
            return {
                eee: this.$store.getters.showTF
            }
        },
        methods: {
            clickT(value) {
                console.log('get', value)
                this.$emit('selected', value)
            },
            cTop() {
                this.$emit('ctop')
            }
        }
    }
</script>

<style scoped>
    .wrapper {
        width: 100%;
        position: absolute;
        bottom: 0px;
        border-top: 1px solid #eee;

    }

    .top {
        display: flex;
        width: 100%;
        height: 40px;
        flex-direction: row;
        justify-content: space-between;
        align-items: center;
        background: #fff;
        border-bottom: 1px solid #eee;
    }

    .left {
        margin-left: 10px;
        display: flex;
        flex-direction: row;
        align-items: center;
    }

    .center {
        display: flex;
        flex-direction: row;
        align-items: center;
    }

    .right {
        margin-right: 10px;
        display: flex;
        flex-direction: row;
        align-items: center;
    }

    .bottom {
        display: flex;
        flex-direction: row;
        justify-content: flex-start;
        align-items: flex-start;
        flex-wrap: wrap;
        /*overflow: scroll;*/
        overflow-x: hidden;
        overflow-y: auto;

        background: #fff;
        max-height: 300px;
    }

    .font {
        margin-left: 8px;
        margin-right: 20px;
    }

    .cell {
        width: 40px;
        height: 40px;
        font-size: 18px;
        text-align: center;
        line-height: 38px;
        border-radius: 50%;
        border: 1px solid #999;
        margin: 5px 5px;
    }

    /* 可以设置不同的进入和离开动画 */
    /* 设置持续时间和动画函数 */
    /*.slide-fade-enter-active {*/
    /*transition: all .5s ease;*/
    /*}*/

    /*.slide-fade-leave-active {*/
    /*transition: all .5s cubic-bezier(1.0, 0.5, 0.8, 1.0);*/
    /*}*/

    /*.slide-fade-enter, .slide-fade-leave-to*/
    /*!* .slide-fade-leave-active for below version 2.1.8 *!*/
    /*{*/
    /*transform: translateY(100px);*/
    /*opacity: 0;*/
    /*!*position: absolute;*!*/
    /*}*/
</style>