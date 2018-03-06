<template>
    <div>
        <div>{{values}}</div>
        <div></div>
        <radioItem class="radio-item-wrapper" v-for="(item,index) in values"
                   :key="index"
                   :myAnswer="myAnswer"
                   :answer="answer"
                   @click="value=>$emit('click',{id:question.id,value:value})"
                   :value="{value:abc[index],label:item}"/>
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
            myAnswer: {
                type: Array,
                default() {
                    return []
                }
            }

        },
        data() {
            return {
                values: [],
                answer: [],
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
        computed: {},
        watch: {
            question(value) {
                this.values = JSON.parse(value.options)
                this.answer = JSON.parse(value.answer)
            }
        }
    }
</script>

<style scoped>
    .radio-item-wrapper {
        margin-top: 10px;
    }
</style>