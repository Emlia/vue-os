<template>
    <div>
        <cell :question="question" :questions="chapterQuestions" :myAnswers="myAnswers"></cell>
    </div>
</template>

<script>
    import cell from './cell'

    export default {
        name: "chapterExercise",
        components: {cell},
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
            this.$store.commit('setEtype','chapter')
        },
        methods: {},
        computed: {
           chapterQuestions() {
                let chapterId = this.chapterId
                return this.questions.filter(item => {
                    if (item.chapter == chapterId) {
                        return true
                    }
                    return false
                })
            },
            questions() {
                return this.$store.state.questions
            },
            chapterId() {
                return this.$store.state.chapterId
            },
            myAnswers() {
                return this.$store.state.chapterAnswers
            },
        }
    }
</script>

<style scoped>

</style>