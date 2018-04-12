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
            // 实际为myAnswers[question.id]
            myAnswer: {
                type: Array,
                default() {
                    return [];
                }
            },
            answer: {
                type: Array,
                default() {
                    return [];
                }
            }
        },
        data() {
            return {}
        },
        methods: {
            // a包含b
            arrayIsContain(a, b) {
                if (a && b && b.length != 0) {
                    for (let i = 0; i < b.length; i++) {
                        // console.log(`包含的判断 ${b[i]}  ${a.includes(b[i])} a=  ${a}; b= ${b}`)
                        if (!a.includes(b[i])) {
                            return false
                        }
                    }
                    return true
                } else {
                    return false
                }

            }
        },
        watch: {},
        computed: {
            showType() {
                for (let i = 0; i < this.types.length; i++) {
                    if (this.types[i].id == this.value.question.type) {
                        return this.types[i].label
                    }
                }
                return '未注册题目类型'
            },
            types() {
                return this.$store.state.types
            },
            type() {

                // console.log(`value=${this.value.value}--answer=${this.answer}--myAnswer${this.myAnswer}`)
                // if (this.showType == '单选') {
                //     // 如果有这题答案的话
                //     if (this.myAnswer) {
                //         //如果选中该按钮
                //         if (this.myAnswer[0] === this.value.value) {
                //             //如果答案是该按钮
                //             if (this.value.value === this.answer[0]) {
                //                 return 'true'
                //             } else {
                //                 return 'false'
                //             }
                //         } else {
                //             if (this.value.value === this.answer[0]) {
                //                 return 'true'
                //             } else {
                //                 return 'text'
                //             }
                //         }
                //     } else {
                //         return 'text'
                //     }
                // } else
                if (this.showType == '单选' || this.showType == '多选') {
                    // 如果答案列表中有这题答案的话,未作答时为[]
                    // console.log(`${this.value.question.id}这题用户是否作答 ${this.myAnswer}`)
                    if (this.myAnswer.length != 0) {
                        // 如果  标准答案 包含 我的答案
                        if (this.arrayIsContain(this.answer, this.myAnswer)) {
                            console.log('---- 标准答案 包含 我的答案-----')

                            // 该按钮被选中
                            if (this.myAnswer.includes(this.value.value)) {
                                return 'true'
                            } else {
                                return 'text'
                            }

                            // 我的答案正好出现了错误答案
                        } else {
                            console.log('----我的答案正好出现了错误答案-----')
                            // 该按钮被选中
                            if (this.myAnswer.includes(this.value.value)) {
                                if (this.answer.includes(this.value.value)) {
                                    // console.log('===> 该按钮被选中  true')
                                    return 'true'
                                } else {
                                    // console.log('===> 该按钮被选中  false')
                                    return 'false'
                                }
                            } else {
                                if (this.answer.includes(this.value.value)) {
                                    // console.log('===> 该按钮未选中  true')
                                    return 'true'
                                } else {
                                    // console.log('===> 该按钮未选中  text')
                                    return 'text'
                                }
                            }
                        }
                    } else {
                        console.log('----该题目 我没有作答 -----')
                        return 'text'
                    }
                }

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
        width: 25px;
        height: 25px;
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