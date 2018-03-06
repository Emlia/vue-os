<template>
    <div>
        <div>测试数据</div>
        <div>{{res}}</div>
        <div>{{value}}</div>
    </div>
</template>

<script>
    import axios from 'axios'
    import qs from 'qs'

    export default {
        name: "edit",
        data() {
            return {
                userid: 1,
                content: {
                    1: ['B哦哦', "Asdfhdsu拉拉"],
                    3: 'D'
                },
                res: {},
                value: []
            }
        },
        created() {
            // this.add()
            this.all()
        },
        methods: {
            add() {
                let data = qs.stringify({
                    userid: this.userid,
                    content: JSON.stringify(this.content)

                })
                axios.post('http://localhost/php-ci-os/index.php/Os/addAnswer',
                    data).then((response) => {
                    this.res = response.data
                }).catch(function (error) {
                    console.log(error);
                });
            },
            all() {
                axios.post('http://localhost/php-ci-os/index.php/Os/getAnswers').then((response) => {
                    this.res = response.data
                    this.value = this.res.data[1].content
                    this.value = JSON.parse(this.value)
                    this.value = this.value[1]
                }).catch(function (error) {
                    console.log(error);
                });
            }
        }
    }
</script>

<style scoped>

</style>