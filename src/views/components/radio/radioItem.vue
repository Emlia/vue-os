<template>
    <div class="wrapper" @click="$emit('click',value.value)">
        <div class="value" v-show="type==='text' ">{{value.value}}</div>
        <div class="icon-wrapper" v-show="type === 'true'">
            <Icon class="icon" size="25" color="#fff" type="ios-checkmark-empty"/>
        </div>
        <div class="icon-wrapper" style="background-color: #ed3f14" v-show="type === 'false'">
            <Icon class="icon" size="25" color="#fff" type="ios-close-empty"/>
        </div>

        <div class="label">{{value.label}}</div>
    </div>
</template>

<script>
    export default {
        name: "radio-item",
        props: {
            value: {
                type: Object,
                default() {
                    return {}
                }
            },
            myAnswer: {
                type: String,
                default() {
                    return '';
                }
            },
            answer: {
                type: String,
                default() {
                    return '';
                }
            }
        },
        data() {
            return {
                type: 'text'
            }
        },
        methods: {
            // clickRadio(value) {
            //     this.$emit('selectedItem', value)
            // }
        },
        watch: {
            myAnswer(value) {
                if (value) {
                    //如果选中该按钮
                    if (value === this.value.value) {
                        //如果答案是该按钮
                        if (this.value.value === this.answer) {
                            this.type = 'true'
                        } else {
                            this.type = 'false'
                        }
                    } else {
                        if (this.value.value === this.answer) {
                            this.type = 'true'
                        } else {
                            this.type = 'text'
                        }
                    }
                } else {
                    this.type = 'text'
                }
                // console.log('item', value, this.value.value, value === this.value.value)
            }
        }
    }
</script>

<style scoped>
    .wrapper {
        display: flex;
        flex-direction: row;
        justify-content: flex-start;
        align-items: flex-start;
    }

    .value {
        width: 25px;
        height: 25px;
        line-height: 22px;
        text-align: center;
        font-size: 15px;
        border: 2px solid #eee;
        border-radius: 50%;

    }

    .icon-wrapper {
        display: flex;
        justify-content: center;
        align-items: center;
        border: 2px solid #eee;
        background: #2db7f5;
        width: 26px;
        height: 26px;
        border-radius: 50%;
    }

    .icon {

    }

    .label {
        margin-left: 15px;
        font-size: 18px;
        width: 80%;
    }
</style>