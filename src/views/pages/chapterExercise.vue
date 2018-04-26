<template>
    <div>
        <!--<div>{{chapterId}}-&#45;&#45;{{whereIsMyAnswersChapter}}</div>-->
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
                question: {}
            }
        },
        mounted() {
            this.$store.commit('getQuestions')
            this.$store.commit('getTags')
            this.$store.commit('getChapters')
            this.$store.commit('getTypes')
            this.$store.commit('getAnswers')
            this.$store.commit('setEtype', 'chapter')
        },
        methods: {},
        computed: {
            chapterQuestions() {
                let chapterId = this.$route.params.id

                if (chapterId == this.whereIsMyAnswersChapter) {
                    return this.questions.filter(item => {
                        if (Object.keys(this.myAnswers).includes(item.id)) {
                            return true
                        }
                        return false
                    })
                }

                if (this.questions.length == 0 || this.myDialog) {
                    return []
                }

                this.$store.commit('reStartChapter')
                this.isContinue = false

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
            chapterId() {
                return this.$route.params.id
            },
            myAnswers() {
                return this.$store.state.chapterAnswers
            },
        }
    }
</script>

<style scoped>

</style>