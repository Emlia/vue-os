<template>
    <div style="display: flex;flex-direction: column;align-items: flex-start;">
        <Input v-model="name" placeholder="Enter something..." style="width: 300px"/>
        <InputNumber :max="100" :min="1" v-model="age"/>
        <Button @click="add">提交</Button>
        <Button @click="all">获取全部</Button>
        <div>{{res}}</div>
    </div>
</template>

<script>
    import axios from 'axios';
    import qs from 'qs'
    import util from '../../../libs/util'

    export default {
        name: "add",
        data() {
            return {
                name: '',
                age: 0,
                res: ''
            }
        },
        methods: {
            all() {
                let res = axios.get('http://localhost/php-ci-os/index.php/Test/all').then((response) => {
                    this.res = response.data
                }).catch(function (error) {
                    console.log(error);
                });
                // console.log('all   ', res)
                // util.get('http://localhost/php-ci-os/index.php/Test/all').then(res => {
                //     this.res = res.data
                // })
            },
            add() {
                let data = qs.stringify({
                    name: this.name,
                    age: this.age
                })
                let res = axios.post('http://localhost/php-ci-os/index.php/Test/add',
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

</style>