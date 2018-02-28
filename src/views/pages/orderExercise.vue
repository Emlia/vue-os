<template>
    <div>
        <whitespace>
            <div>顺序练习</div>
            <div class="tag-wrapper">
                <div class="tag" v-for="(tagitem,index) in  radioQ[0].tag" :key="index">{{tagitem}}</div>
            </div>

            <div class="text">驾驶机动车正在被其他车辆超车时,别找出更哈市极大哈斯件?
            </div>
            <radio :radioitems="radioQ[0]"/>
        </whitespace>
    </div>
</template>

<script>
    import radio from '../components/radio/radio'
    import whitespace from '../components/whitespace/whitespace'

    export default {
        name: "order-exercise",
        components: {radio, whitespace},
        data() {
            return {
                radioQ: [
                    {
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
                    }
                ]
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
        margin-left: 10px;
        font-size: 12px;
    }

    .text {
        font-size: 18px;
        margin-top: 5px;
        margin-bottom: 10px;
    }
</style>