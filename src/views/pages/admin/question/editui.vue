<template>
    <div class="q-edit-wrapper">
        <navPage>
            <div slot="left" class="left-left" @click="$router.go(-1)">
                返回上一页
            </div>
        </navPage>
        <whitesapce>
            <div class="q-edit-input">
                <Input v-model="search" @on-click="searchClick" icon="ios-search" placeholder="请输入部分题干内容"
                       style="width: 200px"></Input>
            </div>
            <div class="chapter-item" v-for="(item,index) in result" :key="index">
                <div class="chapter-icon" :style="{backgroundColor:colors[(index)%colors.length]}">{{item.id}}
                </div>
                <div class="chapter-text">{{item.text}}</div>
                <div>
                    <!--<Button type="error" @click="deleteQuestion(item.id)">删除该题</Button>-->
                    <Button type="success" @click="questionClick(item.id)">修改问题</Button>
                </div>
            </div>
            <!--<div>{{result}}</div>-->
        </whitesapce>


    </div>
</template>
<script>
    import navPage from '../../../components/nav/navPage'
    import whitesapce from '../../../components/whitespace/whitespace'
    import config from '../../../../config/config'
    import axios from 'axios'
    import qs from 'qs'
    import mixin from '../../../../libs/mixin'
    export default {
        name: "edit",
        components: {navPage, whitesapce},
        mixins:[mixin],
        data() {
            return {
                search: '',
                result: [],
                colors: ['#FF6666',
                    '#66CC99',
                    '#FF9933',
                    '#9999FF',
                    '#66CC00',
                    '#993399',
                    '#6666FF',]
            }
        },
        methods: {
            searchClick() {
                let data = qs.stringify({
                    search: this.search
                })
                axios.post(`${config.baseurl}/php-ci-os/index.php/Os/searchQuestion`,
                    data).then((response) => {
                    let res = response.data
                    if (res.ret === '200') {
                        this.result = res.data
                        this.$Message.success('查询成功')
                    } else {
                        this.$Message.error('查询失败')
                    }

                }).catch(function (error) {
                    console.log(error);
                });
            },
            questionClick(id) {
                this.$router.push(`/admin/question/edit/${id}`)
            },

        }
    }
</script>

<style scoped>
    .q-edit-wrapper {
        display: flex;
        flex-direction: column;
        justify-content: flex-start;
        align-items: flex-start;
    }

    .q-edit-input {
        width: 100%;
        display: flex;
        flex-direction: row;
        justify-content: center;
        align-items: center;
    }

    .chapter-item {
        width: 100%;
        display: flex;
        flex-direction: row;
        justify-content: space-between;
        align-items: center;
        margin-top: 15px;
        border-bottom: 1px #eee solid;
    }

    .chapter-icon {
        font-size: 14px;
        /*border: 1px solid #999;*/
        border-radius: 50%;
        width: 25px;
        height: 25px;
        text-align: center;
        line-height: 25px;
        margin-right: 20px;
        color: #fff;
    }

    .chapter-text {
        font-size: 18px;
        width: 200px;
        height: 80px;
        word-break: break-all;
        text-overflow: ellipsis;
        display: -webkit-box; /** 对象作为伸缩盒子模型显示 **/
        -webkit-box-orient: vertical; /** 设置或检索伸缩盒对象的子元素的排列方式 **/
        -webkit-line-clamp: 3; /** 显示的行数 **/
        overflow: hidden; /** 隐藏超出的内容 **/
    }
</style>