<template>
    <div class="wrapper">
        <whitespace>
            <div class="title">所有标签</div>
            <Table stripe :columns="columns" :data="tableData"></Table>
            <div class="tool">
                <Button @click="$router.go(-1)">返回</Button>
                <Button @click="getData">重新获取数据</Button>
            </div>
            <!--<div>{{res}}</div>-->
        </whitespace>

    </div>
</template>

<script>
    import whitespace from '../../../components/whitespace/whitespace'
    import axios from 'axios'

    export default {
        components: {whitespace},
        name: "all",
        data() {
            return {
                tableData: [],
                columns: [
                    {title: '主键(id)', key: 'id'},
                    {title: '显示名(label)', key: 'label'},
                    {title: '标识(value)', key: 'value'}],
                res: ''
            }
        },
        created() {
            this.getData()
        },
        methods: {
            getData() {
                axios.get('http://localhost/php-ci-os/index.php/Os/getTags').then((response) => {
                    this.res = response.data
                    this.tableData = this.res.data
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
        margin-bottom: 20px;
    }

    .tool {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-top: 20px;
    }

</style>