<template>
    <div>
        <!--<div>{{chapterId}}-&#45;&#45;{{whereIsMyAnswersChapter}} {{myAnswers}}</div>-->
        <cell :questions="chapterQuestions" :myAnswers="myAnswers"></cell>

    </div>
</template>

<script>
    import cell from './cell'
    import Vue from 'vue'

    import mixin from '../../libs/mixin'
    import util from '../../libs/util'

    export default {
        name: "chapterExercise",
        components: {cell},
        mixins: [mixin],
        data() {
            return {
                question: {},
                chapterId: 0
            }
        },
        mounted() {
            this.$store.commit('getQuestions')
            this.$store.commit('getTags')
            this.$store.commit('getChapters')
            this.$store.commit('getTypes')
            this.$store.commit('getAnswers')
            this.$store.commit('setEtype', 'chapter')
            this.chapterId = this.$route.params.chapterId

        },
        methods: {},
        computed: {
            chapterQuestions() {
                let chapterId = this.chapterId

                if (this.questions.length == 0 || this.myDialog) {
                    // console.log('练习为空')
                    return []
                }

                // 继续练习
                if (Number(chapterId) == Number(this.whereIsMyAnswersChapter)) {
                    // console.log('继续练习')
                    this.$store.commit('getAnswers')
                    return this.questions.filter(item => {
                        if (Object.keys(this.myAnswers).includes(item.id)) {
                            return true
                        }
                        return false
                    })
                }

                // 重新练习
                this.$store.commit('reStartChapter')
                // this.isContinue = false
                // console.log('重新练习')
                return this.questions.filter(item => {
                    if (item.chapter == chapterId) {
                        Vue.set(this.$store.state.chapterAnswers, item.id, []);
                        return true
                    }
                    return false
                })
            },
            whereIsMyAnswersChapter() {
                return util.whereIsMyAnswersChapter(this.myAnswers, this.questions)
            },
            questions() {
                return this.$store.state.questions
            },
            // chapterId() {
            //     let temp = this.$route.params.chapterId
            //     return temp
            // },
            myAnswers() {
                return this.$store.state.chapterAnswers
            },
        }
    }
</script>

<style scoped>

</style>