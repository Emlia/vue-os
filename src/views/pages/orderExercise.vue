<template>
    <div>
        <navPage/>
        <whitespace @click="show = false" class="whitespace">
            <!--<div>{{questions}}</div>-->
            <!--<div>{{$store.getters.showTF}}</div>-->
            <!--<div>{{$store.getters.showTags}}</div>-->
            <!--<div>myAnswers :{{JSON.stringify(myAnswers)}}</div>-->
            <div>{{showType}}</div>

            <div class="tag-wrapper">
                <div class="tag">章节:{{showChapter}}</div>
            </div>
            <div class="tag-wrapper">
                <div class="tag" v-for="(tagitem,index) in  showTags" :key="index">{{tagitem}}</div>
            </div>
            <!--<div class="tag-wrapper">-->
            <!--<div class="type">{{types[question.type].label}}</div>-->
            <!--</div>-->


            <div class="text">{{question.text}}
            </div>
            <radio :question="question"
                   :myAnswer="myAnswers[question.id]"
                   @click="mRadio"
            />
            <div v-show="showAnalysis">
                <div class="analysis-wapper">
                    <div class="analysis-font">答案 {{question.answer}}</div>
                    <Button style="color:deepskyblue" shape="circle" @click="next">下一题</Button>
                </div>


                <div class="analysis-font analysis-center">
                    答案详解
                </div>

                <div class="analysis-font">{{question.analysis}}</div>
            </div>
            <!--<div>{{myAnswers[cPosition+1]}}</div>-->

        </whitespace>
        <bottomPanel
                :collections="myCollections"
                @selected="selected"
                :num="questions.length"
                :pos="cPosition" :show="show" @ctop="ctop"/>
    </div>

</template>

<script>
    import radio from '../components/radio/radio'
    import whitespace from '../components/whitespace/whitespace'
    import bottomPanel from '../components/bottomPanel/bottomPanel'
    import navPage from '../components/nav/navPage'
    import axios from "axios"

    export default {
        name: "order-exercise",
        components: {radio, whitespace, bottomPanel, navPage},
        data() {
            return {
                cPosition: 0,
                show: false,
                showAnalysis: false,
                myCollections: [],
            }
        },
        created() {
            if (this.$store.state.user.id == '') {
                this.$router.replace('/login')
                return
            }
            this.$store.commit('getQuestions')
            this.$store.commit('getTags')
            this.$store.commit('getChapters')
            this.$store.commit('getTypes')
        },
        methods: {
            next() {
                this.cPosition = (this.cPosition + 1) % this.questions.length
                // this.$store.commit('')
                // this.question = this.questions[this.cPosition]
            },
            selected(value) {
                this.cPosition = value - 1
                // this.question = this.questions[value - 1]
            },
            ctop() {
                this.show = !this.show
            },
            mRadio(value) {
                // 如果是单选
                if (true) {
                    // let temp = {}
                    // temp[value.id] = []
                    // temp[value.id][0] = value.value
                    // this.myAnswers = Object.assign({}, this.myAnswers, temp)
                    this.$store.commit('addMyAnswer', {key: value.id, value: [value.value]})
                    let answer = this.question.answer
                    // console.log('eee', value.value, answer)
                    if (value.value === answer[0]) {
                        this.showAnalysis = false
                        this.next()
                    } else {
                        this.showAnalysis = true
                    }
                }

                // console.log('aaa', value)
                // console.log('bb', this.myAnswers)
            },
        },
        watch: {
            cPosition(value) {
                this.$store.commit('getQuestion', value)
            },
        },
        computed: {
            question() {
                return this.$store.state.question
            },
            questions() {
                return this.$store.state.questions
            },
            myAnswers() {
                return this.$store.state.myAnswers
            },
            showTags() {
                return this.$store.getters.showTags
            },
            showChapter() {
                return this.$store.getters.showChapter
            },
            showType() {
                return this.$store.getters.showType
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