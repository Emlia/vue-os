<template>
    <div>
        <radioItem class="radio-item-wrapper" v-for="(item,index) in radioitems.values"
                   :key="index"
                   :myAnswer="myAnswer"
                   :answer="radioitems.answer"
                   @click="value=>$emit('click',{id:radioitems.id,value:value})"
                   :value="item"/>
    </div>
</template>

<script>
    import radioItem from './radioItem'

    export default {
        name: "radio",
        components: {radioItem},
        props: {
            radioitems: {
                type: Object,
                default() {
                    return {}
                }
            },
            myAnswer: {
                type: undefined | String,
                default() {
                    return ''
                }
            }

        },
        data() {
            return {}
        },
        methods: {
            checkAnswer(value) {
                // console.log('get', value)
            },

        },
        computed: {

        },
        watch: {}
    }
</script>

<style scoped>
    .radio-item-wrapper {
        margin-top: 10px;
    }
</style>