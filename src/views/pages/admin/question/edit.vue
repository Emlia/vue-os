<template>
    <div>
        <navPage></navPage>
        <whitespace>
            <!--<div>{{result}}</div>-->
            <!--<div>{{question}}</div>-->
            <ui title="编辑题目" :initData="question[0]" @questionChange="questionChange"></ui>
            <div class="tool">
                <Button @click="$router.go(-1)">返回</Button>
                <Button @click="edit">修改</Button>
            </div>
        </whitespace>
    </div>
</template>

<script>
    import navPage from '../../../components/nav/navPage'
    import whitespace from '../../../components/whitespace/whitespace'
    import ui from './ui'
    import axios from 'axios'
    import qs from 'qs'
    import config from '../../../../config/config'
    import mixin from '../../../../libs/mixin'
    export default {
        name: "edit",
        components: {navPage, whitespace, ui},
        mixins:[mixin],
        data() {
            return {
                result: {}
            }
        },
        mounted() {
            this.$store.commit('getQuestions')
            console.log(this.$router)
        },
        methods: {
            questionChange(question) {
                this.result = question
            },
            edit() {
                let data = qs.stringify({
                    id:this.result.id,
                    type: this.result.type,
                    tag: JSON.stringify(this.result.tag),
                    chapter: this.result.chapter,
                    text: this.result.text,
                    src: this.result.src,
                    options: JSON.stringify(this.result.options),
                    answer: JSON.stringify(this.result.answer),
                    analysis: this.result.analysis,

                })
                axios.post(`${config.baseurl}/php-ci-os/index.php/Os/updateQuestion`,
                    data).then((response) => {
                    let res = response.data
                    if (res.ret === '200') {
                        this.$Message.success('success')
                    } else {
                        this.$Message.error('fail')
                    }

                }).catch(function (error) {
                    console.log(error);
                });
            }
        },
        computed: {
            question() {
                return this.questions.filter(item => {
                    if (item.id == this.$route.params.id) {
                        return true
                    }
                    return false
                })
            },
            questions() {
                return this.$store.state.questions
            },
        }
    }
</script>

<style scoped>
    .tool {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-top: 20px;
    }
</style>