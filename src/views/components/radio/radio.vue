<template>
    <div>
        <radioItem class="radio-item-wrapper" v-for="(item,index) in radioitems.values"
                   :key="index"
                   state="#fff"
                   @selectedItem="checkAnswer"
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
                    return {
                        selected: ''
                    }
                }
            }

        },
        data() {
            return {}
        },
        methods: {
            checkAnswer(value) {
                this.selected = value
                console.log('get', value)
            },
            getBgColor() {
                if (this.selected === radioitems.answer) {
                    return 'blue'
                } else if (this.selected != radioitems.answer && this.selected != '') {
                    return 'red'
                }

                return 'green'
            }
        },
        watch: {
            selected(value) {

            }
        }
    }
</script>

<style scoped>
    .radio-item-wrapper {
        margin-top: 10px;
    }
</style>