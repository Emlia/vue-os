<template>
    <div>
        <radioItem class="radio-item-wrapper" v-for="(item,index) in values"
                   :key="index"
                   :myAnswer="myAnswer"
                   :answer="answer"
                   @click="value=>$emit('click',{id:question.id,value:value})"
                   :value="{value:abc[index],label:item,question:question}"/>
    </div>
</template>

<script>
    import radioItem from './radioItem'

    export default {
        name: "radio",
        components: {radioItem},
        props: {
            question: {
                type: Object,
                default() {
                    return {}
                }
            },
            // 实际为myAnswers[question.id]
            myAnswer: {
                type: Array,
                default() {
                    return []
                }
            }

        },
        data() {
            return {
                abc: ['A', 'B', 'C', 'D', 'E', 'F', 'G', "H"],
            }
        },
        created() {
        },
        computed: {},
        methods: {
            checkAnswer(value) {
                // console.log('get', value)
            },

        },
        computed: {
            values() {
                return this.question.options
            },
            answer() {
                return this.question.answer
            }
        },
        watch: {
            // question(value) {
            //     this.values = value.options
            //     this.answer = value.answer
            // }
        }
    }
</script>

<style scoped>
    .radio-item-wrapper {
        margin-top: 10px;
    }

    .radio-item-wrapper:hover {
        color: #57a3f3;
        background-color: transparent;
        border-color: #57a3f3;
        cursor: pointer;
    }
</style>