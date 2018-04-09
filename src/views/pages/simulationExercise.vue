<template>
    <div>
        <cell  :questions="randomlyQuestions" :myAnswers="myAnswers"></cell>
    </div>
</template>

<script>
    import cell from './cell'
    import _ from 'lodash'
    import Vue from 'vue'

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
                if (this.$store.state.keepOnSim) {
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
                var arr = _.cloneDeep(this.questions)

                var result = []

                var ranNum = 10;

                for (var i = 0; i < ranNum; i++) {

                    var ran = Math.floor(Math.random() * arr.length)
                    let temp = arr.splice(ran, 1)[0]
                    Vue.set(this.$store.state.simulationAnswers, temp.id, []);
                    result.push(temp);

                }
                // console.log(result)


                return result
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