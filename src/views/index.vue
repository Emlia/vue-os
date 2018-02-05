<template>
    <div class="wrapper">
        <div>
            <div v-for="i in 2" :key="i" style="margin-bottom: 30px;">
                <Row>
                    <div>基础服务</div>
                    <Col v-for="i in 4" :key="i" :span="4">
                        <cell></cell>
                    </Col>
                </Row>
            </div>
        </div>
        <div style="display:flex;flex-direction: row;justify-content: space-between;margin-bottom: 3px;">
            <div style="display:flex;flex-direction: row;justify-content: flex-start;align-items: center;width: 400px;">
                <div style="margin-left: 5px;">基础服务</div>
                <div style="margin-left: 5px;">独立产品</div>
                <div style="margin-left: 5px;">行业解决方案</div>
            </div>
            <Input v-model="value" icon="ios-clock-outline" placeholder="Enter something..."
                   style="width: 200px"></Input>
            <Button>Default</Button>
        </div>
        <Table :columns="columns1" :data="data1"></Table>
    </div>
</template>
<script>
    import cell from './cell'

    export default {
        components: {cell},
        methods: {},
        data() {
            return {
                value: '',
                columns1: [
                    {
                        title: 'Name',
                        key: 'name'
                    },
                    {
                        title: 'Age',
                        key: 'age'
                    },
                    {
                        title: 'Address',
                        key: 'address'
                    }
                ],
                data1: [
                    {
                        name: 'John Brown',
                        age: 18,
                        address: 'New York No. 1 Lake Park',
                        date: '2016-10-03'
                    },
                    {
                        name: 'Jim Green',
                        age: 24,
                        address: 'London No. 1 Lake Park',
                        date: '2016-10-01'
                    },
                    {
                        name: 'Joe Black',
                        age: 30,
                        address: 'Sydney No. 1 Lake Park',
                        date: '2016-10-02'
                    },
                    {
                        name: 'Jon Snow',
                        age: 26,
                        address: 'Ottawa No. 2 Lake Park',
                        date: '2016-10-04'
                    }
                ]
            }
        }
    }
</script>
<style scoped lang="less">

</style>