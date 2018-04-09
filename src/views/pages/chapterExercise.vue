<template>
    <div>
        <cell  :questions="chapterQuestions" :myAnswers="myAnswers"></cell>
    </div>
</template>

<script>
    import cell from './cell'
    import Vue from 'vue'
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
               if (this.$store.state.keepOnChapter) {
                   return this.questions.filter(item => {
                       if (Object.keys(this.myAnswers).includes(item.id)) {
                           return true
                       }
                       return false
                   })
               }

               if (this.questions.length == 0) {
                   return []
               }

                let chapterId = this.chapterId
                return this.questions.filter(item => {
                    if (item.chapter == chapterId) {
                        Vue.set(this.$store.state.chapterAnswers, item.id, []);
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