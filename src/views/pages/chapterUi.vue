<template>
    <div>
        <navPage></navPage>
        <whitesapce>
            <!--<div>{{myAnswerIsExist}}</div>-->
            <!--<div>{{isContinue}}</div>-->
            <div class="chapter-wrapper">
                <div class="chapter-item" v-for="(item,index) in chapters" :key="index" @click="click(item.value)">
                    <div class="chapter-icon" :style="{backgroundColor:colors[(index)%colors.length]}">{{item.value}}
                    </div>
                    <div class="chapter-text">{{item.label}}</div>
                </div>
            </div>
        </whitesapce>
        <MDialog v-if="myDialog" @left="left" @right="right">
            <div class="md-text">您上次未完成练习,
                想要继续练习吗?
            </div>
        </MDialog>
    </div>
</template>

<script>
    import navPage from '../components/nav/navPage'
    import whitesapce from '../components/whitespace/whitespace'
    import mixin from '../../libs/mixin'
    import MDialog from '../components/dialog/MDialog'
    import util from '../../libs/util'

    export default {
        name: "chapter-ui",
        components: {navPage, whitesapce, MDialog},
        mixins: [mixin],
        data() {
            return {
                colors: ['#FF6666',
                    '#66CC99',
                    '#FF9933',
                    '#9999FF',
                    '#66CC00',
                    '#993399',
                    '#6666FF',],
                isContinue: true
            }
        },
        mounted() {
            this.$store.commit('getChapters')
            this.$store.commit('getAnswers')
            this.$store.commit('getQuestions')
        },
        methods: {
            click(id) {
                console.log('chapter-', id)
                this.$store.commit('setChapterId', id)
                this.$router.push(`/chapterExercise/${id}`)
                this.isContinue = false
            },
            left() {
                this.$store.commit('reStartChapter')
                this.isContinue = false
            },
            right() {
                let cid = Object.keys(this.chapterAnswer)[0]
                console.log(`cid= ${cid}`)

                let temp = this.questions.filter(item => {
                    if (cid == item.id) {
                        return true
                    }
                    return false
                })
                console.log(temp[0])
                console.log(`temp=${temp[0]}`)
                let id = temp[0].chapter
                this.isContinue = false
                this.$router.push(`/chapterExercise/${id}`)
            }
        },
        computed: {
            myDialog() {
                return this.myAnswerIsExist && this.isContinue
            },
            myAnswerIsExist() {
                return util.myAnswerIsExist(this.chapterAnswer)
            },
            chapters() {
                return this.$store.state.chapters
            },
            questions() {
                return this.$store.state.questions
            },
            chapterAnswer() {
                return this.$store.state.chapterAnswers
            }
        }
    }
</script>

<style scoped>
    .chapter-wrapper {
        width: 100%;
        display: flex;
        flex-direction: row;
        justify-content: flex-start;
        align-items: flex-start;
        flex-wrap: wrap;
    }

    .chapter-item {
        width: 100%;
        display: flex;
        flex-direction: row;
        justify-content: flex-start;
        align-items: center;
        margin-top: 10px;
    }

    .chapter-icon {
        font-size: 14px;
        /*border: 1px solid #999;*/
        border-radius: 50%;
        width: 22px;
        height: 22px;
        text-align: center;
        line-height: 22px;
        margin-right: 20px;
        color: #fff;
    }

    .chapter-text {
        font-size: 18px;

    }

    .md-text {
        font-size: 14px;
        margin-top: 15px;
        margin-left: 10px;
        margin-right: 10px;
        margin-bottom: 15px;
    }
</style>