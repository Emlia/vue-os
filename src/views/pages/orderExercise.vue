<template>
    <div>
        <cell :questions="questions" :myAnswers="myAnswers"></cell>
    </div>
</template>

<script>
    import cell from './cell'
    import mixin from '../../libs/mixin'

    export default {
        name: "orderExercise",
        components: {cell},
        mixins: [mixin],
        mounted() {
            this.$store.commit('getQuestions')
            this.$store.commit('getTags')
            this.$store.commit('getChapters')
            this.$store.commit('getTypes')
            this.$store.commit('getAnswers')
            this.$store.commit('setEtype', 'order')
        },
        computed: {
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