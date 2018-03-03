<template>
    <div class="wrapper">
        <whitespace>
            <div class="title">添加标签</div>
            <div class="cell">
                <div class="cell-title">显示名(label)</div>
                <Input v-model="label" placeholder="请输入显示的名字.eg:单选题" clearable style="width: 60%"/>
            </div>
            <div class="cell">
                <div class="cell-title">标识(value)</div>
                <Input v-model="value" placeholder="请输入英文名字.eg:radio" clearable style="width: 60%"/>
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
                value: '',
                label: '',
                res: ''
            }
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
        margin-bottom: 5px;
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

    .tool {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-top: 20px;
    }

</style>