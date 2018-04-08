<template>
    <div>
        <cell :question="question" :questions="randomlyQuestions" :myAnswers="myAnswers"></cell>
    </div>
</template>

<script>
    import cell from './cell'
    import _ from 'lodash'

    export default {
        name: "simulationExercise",
        components: {cell},
        data() {
            return {}
        },
        mounted() {
            this.$store.commit('getQuestions')
            this.$store.commit('getTags')
            this.$store.commit('getChapters')
            this.$store.commit('getTypes')
            this.$store.commit('getAnswers')
            this.$store.commit('setEtype', 'simulation')
        },
        methods: {},
        computed: {
            randomlyQuestions() {
                var arr = _.cloneDeep(this.questions)

                var result = []

                var ranNum = 10;

                for (var i = 0; i < ranNum; i++) {

                    var ran = Math.floor(Math.random() * arr.length)

                    result.push(arr.splice(ran, 1)[0]);

                }
                // console.log(result)
                return result
            },
            question() {
                return this.$store.state.question
            },
            questions() {
                return this.$store.state.questions
            },
            myAnswers() {
                return this.$store.state.simulationAnswers
            },
        }
    }
</script>

<style scoped>

</style>