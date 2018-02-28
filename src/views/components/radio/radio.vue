<template>
    <div>
        <radioItem v-for="(item,index) in radioQ[0].values" :key="index" :value="item"/>
    </div>
</template>

<script>
    import radioItem from './radioItem'

    export default {
        name: "radio",
        components: {radioItem},
        data() {
            return {
                radioQ: [
                    {
                        tag: ['单选', '县城'],
                        type: 'radio',
                        answer: 'B',
                        src: 'http://oxjvsyqoj.bkt.clouddn.com/Grp1%2001807.png',
                        values: [
                            {value: 'A', label: '选项A'},
                            {value: 'B', label: '选项B'},
                            {value: 'C', label: '选项C'},
                            {value: 'D', label: '选项D'}
                        ]
                    }
                ]
            }
        },
        methods: {}
    }
</script>

<style scoped>

</style>