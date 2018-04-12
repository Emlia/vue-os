<template>
    <div class="wrapper">
        <navPage></navPage>
        <whitespace>
            <div class="title">添加标签</div>
            <div class="cell">
                <div class="cell-title">类型</div>
                <Select v-model="type" style="width: 60%">
                    <Option v-for="item in types" :value="item.id" :key="item.value">{{ item.label }}</Option>
                </Select>
            </div>
            <!--<div class="cell">-->
            <!--<div class="cell-title">标签</div>-->
            <!--<Select multiple v-model="tag" style="width: 60%">-->
            <!--<Option v-for="item in tags" :value="item.value" :key="item.value">{{ item.label }}</Option>-->
            <!--</Select>-->
            <!--</div>-->

            <div class="cell">
                <div class="cell-title">章节</div>
                <Select v-model="chapter" style="width: 60%">
                    <Option v-for="item in chapters" :value="item.id" :key="item.value">{{ item.label }}</Option>
                </Select>
            </div>
            <div class="cell">
                <div class="cell-title">题干</div>
                <Input v-model="text" type="textarea" placeholder="请输入题干.eg:您的幸运号码是多少?" clearable style="width: 60%"/>
            </div>
            <div class="cell">
                <div class="cell-title">图片</div>
                <Input v-model="src" placeholder="请输入图片的url地址.eg:www.baidu.com." clearable style="width: 60%"/>
            </div>

            <div class="cell">
                <div class="cell-title">选项</div>
            </div>
            <div class="cell" v-for="(item,index) in options" :key="index">
                <div class="cell-title cell-option-wrapper">
                    <div class="cell-option">{{abc[index]}}</div>
                </div>
                <Input v-model="options[index]" type="textarea"
                       :placeholder="`请输入答案.eg:我的幸运号码是${index}`" clearable
                       style="width: 60%"/>
                <div @click="sub(index)" v-show="index !=0" class="icon-sub">
                    <Icon type="minus-circled" color="#ff0000" size="20"></Icon>
                </div>
            </div>
            <div class="btn-add-wrapper">
                <Button v-show="options.length<8" class="btn-add" @click="options.push('')">添加</Button>
            </div>
            <div class="cell" v-if="multiple">
                <div class="cell-title">答案</div>
                <Select key="ee1" multiple v-model="answer" style="width: 60%">
                    <Option v-for="i in options.length" :value=" abc[i-1]" :key="i">{{ abc[i-1] }}</Option>
                </Select>
            </div>
            <div class="cell" v-else>
                <div class="cell-title">答案</div>
                <Select key="ee2" v-model="answer" style="width: 60%">
                    <Option v-for="i in options.length" :value=" abc[i-1]" :key="i">{{ abc[i-1] }}</Option>
                </Select>
            </div>
            <div class="cell">
                <div class="cell-title">解析</div>
                <Input v-model="analysis" type="textarea" placeholder="请输入解析.eg:本题是一道开放题,言之有理即可." clearable
                       style="width: 60%"/>
            </div>
            <div class="tool">
                <Button @click="$router.go(-1)">返回</Button>
                <Button @click="addQT">提交</Button>
            </div>
            <!--<div>{{getType}}</div>-->
        </whitespace>

    </div>
</template>

<script>
    import whitespace from '../../../components/whitespace/whitespace'
    import axios from 'axios'
    import qs from 'qs'
    import navPage from '../../../components/nav/navPage'

    export default {
        components: {whitespace, navPage},
        name: "add",
        data() {
            return {
                abc: ['A', 'B', 'C', 'D', 'E', 'F', 'G', "H"],
                // tags: [],
                tag: [],
                chapter: 0,
                type: 1,
                answer: [],
                text: '',
                src: '',
                analysis: '',
                options: ['', '', '', ''],
                moptions: [],
            }
        },
        mounted() {
            // this.$store.commit('getTags')
            this.$store.commit('getChapters')
            this.$store.commit('getTypes')
            this.$store.commit('getAnswers')
        },
        methods: {
            addQT() {
                let answer = this.answer
                if (typeof answer === 'string') {
                    answer = [answer]
                }
                let data = qs.stringify({
                    type: this.type,
                    tag: JSON.stringify(this.tag),
                    chapter: this.chapter,
                    text: this.text,
                    src: this.src,
                    options: JSON.stringify(this.options),
                    answer: JSON.stringify(answer),
                    analysis: this.analysis,

                })
                axios.post('http://localhost/php-ci-os/index.php/Os/addQuestion',
                    data).then((response) => {
                    let res = response.data
                    if (res.ret === '200') {
                        this.type = -1
                        this.chapter = -1
                        this.text = ''
                        this.src = ''
                        this.options = ['', '', '', '']
                        this.answer = []
                        this.analysis = ''
                        this.$Message.success('success')
                    } else {
                        this.$Message.error('fail')
                    }

                }).catch(function (error) {
                    console.log(error);
                });
            },
            sub(index) {
                this.options.splice(index, 1)
            },
        },
        computed: {
            multiple() {
                this.answer = []
                if (this.getType.length == 0) {
                    return false
                }
                if (this.getType.length == 1) {
                    if (this.getType[0].label == '多选')
                        return true
                    else
                        return false
                }
            },
            getType() {
                return this.types.filter(item => {
                    if (item.id == this.type) {
                        return true
                    }
                    return false
                })
            },
            types() {
                return this.$store.state.types
            },
            chapters() {
                return this.$store.state.chapters
            }
        }
    }
</script>

<style scoped>
    .wrapper {

    }

    .title {
        font-size: 18px;
        padding-left: 5px;
        border-left: #2db7f5 4px solid;
        margin-bottom: 15px;
    }

    .cell {
        display: flex;
        flex-direction: row;
        align-items: center;
        margin-top: 10px;
    }

    .cell-title {
        width: 30%;
        font-size: 15px;
    }

    .cell-option-wrapper {
        display: flex;
        justify-content: flex-start;
        align-items: flex-start;
    }

    .cell-option {
        width: 25px;
        height: 25px;
        text-align: center;
        line-height: 22px;
        font-size: 17px;
        border-radius: 50%;
        background-color: #2db7f5;
        border: #eee 2px solid;
        color: #fff;
    }

    .tool {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-top: 20px;
    }

    .btn-add-wrapper {
        display: flex;
        justify-content: flex-end;
        align-items: center;
    }

    .btn-add {
        margin-top: 10px;
        margin-right: 10%;
    }

    .icon-sub {
        width: 8%;
        display: flex;
        justify-content: center;
        align-items: center;
    }

</style>