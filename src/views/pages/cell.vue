<template>
    <div>
        <navPage/>
        <whitespace @click="show = false" class="whitespace">
            <div>{{showType}}</div>
            <div class="tag-wrapper">
                <div class="tag">章节:{{showChapter}}</div>
            </div>
            <div class="tag-wrapper">
                <div class="tag" v-for="(tagitem,index) in  showTags" :key="index">{{tagitem}}</div>
            </div>
            <div class="text">{{question.text}}
            </div>
            <radio :question="question"
                   :myAnswer="myAnswers[question.id]"
                   @click="mRadio"
            />
            <div v-show="showAnalysis">
                <div class="analysis-wapper">
                    <div class="analysis-font">答案 {{answerText}}</div>
                    <Button style="color:deepskyblue" shape="circle" @click="next">下一题</Button>
                </div>
                <div class="analysis-font analysis-center">
                    答案详解
                </div>

                <div class="analysis-font">{{question.analysis}}</div>
            </div>
        </whitespace>
        <bottomPanel
                :collections="myCollections"
                @selected="selected"
                @collect="collect"
                :num="questions.length"
                :pos="cPosition" :show="show" @ctop="ctop"/>
    </div>
</template>

<script>
    import radio from '../components/radio/radio'
    import whitespace from '../components/whitespace/whitespace'
    import bottomPanel from '../components/bottomPanel/bottomPanel'
    import navPage from '../components/nav/navPage'

    export default {
        name: "cell",
        components: {radio, whitespace, bottomPanel, navPage},
        props: {
            questions: {
                type: Array,
                default() {
                    return []
                }
            },
            myAnswers: {
                type: Object,
                default() {
                    return {}
                }

            }
        },
        data() {
            return {
                cPosition: 0,
                show: false,
                showAnalysis: false,
                myCollections: [],
            }
        },
        methods: {
            next() {
                this.cPosition = (this.cPosition + 1) % this.questions.length
            },
            selected(value) {
                this.cPosition = value - 1
            },
            collect() {
                console.log('collect-', this.cPosition)
            },
            ctop() {
                this.show = !this.show
            },
            addAnswer(value) {
                this.$store.commit('addAnswer', {id: value.id, value: [value.value]})
            },
            mRadio(value) {
                // 如果是单选
                if (this.showType == '单选') {
                    if (this.myAnswers.hasOwnProperty(value.id)) {
                        return
                    }

                    this.addAnswer(value)

                    let answer = this.question.answer
                    if (value.value === answer[0]) {
                        this.showAnalysis = false
                        this.next()
                    } else {
                        this.showAnalysis = true
                    }
                } else {

                }
            },

        },
        computed: {
            answerText() {
                return this.question.answer.join(' ')
            },
            question() {
                var temp = this.questions[this.cPosition]
                if (temp === undefined) {
                    return {
                        id: 0,
                        type: 0,
                        tag: [],
                        chapter: 0,
                        answer: [],
                        text: '',
                        src: '',
                        analysis: '',
                        options: []
                    }
                }
                if (typeof temp.options === 'string') {
                    temp.options = JSON.parse(temp.options)
                    temp.tag = JSON.parse(temp.tag)
                    temp.answer = JSON.parse(temp.answer)
                }
                return temp
            },
            showTags() {
                return this.$store.getters.showTags
            },
            showChapter() {
                return this.$store.getters.showChapter
            },
            showType() {
                return this.$store.getters.showType
            },
            type() {
                return this.$store.state.etype
            }
        }
    }
</script>

<style scoped>
    .whitespace {
        overflow: scroll;
        position: absolute;
        top: 40px;
        bottom: 40px;
        width: 100%;
    }

    .tag-wrapper {
        display: flex;
        flex-direction: row;
        justify-content: flex-start;
        align-items: flex-start;
    }

    .tag {
        color: #2d8cf0;
        margin-right: 10px;
        font-size: 12px;
    }

    .text {
        font-size: 18px;
        margin-top: 5px;
        margin-bottom: 10px;
    }

    .analysis-center {
        text-align: center;
        margin-bottom: 5px;
    }

    .analysis-wapper {
        display: flex;
        width: 100%;
        justify-content: space-between;
        align-items: center;
        margin-top: 10px;
        margin-bottom: 10px;
    }

    .analysis-font {
        font-size: 18px;
    }
</style>