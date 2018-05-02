<template>
    <div>
        <!--<div>{{myAnswerIsExist}}&#45;&#45;{{isContinue}}</div>-->
        <cell :questions="randomlyQuestions" :myAnswers="myAnswers"></cell>
        <MDialog v-if="myDialog" @left="left" @right="right">
            <div class="md-text">您上次未完成练习,
                想要继续练习吗?
            </div>
        </MDialog>
    </div>
</template>

<script>
    import cell from './cell'
    import _ from 'lodash'
    import Vue from 'vue'
    import MDialog from '../components/dialog/MDialog'
    import mixin from '../../libs/mixin'
    import util from '../../libs/util'

    export default {
        name: "simulationExercise",
        components: {cell, MDialog},
        mixins: [mixin],
        data() {
            return {
                isContinue: true
            }
        },
        mounted() {
            this.$store.commit('getQuestions')
            this.$store.commit('getTags')
            this.$store.commit('getChapters')
            this.$store.commit('getTypes')
            this.$store.commit('getAnswers')
            this.$store.commit('setEtype', 'simulation')
        },
        methods: {
            left() {
                this.$store.commit('reStartSim')
                this.isContinue = false
            },
            right() {
                this.isContinue = false
            }
        },
        computed: {
            myDialog() {
                return this.myAnswerIsExist && this.isContinue
            },
            myAnswerIsExist() {
                return util.myAnswerIsExist(this.myAnswers)
            },
            qLength() {
                return this.questions.length
            },
            // 如果有题目,显示题目, 如果没有,显示没有
            randomlyQuestions() {
                if (this.qLength == 0 || this.myDialog) {
                    // console.log('empty----------')
                    return []
                }

                if (this.isContinue == false && this.myAnswerIsExist == true) {
                    // console.log('old-----------')
                    return this.questions.filter(item => {
                        if (Object.keys(this.myAnswers).includes(item.id)) {
                            return true
                        }
                        return false
                    })
                }


                var arr = _.cloneDeep(this.questions)

                var result = []

                var ranNum = 50;

                for (var i = 0; i < ranNum; i++) {

                    var ran = Math.floor(Math.random() * arr.length)
                    let temp = arr.splice(ran, 1)[0]
                    Vue.set(this.$store.state.simulationAnswers, temp.id, []);
                    result.push(temp);

                }
                // console.log(result)
                this.isContinue = false
                // console.log('new----------')
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
    .md-text {
        font-size: 16px;
        margin-top: 20px;
        margin-left: 10px;
        margin-right: 10px;
        margin-bottom: 20px;
    }
</style>