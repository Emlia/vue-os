<template>
    <div>
        <!--<div> {{myAnswers}}</div>-->
        <cell :question="question" :questions="questions" :myAnswers="myAnswers"></cell>


    </div>
</template>

<script>
    import cell from './cell'

    export default {
        name: "orderExercise",
        components: {cell},
        mounted() {
            this.$store.commit('getQuestions')
            this.$store.commit('getTags')
            this.$store.commit('getChapters')
            this.$store.commit('getTypes')
            this.$store.commit('getAnswers')
            this.$store.commit('setEtype','order')
        },
        computed: {
            question() {
                return this.$store.state.question
            },
            questions() {
                return this.$store.state.questions
            },
            myAnswers() {
                return this.$store.state.orderAnswers
            },
        }
    }
</script>

<style scoped>

</style>