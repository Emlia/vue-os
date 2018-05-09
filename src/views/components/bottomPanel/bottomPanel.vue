<template>
    <div class="wrapper">
        <div class="top" @click="cTop" :style="setting.model?day:night">
            <div class="left" @click="collect">
                <!--<Icon type="ios-star-outline" size="25" color="#80848f"></Icon>-->
                <!--<div class="font">收藏</div>-->
                <!--<div> {{TF}}</div>-->
            </div>
            <div class="center" :title="`答题正确${TF.t.length},答题错误${TF.f.length}`">
                <Icon type="ios-checkmark-outline" size="25" color="#80848f"></Icon>
                <div class="font" style="color:#5cadff">{{TF.t.length}}</div>
                <Icon type="ios-close-outline" size="25" color="#80848f"></Icon>
                <div class="font" style="color:#ed3f14">{{TF.f.length}}</div>
            </div>
            <div class="right" :title="`当前位置${pos+1},题目总数${num.length}`">
                <Icon type="grid" size="25" color="#80848f"></Icon>
                <div class="font">{{pos+1}}/{{num.length}}</div>
            </div>
        </div>
        <div v-show="show" class="bottom" :style="setting.model?day:night">
            <div @click="clickT(item)"
                 :style="{borderColor: `${getColor(item)}`}"
                 class="cell"
                 title="进入该题"
                 v-for="(item,index) in num" :key="item">{{item}}
            </div>
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
                type: Array,
                default() {
                    return []
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
            },
            collections: {
                type: Array,
                default() {
                    return []
                }
            }
        },
        data() {
            return {
                day: {
                    backgroundColor: '#333',
                    color: '#595959'
                },
                night: {
                    backgroundColor: '#fff',
                    color: '#000'
                }
            }
        },
        methods: {
            clickT(value) {
                // console.log('get', value)
                this.$emit('selected', value)
            },
            cTop() {
                this.$emit('ctop')
            },
            collect() {
                this.$emit('collect')
            },
            getColor(id) {

                if (this.TF.t.includes(id)) {
                    return '#5cadff'
                }
                if (this.TF.f.includes(id)) {
                    return '#ed3f14'
                }
                return '#80848f'
            }
        },
        computed: {
            setting() {
                return this.$store.state.setting
            },
            TF() {
                return this.$store.getters.showTF
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

    .center:hover {
        color: #57a3f3;
        background-color: transparent;
        border-color: #57a3f3;
        cursor: pointer;
    }

    .right {
        margin-right: 10px;
        display: flex;
        flex-direction: row;
        align-items: center;
    }

    .right:hover {
        color: #57a3f3;
        background-color: transparent;
        border-color: #57a3f3;
        cursor: pointer;
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

    .cell:hover {
        color: #57a3f3;
        background-color: transparent;
        border-color: #57a3f3;
        cursor: pointer;
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