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
                empty: []
            }
        },
        mounted() {
            this.$store.commit('getQuestions')
            this.$store.commit('getTags')
            this.$store.commit('getChapters')
            this.$store.commit('getTypes')
            // this.$store.commit('getAnswers')
            this.$store.commit('setEtype', 'chapter')

        },
        methods: {},
        computed: {
            chapterQuestions() {

                if (this.questionsIsExist) {
                    // 重新练习
                    // this.$store.commit('reStartChapter')
                    return this.questions.filter(item => {
                        if (item.chapter == this.chapterId) {
                            // Vue.set(this.$store.state.chapterAnswers, item.id, []);
                            return true
                        }
                        return false
                    })
                }
                return this.empty

            },
            questionsIsExist() {
                return this.questions.length != 0
            },
            whereIsMyAnswersChapter() {
                return util.whereIsMyAnswersChapter(this.myAnswers, this.questions)
            },
            questions() {
                return this.$store.state.questions
            },
            chapterId() {
                let temp = this.$route.params.chapterId
                return temp
            },
            myAnswers() {
                return this.$store.state.chapterAnswers
            },
        }
    }
</script>

<style scoped>

</style>