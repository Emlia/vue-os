<template>
    <div>
        <navPage/>
        <whitespace @click="show = false">
            <div class="tag-wrapper">
                <div class="tag" v-for="(tagitem,index) in  radioQ[cPosition].tag" :key="index">{{tagitem}}</div>
            </div>

            <div class="text">{{radioQ[cPosition].text}}
            </div>
            <radio :radioitems="radioQ[cPosition]"
                   :myAnswer="myAnswers[radioQ[cPosition].id]"
                   @click="mRadio"
            />
            <div v-show="showAnalysis">
                <div>答案 {{this.radioQ[this.cPosition].answer}}</div>
                <div>
                    <div></div>
                    <div>
                        答案详解
                    </div>
                    <div></div>
                </div>
                <div>{{this.radioQ[this.cPosition].analysis}}</div>
            </div>
            <!--<div>{{myAnswers[cPosition+1]}}</div>-->
            <Button @click="next">下一题</Button>
        </whitespace>
        <bottomPanel
                :collections="myCollections"
                @selected="selected"
                :num="radioQ.length"
                :pos="cPosition" :show="show" @ctop="ctop"/>
    </div>

</template>

<script>
    import radio from '../components/radio/radio'
    import whitespace from '../components/whitespace/whitespace'
    import bottomPanel from '../components/bottomPanel/bottomPanel'
    import navPage from '../components/nav/navPage'

    export default {
        name: "order-exercise",
        components: {radio, whitespace, bottomPanel, navPage},
        data() {
            return {
                cPosition: 1,
                show: false,
                showAnalysis: false,
                radioQ: [
                    {
                        id: 1,
                        tag: ['单选题', '判断题'],
                        type: 'radio',
                        answer: 'B',
                        text: '驾驶机动车正在被其他车辆超车时,别找出更哈市极大哈斯件?',
                        src: 'http://oxjvsyqoj.bkt.clouddn.com/Grp1%2001807.png',
                        values: [
                            {value: 'A', label: '选项A'},
                            {value: 'B', label: '选项B'},
                            {
                                value: 'C', label: '选项C,这是一个横诚的选项,是一个横诚的选项,' +
                                '是一个横诚的选项,是一个横诚的选项,是一个横诚的选项是一个横诚的选项是一' +
                                '个横诚的选项~'
                            },
                            {value: 'D', label: '选项D'}
                        ]
                    },
                    {
                        id: 2,
                        tag: ['单选题', '判断题', '客观题'],
                        type: 'radio',
                        answer: 'B',
                        text: '这是第二题,这是第二题,这是第二题,这是第二题这是第二题,这是第二题这是第二题?',
                        src: 'http://oxjvsyqoj.bkt.clouddn.com/Grp1%2001807.png',
                        analysis: '这是参考答案,这是参考答案,这是参考答案,这是参考答案,这是参考答案,~~',
                        values: [
                            {value: 'A', label: '选项AA'},
                            {
                                value: 'B', label: '选项BBB,这是一个横诚的选项,是一个横诚的选项一个横诚的选项,是一个横诚的选项,'
                            },
                            {
                                value: 'C', label: '选项CC,是一个横诚的选项是一个横诚的选项是一' +
                                '个横诚的选项~'
                            },
                            {value: 'D', label: '选项DD'}
                        ]
                    }
                ],
                myAnswers: {
                    1: 'B',
                    3: 'D'
                },
                myCollections: [1, 2]
            }
        },
        methods: {
            next() {
                this.cPosition = (this.cPosition + 1) % this.radioQ.length
            },
            selected(value) {
                this.cPosition = value - 1
            },
            ctop() {
                this.show = !this.show
            },
            mRadio(value) {
                let temp = {}
                temp[value.id] = value.value
                this.myAnswers = Object.assign({}, this.myAnswers, temp)
                if (value.value === this.radioQ[this.cPosition].answer) {
                    this.showAnalysis = false
                    this.next()
                } else {
                    this.showAnalysis = true
                }
                // console.log('aaa', value)
                // console.log('bb', this.myAnswers)
            }
        },
        watch: {
            myAnswers: {
                handler: function (val, oldVal) {
                    // console.log('answer', val)
                },
                deep: true
            }
        }
    }
</script>

<style scoped>
    .tag-wrapper {
        display: flex;
        flex-direction: row;
        justify-content: flex-start;
        align-items: flex-start;
    }

    .tag {
        color: #2d8cf0;
        margin-right: 10px;
        font-size: 12px;
    }

    .text {
        font-size: 18px;
        margin-top: 5px;
        margin-bottom: 10px;
    }
</style>