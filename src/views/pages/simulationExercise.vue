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
                // 状态 0 , 1,  2
                flag: 0,
                // myDialog: false,
                empty: []
            }
        },
        mounted() {
            this.$store.commit('getQuestions')
            this.$store.commit('getTags')
            this.$store.commit('getChapters')
            this.$store.commit('getTypes')
            this.$store.commit('getAnswers')
            this.$store.commit('setEtype', 'simulation')
            // if (this.myAnswerIsExist) {
            //     this.myDialog = true
            // }
        },
        methods: {
            left() {
                this.flag = 1
                // this.myDialog = false

            },
            right() {
                this.flag = 2
                // this.myDialog = false
                // this.isContinue = false
            }
        },
        computed: {
            myDialog() {
                return this.simulationIsExist && this.flag == 0
            },
            myAnswerIsExist() {
                return util.myAnswerIsExist(this.myAnswers)
            },
            questionsIsExist() {
                return this.questions.length != 0
            },
            simulationIsExist() {
                return this.simulation.length != 0
            },
            // 如果有题目,显示题目, 如果没有,显示没有
            randomlyQuestions() {

                if (this.oldQ && this.questionsIsExist && this.simulationIsExist) {
                    // console.log('old-----------')
                    return util.getQuestionByArray(this.questions, this.simulation)
                }
                if (this.newQ && this.questionsIsExist) {
                    // console.log('new-----------')
                    let simArray = util.getSimArray(this.questions)
                    this.$store.commit('reStartSim')
                    this.$store.commit('setSimulation', simArray)
                    this.flag = 3
                    // console.log('simArray', simArray)
                    return util.getQuestionByArray(this.questions, simArray)
                }
                // console.log('empty')
                return this.empty
            },
            questions() {
                return this.$store.state.questions
            },
            myAnswers() {
                return this.$store.state.simulationAnswers
            },
            simulation() {
                return this.$store.state.simulation
            },
            // 曾经有答案,点击继续上次按钮
            oldQ() {
                return this.simulationIsExist && this.flag == 2 || this.flag == 3
            },
            // 曾经有答案,点击重新开始按钮
            newQ() {
                // return !this.oldQ
                return !this.simulationIsExist && this.flag == 0 || this.flag == 1
            }
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