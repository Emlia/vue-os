<template>
    <div style="width: 100%;height: 100%;">
        <navPage :style="setting.model?day:night">
            <div slot="left" class="left-left" @click="$router.replace('/home')">
                返回首页
            </div>
            <div slot="center" class="left-left">{{`第${Number(questionsIds.indexOf(question.id))+1}题`}}</div>
            <div slot="right" class="nav-right" @click="md=true">
                <div class="left-left">设置</div>
                <Icon type="gear-a" size="25" color="#80848f"
                      style="margin-left: 10px;"></Icon>
            </div>
        </navPage>

        <whitespace @click="show = false" class="whitespace" :style="setting.model?day:night">
            <div :style="{fontSize:`${setting.size*0.6}px`}">{{showType}}</div>
            <div class="tag-wrapper">
                <div class="tag" :style="{fontSize:`${setting.size*0.6}px`}">章节:{{showChapter}}</div>
            </div>
            <!--<div class="tag-wrapper">-->
            <!--<div class="tag" v-for="(tagitem,index) in  showTags" :key="index">{{tagitem}}</div>-->
            <!--</div>-->
            <div class="text"
                 :style="{fontSize:`${setting.size}px`}"
                 v-html="text"
            >
            </div>
            <radio :question="question"
                   :myAnswer="myAnswer"
                   @click="mRadio"
            />
            <div v-show="showAnalysis">
                <div class="analysis-wapper">
                    <div class="analysis-font">答案 {{answerText}}</div>
                    <Button style="color:deepskyblue"
                            class="btn-analysis"
                            shape="circle" @click="forword"
                            :style="setting.model?day:night">上一题
                    </Button>
                    <Button style="color:deepskyblue"
                            class="btn-analysis"
                            shape="circle" @click="next"
                            :style="setting.model?day:night">下一题
                    </Button>
                </div>
                <div class="analysis-font analysis-center">
                    答案详解
                </div>

                <div class="analysis-font" :style="{fontSize:`${setting.size}px`}">{{question.analysis}}</div>
            </div>
        </whitespace>
        <bottomPanel
                :collections="myCollections"
                @selected="selected"
                @collect="collect"
                :num="questionsIds"
                :pos="questionsIds.indexOf(question.id)" :show="show" @ctop="ctop"
        />
        <MDialog class="md-wrapper" v-if="md" :bottom=false @maskClick="()=>{md=false}">
            <div class="md-title">
                设置
            </div>
            <div class="md-item">
                <div class="md-text">重置答案</div>
                <Switch v-model="resetMyAnswer"></Switch>
            </div>
            <div class="md-item">
                <div class="md-text">字体大小</div>
                <Slider v-model="settingSize" class="setting-right" :min="18" :max="35"></Slider>
            </div>
            <div class="md-item">
                <div class="md-text">夜间模式</div>
                <Switch v-model="settingModel"></Switch>
            </div>
        </MDialog>
        <div v-if="username=='admin'" class="edit-q"
             title="修改该题"
             @click="$router.push(`/admin/question/edit/${question.id}`)">
            <Icon type="wrench" size="20"></Icon>
        </div>
        <div v-if="type=='error'" class="edit-del" @click="deleteErrors"
             title="从错题本中移除该题">
            <Icon type="backspace" size="20"></Icon>
        </div>
        <Spin size="large" fix v-if="questions.length==0"></Spin>
    </div>
</template>

