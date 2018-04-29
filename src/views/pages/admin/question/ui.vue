<template>
    <div class="wrapper">
        <div class="title">{{title}}</div>
        <!--<div class="title">{{question}}</div>-->
        <div class="cell">
            <div class="cell-title">类型</div>
            <Select v-model="question.type" style="width: 60%">
                <Option v-for="item in types" :value="item.id" :key="item.value">{{ item.label }}</Option>
            </Select>
        </div>
        <div class="cell">
            <div class="cell-title">章节</div>
            <Select v-model="question.chapter" style="width: 60%">
                <Option v-for="item in chapters" :value="item.id" :key="item.value">{{ item.label }}</Option>
            </Select>
        </div>
        <div class="cell">
            <div class="cell-title">题干</div>
            <Input v-model="question.text" type="textarea" placeholder="请输入题干.eg:您的幸运号码是多少?" clearable
                   style="width: 60%"/>
        </div>
        <!--<div class="cell">-->
        <!--<div class="cell-title">图片</div>-->
        <!--<Input v-model="question.src" placeholder="请输入图片的url地址.eg:www.baidu.com." clearable style="width: 60%"/>-->
        <!--</div>-->
        <div class="cell">
            <div class="cell-title">选项</div>
        </div>
        <div class="cell" v-for="(item,index) in question.options" :key="index">
            <div class="cell-title cell-option-wrapper">
                <div class="cell-option">{{abc[index]}}</div>
            </div>
            <Input v-model="question.options[index]" type="textarea"
                   :placeholder="`请输入答案.eg:我的幸运号码是${index}`" clearable
                   style="width: 60%"/>
            <div @click="sub(index)" v-show="index !=0" class="icon-sub">
                <Icon type="minus-circled" color="#ff0000" size="20"></Icon>
            </div>
        </div>
        <div class="btn-add-wrapper">
            <Button v-show="question.options.length<8" class="btn-add" @click="question.options.push('')">添加</Button>
        </div>
        <div class="cell" v-if="multiple">
            <div class="cell-title">答案</div>
            <Select key="ee1" multiple v-model="question.answer" style="width: 60%">
                <Option v-for="i in question.options.length" :value=" abc[i-1]" :key="i">{{ abc[i-1] }}</Option>
            </Select>
        </div>
        <div class="cell" v-else>
            <div class="cell-title">答案</div>
            <Select key="ee2" v-model="question.answer[0]" style="width: 60%">
                <Option v-for="i in question.options.length" :value=" abc[i-1]" :key="i">{{ abc[i-1] }}</Option>
            </Select>
        </div>
        <div class="cell">
            <div class="cell-title">解析</div>
            <Input v-model="question.analysis" type="textarea" placeholder="请输入解析.eg:本题是一道开放题,言之有理即可." clearable
                   style="width: 60%"/>
        </div>
    </div>
</template>

<script>
    import whitespace from '../../../components/whitespace/whitespace'
    import navPage from '../../../components/nav/navPage'
    import util from '../../../../libs/util'
    import _ from 'lodash'

    export default {
        components: {whitespace, navPage},
        name: "ui",
        props: {
            title: {
                type: String,
                default() {
                    return ''
                }
            },
            initData: {
                // type: Object,
                default() {
                    return {}
                }
            }
        },
        data() {
            return {
                abc: ['A', 'B', 'C', 'D', 'E', 'F', 'G', "H"],
                // tags: [],
                question: {
                    tag: [],
                    chapter: 0,
                    type: 1,
                    answer: [],
                    text: '',
                    src: '',
                    analysis: '',
                    options: ['', '', '', ''],
                }
            }
        },
        created() {
            let temp = util.toQuestion(this.initData)
            if (Object.keys(temp).length == 9) {
                this.question = temp
                // this.$set(this.question, 'answer', temp.answer)
            }

        },
        mounted() {
            // this.$store.commit('getTags')
            this.$store.commit('getChapters')
            this.$store.commit('getTypes')
            this.$store.commit('getAnswers')
        },
        methods: {
            sub(index) {
                this.question.options.splice(index, 1)
            },
        },
        watch: {
            question: {
                handler: function (val, oldVal) {
                    this.$emit('questionChange', val)
                },
                deep: true
            },
            initData(value) {
                let temp = util.toQuestion(this.initData)
                // console.log('77777777777', temp)
                if (Object.keys(temp).length == 9) {
                    this.question = temp
                    // this.$set(this.question, 'answer', temp.answer)
                }
            }
        },
        computed: {
            myAnswer() {
                if (this.multiple) {
                    return this.question.answer
                } else {
                    return this.question.answer[0]
                }
            },
            multiple() {
                // this.question.answer = []
                if (this.getType.length == 0) {
                    return false
                }
                if (this.getType.length == 1) {
                    if (this.getType[0].label == '多选')
                        return true
                    else
                        return false
                }
            },
            getType() {
                return this.types.filter(item => {
                    if (item.id == this.type) {
                        return true
                    }
                    return false
                })
            },
            types() {
                return this.$store.state.types
            },
            chapters() {
                return this.$store.state.chapters
            }
        }
    }
</script>

<style scoped>
    .wrapper {

    }

    .title {
        font-size: 18px;
        padding-left: 5px;
        border-left: #2db7f5 4px solid;
        margin-bottom: 15px;
    }

    .cell {
        display: flex;
        flex-direction: row;
        align-items: center;
        margin-top: 10px;
    }

    .cell-title {
        width: 30%;
        font-size: 15px;
    }

    .cell-option-wrapper {
        display: flex;
        justify-content: flex-start;
        align-items: flex-start;
    }

    .cell-option {
        width: 25px;
        height: 25px;
        text-align: center;
        line-height: 22px;
        font-size: 17px;
        border-radius: 50%;
        background-color: #2db7f5;
        border: #eee 2px solid;
        color: #fff;
    }

    .btn-add-wrapper {
        display: flex;
        justify-content: flex-end;
        align-items: center;
    }

    .btn-add {
        margin-top: 10px;
        margin-right: 10%;
    }

    .icon-sub {
        width: 8%;
        display: flex;
        justify-content: center;
        align-items: center;
    }

</style>