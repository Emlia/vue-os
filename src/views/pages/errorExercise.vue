<template>
    <div>
        <cell :questions="errorQuestions" :myAnswers="myAnswers"></cell>
    </div>
</template>

<script>
    import cell from './cell'
    import _ from 'lodash'
    import mixin from '../../libs/mixin'
    import util from '../../libs/util'

    export default {
        name: "errorExercise",
        components: {cell},
        mixins: [mixin],
        data() {
            return {}
        },
        mounted() {
            this.$store.commit('getQuestions')
            this.$store.commit('getTags')
            this.$store.commit('getChapters')
            this.$store.commit('getTypes')
            this.$store.commit('getAnswers')
            this.$store.commit('setEtype', 'error')
            this.$store.commit('resetErrorAnswer')
        },
        methods: {},
        computed: {
            errorQuestions() {
                // return this.questions.filter(item => {
                //     // console.log(`${this.errors}  ${item.id}  ${this.errors.includes(Number(item.id))}`)
                //     if (this.errors.includes(Number(item.id))||this.errors.includes(item.id)) {
                //         return true
                //     }
                //     return false
                // })
                let temp = []
                let qq = {}
                for (let i = 0; i < this.errors.length; i++) {
                    qq = util.getQuestionById(this.questions, this.errors[i])
                    if (qq.text) {
                        temp.push(qq)
                    }
                }
                return temp
            },
            questions() {
                return this.$store.state.questions
            },
            myAnswers() {
                return this.$store.state.errorAnswers
            },
            errors() {
                return this.$store.state.errors
            }
        }
    }
</script>

<style scoped>

</style>