<script>
    import radio from '../components/radio/radio'
    import whitespace from '../components/whitespace/whitespace'
    import bottomPanel from '../components/bottomPanel/bottomPanel'
    import navPage from '../components/nav/navPage'
    import MDialog from '../components/dialog/MDialog'
    import util from '../../libs/util'

    export default {
        name: "index-cell",
        components: {radio, whitespace, bottomPanel, navPage, MDialog},
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
                // cPosition: 0,
                show: false,
                // showAnalysis: false,
                myCollections: [],
                AnswerSet: [],
                md: false,
                settingSize: 18,
                settingModel: false,
                resetMyAnswer: false,
                day: {
                    backgroundColor: '#333',
                    color: '#595959'
                },
                night: {
                    backgroundColor: '#fff',
                    color: '#000'
                },
                first: true
            }
        },
        mounted() {
            this.settingSize = this.setting.size
            this.settingModel = this.setting.model
            // if (this.type == 'chapter') {
            //     location.reload()
            // }
        },
        watch: {
            settingModel(value) {
                util.setValue('setting', {size: this.settingSize, model: this.settingModel})
                this.$store.commit('setSetting', {size: this.settingSize, model: this.settingModel})
            },
            settingSize(value) {
                util.setValue('setting', {size: this.settingSize, model: this.settingModel})
                this.$store.commit('setSetting', {size: this.settingSize, model: this.settingModel})
            },
            resetMyAnswer(value) {
                if (value) {
                    this.$store.commit('resetAnswer')
                    this.resetMyAnswer = false
                    this.$Message.success('重置成功')
                    this.$router.go(-1)
                }
            },
            questions(val) {
                // console.log('qqqq', val)
            },
            questionsIds(temp) {
                // console.log(temp)

            }
        },
        methods: {
            next() {
                let temp = this.questionsIds.indexOf(this.question.id)
                let pos = Number(temp)
                pos = (pos + 1) % this.questions.length
                // console.log('wwww', pos)
                this.$router.replace(this.questionsIds[pos])
            },
            forword() {
                let temp = this.questionsIds.indexOf(this.question.id)
                let pos = Number(temp)
                pos = (pos - 1 + this.questions.length) % this.questions.length
                // console.log('wwww', pos)
                this.$router.replace(this.questionsIds[pos])
            },
            selected(value) {
                // console.log('vvv', value)
                this.$router.replace(value)
            },
            collect() {

            },
            deleteErrors() {
                this.$store.commit('deleteErrors', this.question.id)
                this.forword()
            },
            ctop() {
                this.show = !this.show
            },
            mRadio(value) {
                // console.log('???', value)
                // 如果是单选
                if (this.showType == '单选') {
                    // if (this.myAnswers.hasOwnProperty(value.id)) {
                    //     return
                    // }


                    //如果有错误答案或者完全正确,则


                    let a = this.question.answer
                    let b = this.myAnswer
                    let flag = true

                    // console.log(`---length ----${a.length}----${ b.length}---${a}----${b}`)
                    // b中包含a没有的,则flag=false
                    if (a && b) {
                        for (let j = 0; j < b.length; j++) {
                            // console.log(`包含的判断 ${b[j]}  ${a.includes(b[j])} a=  ${a}; b= ${b}`)
                            if (!a.includes(b[j])) {
                                flag = false
                            }
                        }
                    } else {
                        flag = false
                    }
                    // console.log(`${flag}  ${a.length} ${temp.length}`)
                    //选择的过程中
                    if (flag && a.length > b.length) {

                    } else if (flag && a.length == b.length) {
                        //正确
                        return
                    } else {
                        //错误
                        return
                    }

                    this.$store.commit('addAnswer', {id: value.id, value: [value.value]})
                    let res = util.getAnswerState(this.question.answer, [value.value])
                    if (res == 'error') {
                        this.$store.commit('addErrors', this.question.id)
                    }
                    // let answer = this.question.answer
                    // if (value.value === answer[0]) {
                    //     this.next();
                    // }
                } else if (this.showType == '多选') {

                    //如果有错误答案或者完全正确,则


                    let a = this.question.answer
                    let b = this.myAnswer
                    let flag = true

                    // console.log(`---length ----${a.length}----${ b.length}---${a}----${b}`)
                    // b中包含a没有的,则flag=false
                    if (a && b) {
                        for (let j = 0; j < b.length; j++) {
                            // console.log(`包含的判断 ${b[j]}  ${a.includes(b[j])} a=  ${a}; b= ${b}`)
                            if (!a.includes(b[j])) {
                                flag = false
                            }
                        }
                    } else {
                        flag = false
                    }
                    // console.log(`${flag}  ${a.length} ${temp.length}`)
                    //选择的过程中
                    if (flag && a.length > b.length) {

                    } else if (flag && a.length == b.length) {
                        //正确
                        return
                    } else {
                        //错误
                        return
                    }


                    if (this.AnswerSet.includes(value.value)) {
                        this.deleteAnswerSet(value.value)
                    } else {
                        this.AnswerSet.push(value.value)
                    }

                    this.$store.commit('addAnswer', {id: value.id, value: this.getAnswerSet()})
                    // console.log(this.getAnswerSet())
                }
            },
            deleteAnswerSet(value) {
                let set = new Set(this.AnswerSet)
                set.delete(value)
                this.AnswerSet = Array.from(set)
            },
            getAnswerSet() {
                let set = new Set(this.AnswerSet)
                return Array.from(set)
            }
        },
        computed: {
            text() {
                return this.question.text.replace(/\n/g, '<br/>').replace(/\s/g, '&nbsp;')
            },
            questionsIds() {
                let temp = []
                this.questions.forEach(item => {
                    temp.push(item.id)
                })
                if (temp.length != 0 && this.first) {
                    // console.log('重定向')
                    this.first = false
                    this.$router.replace(temp[0])
                }
                return temp
            },
            username() {
                return this.$store.state.user.username
            },
            setting() {
                return this.$store.state.setting
            },
            myAnswer() {
                if (this.myAnswers[this.question.id]) {
                    // console.log('???????????', this.myAnswers[this.question.id])
                    return this.myAnswers[this.question.id]
                } else {
                    return []
                }
            },
            showType() {
                for (let i = 0; i < this.types.length; i++) {
                    if (this.types[i].id == this.question.type) {
                        return this.types[i].label
                    }
                }
                return '未注册题目类型'
            },
            showChapter() {
                for (let i = 0; i < this.chapters.length; i++) {
                    if (this.chapters[i].value == this.question.chapter) {
                        return this.chapters[i].label
                    }
                }
                return '未划分章节'
            },
            showAnalysis() {
                // console.log(`${Object.keys(this.myAnswers)}  ${this.question.id}   ${Object.keys(this.myAnswers).includes(this.question.id)}`)
                if (Object.keys(this.myAnswers).includes(this.question.id) && this.myAnswers[this.question.id].length != 0) {
                    return true
                }
                return false
            },
            answerText() {
                return this.question.answer.join(' ')
            },
            question() {
                this.AnswerSet = []
                return util.getQuestionById(this.questions, this.$route.params.id)
            },
            // the type of exercise
            type() {
                return this.$store.state.etype
            },
            chapters() {
                return this.$store.state.chapters
            },
            types() {
                return this.$store.state.types
            },
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

    .md-wrapper {
        display: flex;
        justify-content: flex-start;
        align-items: center;
        flex-direction: column;
    }

    .md-item {
        display: flex;
        flex-direction: row;
        justify-content: space-between;
        align-items: center;
        width: 90%;
        margin-top: 10px;
        margin-bottom: 10px;
    }

    .md-title {
        font-size: 18px;
        margin-top: 10px;
    }

    .md-text {
        font-size: 14px;
    }

    .setting-right {
        width: 60%;
    }

    .edit-q {
        display: flex;
        justify-content: center;
        align-items: center;
        position: fixed;
        width: 28px;
        height: 28px;
        top: 50%;
        right: 5%;
        border-radius: 50%;
        padding: 5px;
        border: 1px #eee solid;
        background: #eee;
    }

    .edit-q:hover {
        color: #57a3f3;
        background-color: transparent;
        border-color: #57a3f3;
        cursor: pointer;
    }

    .edit-del {
        display: flex;
        justify-content: center;
        align-items: center;
        position: fixed;
        width: 28px;
        height: 28px;
        top: 60%;
        right: 5%;
        border-radius: 50%;
        padding: 5px;
        border: 1px #eee solid;
        background: #eee;
    }

    .edit-del:hover {
        color: #57a3f3;
        background-color: transparent;
        border-color: #57a3f3;
        cursor: pointer;
    }

    .left-left {
        margin-left: 10px;
        color: #666;
        font-size: 14px;
        cursor: pointer;
    }

    /*.btn-analysis {*/

    /*}*/

    /*.btn-analysis:hover {*/
    /*color: #57a3f3;*/
    /*background-color: transparent;*/
    /*border-color: #57a3f3;*/
    /*}*/
</style>