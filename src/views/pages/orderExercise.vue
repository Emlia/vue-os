<template>
    <div>
        <navPage/>
        <whitespace @click="show = false" class="whitespace">
            <!--<div>{{questions}}</div>-->
            <!--<div>{{$store.getters.showTF}}</div>-->
            <!--<div>{{$store.getters.showTags}}</div>-->
            <!--<div>myAnswers :{{JSON.stringify(myAnswers)}}</div>-->
            <div class="tag-wrapper">
                <div class="tag" v-for="(tagitem,index) in  $store.getters.showTags" :key="index">{{tagitem}}</div>
            </div>
            <div class="tag-wrapper">
                <div class="tag">章节:{{$store.getters.showChapter}}</div>
            </div>

            <!--<div class="tag-wrapper">-->
            <!--<div class="type">{{types[question.type].label}}</div>-->
            <!--</div>-->


            <div class="text">{{question.text}}
            </div>
            <radio :question="question"
                   :myAnswer="myAnswers[this.question.id]"
                   @click="mRadio"
            />
            <div v-show="showAnalysis">
                <div class="analysis-wapper">
                    <div class="analysis-font">答案 {{this.question.answer}}</div>
                    <Button style="color:deepskyblue" shape="circle" @click="next">下一题</Button>
                </div>


                <div class="analysis-font analysis-center">
                    答案详解
                </div>

                <div class="analysis-font">{{this.questions[this.cPosition].analysis}}</div>
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
                tags: [],
                types: [{label: '', value: 0}],
                chapters: [],
                myAnswers: {},
                myCollections: [],
                questions: [
                    {
                        id: 0,
                        type: 0,
                        tag: 0,
                        chapter: 0,
                        answer: '',
                        text: '??',
                        src: '',
                        analysis: '',
                        options: ''
                    }
                ],
                question: {
                    id: 0,
                    type: 0,
                    tag: 0,
                    chapter: 0,
                    answer: '',
                    text: '',
                    src: '',
                    analysis: '',
                    options: ''
                },
                qqq: {t: [], f: []}
            }
        },
        created() {
            this.getTags()
            this.getTypes()
            this.getCapters()
            this.getQuestions()
            this.$store.commit('getQuestions')
            this.$store.commit('getTags')
            this.$store.commit('getChapters')
            // this.$store.commit('getQuestion', this.cPosition)
        },
        methods: {
            next() {
                this.cPosition = (this.cPosition + 1) % this.questions.length
                this.question = this.questions[this.cPosition]
            },
            selected(value) {
                this.cPosition = value - 1
                this.question = this.questions[value - 1]
            },
            ctop() {
                this.show = !this.show
            },
            mRadio(value) {
                // 如果是单选
                if (true) {
                    let temp = {}
                    temp[value.id] = []
                    temp[value.id][0] = value.value
                    this.myAnswers = Object.assign({}, this.myAnswers, temp)
                    this.$store.commit('addMyAnswer', {key: value.id, value: [value.value]})
                    let answer = JSON.parse(this.question.answer)
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
            getQuestions() {
                axios.get('http://localhost/php-ci-os/index.php/Os/getQuestions').then((response) => {
                    this.res = response.data
                    this.questions = this.res.data
                    // this.question = Object.assign({}, this.question, this.questions[0])
                    this.question = this.questions[0]
                    // console.log('data', this.questions)
                }).catch(function (error) {
                    console.log(error);
                });
            },
            getCapters() {
                axios.get('http://localhost/php-ci-os/index.php/Os/getChapters'
                ).then((res) => {
                    let temp = res.data.data
                    let ch = []
                    temp.forEach(item => {
                        ch.push({label: item.name, value: item.id})
                    })
                    this.chapters = ch
                }).catch(function (error) {
                    console.log(error);
                });
            },
            getTags() {
                axios.get('http://localhost/php-ci-os/index.php/Os/getTags'
                ).then((res) => {
                    let temp = res.data.data
                    let ch = []
                    temp.forEach(item => {
                        ch.push({label: item.label, value: item.id})
                    })
                    this.tags = ch
                }).catch(function (error) {
                    console.log(error);
                });
            },
            getTypes() {
                axios.get('http://localhost/php-ci-os/index.php/Os/getTypes'
                ).then((res) => {
                    let temp = res.data.data
                    let ch = []
                    temp.forEach(item => {
                        ch.push({label: item.label, value: item.id})
                    })
                    this.types = ch
                }).catch(function (error) {
                    console.log(error);
                });
            }
        },
        watch: {
            myAnswers: {
                handler: function (val, oldVal) {
                    // console.log('answer', val)
                },
                deep: true
            },
            question(val) {
                // console.log('question', val)
            },
            cPosition(value) {
                this.$store.commit('getQuestion', value)
            },
            '$store.state.myAnswers': {
                handler: function (val, oldVal) {
                    // let temp = []
                    // this.questions.forEach(item => {
                    //     console.log('eee')
                    //     temp = val
                    //     if (temp[item.id] !== undefined) {
                    //         if (temp[item.id][0] === item.answer[0]) {
                    //             this.qqq.t.push(item.id)
                    //         } else {
                    //             this.qqq.f.push(item.id)
                    //         }
                    //     }
                    // })

                },
                deep: true
            }
        },
        computed: {
            // showT: function () {
            //     let t = []
            //     let f = []
            //     let temp = []
            //     this.$store.state.questions.forEach(item => {
            //         console.log('eee')
            //         temp = this.$store.state.myAnswers
            //         if (temp[item.id] != undefined) {
            //             if (temp[item.id][0] == item.answer[0]) {
            //                 t.push(item.id)
            //             } else {
            //                 f.push(item.id)
            //             }
            //         }
            //     })
            //     return {t, f}
            // }
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