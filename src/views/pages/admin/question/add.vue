<template>
    <div class="wrapper">
        <whitespace>
            <div class="title">添加标签</div>
            <div class="cell">
                <div class="cell-title">类型</div>
                <Select v-model="type" style="width: 60%">
                    <Option v-for="item in types" :value="item.value" :key="item.value">{{ item.label }}</Option>
                </Select>
            </div>
            <div class="cell">
                <div class="cell-title">标签</div>
                <Select v-model="tag" style="width: 60%">
                    <Option v-for="item in tags" :value="item.value" :key="item.value">{{ item.label }}</Option>
                </Select>
            </div>

            <div class="cell">
                <div class="cell-title">章节</div>
                <Select v-model="chapter" style="width: 60%">
                    <Option v-for="item in chapters" :value="item.value" :key="item.value">{{ item.label }}</Option>
                </Select>
            </div>
            <div class="cell">
                <div class="cell-title">题干</div>
                <Input v-model="text" type="textarea" placeholder="请输入题干.eg:请问今天是几号?" clearable style="width: 60%"/>
            </div>

            <div class="cell">
                <div class="cell-title">选项</div>
            </div>
            <div class="cell" v-for="(item,index) in options" :key="index">
                <div class="cell-title cell-option-wrapper">
                    <div class="cell-option">{{abc[index]}}</div>
                </div>
                <Input v-model="options[index]" type="textarea"
                       placeholder="请输入答案.eg:2018/2/30" clearable
                       style="width: 60%"/>
                <div @click="sub(index)" v-show="index !=0" class="icon-sub">
                    <Icon type="minus-circled" color="#ff0000" size="20"></Icon>
                </div>
            </div>
            <div class="btn-add-wrapper">
                <Button v-show="options.length<8" class="btn-add" @click="options.push('')">添加</Button>
            </div>
            <div class="cell">
                <div class="cell-title">答案</div>
                <Select v-model="answer" style="width: 60%">
                    <Option v-for="i in options.length" :value=" abc[i-1]" :key="i">{{ abc[i-1] }}</Option>
                </Select>
            </div>
            <div class="tool">
                <Button @click="$router.go(-1)">返回</Button>
                <Button @click="submit">提交</Button>
            </div>
            <div>{{res}}</div>
        </whitespace>

    </div>
</template>

<script>
    import whitespace from '../../../components/whitespace/whitespace'
    import axios from 'axios'
    import qs from 'qs'

    export default {
        components: {whitespace},
        name: "add",
        data() {
            return {
                abc: ['A', 'B', 'C', 'D', 'E', 'F', 'G', "H"],
                tags: [],
                chapters: [],
                types: [],
                tag: 0,
                chapter: 0,
                type: 0,
                answer: '',
                text: '',
                options: ['', '', '', ''],
                res: ''
            }
        },
        created() {
            this.getCapter()
            this.getTag()
            this.getType()
        },
        methods: {
            submit() {
                if (this.label == '' || this.value == '') {
                    this.$Message.error('输入不能为空,提交失败')
                    return
                }
                let data = qs.stringify({
                    label: this.label,
                    value: this.value
                })
                axios.post('http://localhost/php-ci-os/index.php/Os/addTag',
                    data).then((response) => {
                    this.res = response.data
                }).catch(function (error) {
                    console.log(error);
                });
            },
            sub(index) {
                this.options.splice(index, 1)
            },
            getCapter() {
                axios.get('http://localhost/php-ci-os/index.php/Os/getChapters'
                ).then((res) => {
                    let temp = res.data.data
                    let ch = []
                    temp.forEach(item => {
                        ch.push({label: item.name, value: item.id})
                    })
                    this.chapters = ch
                }).catch(function (error) {
                    console.log(error);
                });
            },
            getTag() {
                axios.get('http://localhost/php-ci-os/index.php/Os/getTags'
                ).then((res) => {
                    let temp = res.data.data
                    let ch = []
                    temp.forEach(item => {
                        ch.push({label: item.label, value: item.value})
                    })
                    this.tags = ch
                }).catch(function (error) {
                    console.log(error);
                });
            },
            getType() {
                axios.get('http://localhost/php-ci-os/index.php/Os/getTypes'
                ).then((res) => {
                    let temp = res.data.data
                    let ch = []
                    temp.forEach(item => {
                        ch.push({label: item.label, value: item.id})
                    })
                    this.types = ch
                }).catch(function (error) {
                    console.log(error);
                });
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