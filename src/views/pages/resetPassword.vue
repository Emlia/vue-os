<template>
    <div>
        <navPage>
            <div slot="left" class="left-left" @click="$router.go(-1)">
                返回上一页
            </div>
        </navPage>
        <whitespace>
            <div class="q-edit-input">
                <Input v-model="search" @on-click="searchClick" icon="ios-search" placeholder="请输入部分用户名内容"
                       style="width: 200px"></Input>
            </div>
            <div class="chapter-item" v-for="(item,index) in result" :key="index">
                <div class="chapter-icon" :style="{backgroundColor:colors[(index)%colors.length]}">{{item.id}}
                </div>
                <div class="chapter-text">{{item.username}}</div>
                <Button :disabled="item.username=='admin'" type="success" @click="resetPassword(item.id)">重置密码</Button>
            </div>
            <!--<div>{{newPassword}}</div>-->
        </whitespace>
        <MDialog v-if="myDialog" :bottom="false">
            <div class="md-title">
                重置密码
            </div>
            <div class="md-text-item">
                <div class="md-content">重置后的密码为:

                </div>
                <div class="md-content" style="color: deepskyblue">{{newPassword}}</div>
            </div>

            <div class="md-close" @click="myDialog=false">关闭</div>
        </MDialog>
    </div>
</template>

<script>
    import navPage from '../components/nav/navPage'
    import whitespace from '../components/whitespace/whitespace'
    import MDialog from '../components/dialog/MDialog'
    import qs from 'qs'
    import axios from 'axios'
    import md5 from 'md5'
    import util from '../../libs/util'
    import config from '../../config/config'
    import mixin from '../../libs/mixin'

    export default {
        name: "reset-password",
        components: {navPage, whitespace, MDialog},
        mixins: [mixin],
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
                    '#6666FF',],
                myDialog: false,
                newPassword: ''
            }
        },
        methods: {
            searchClick() {
                let data = qs.stringify({
                    id: this.$store.state.user.id,
                    appkey: this.$store.state.user.appkey,
                    username: this.search
                })
                axios.post(`${config.baseurl}/php-ci-os/index.php/Os/searchUser`,
                    data).then((response) => {
                    let res = response.data
                    if (res.ret === '200') {
                        this.result = res.data
                        this.$Message.success('成功')
                    } else {
                        this.$Message.error('失败')
                    }

                }).catch(function (error) {
                    this.$Message.error('连接服务器失败')
                });
            },
            resetPassword(id) {
                let time = md5(new Date().getTime()).slice(0, 6)
                this.newPassword = time
                let data = qs.stringify({
                    id: this.$store.state.user.id,
                    appkey: this.$store.state.user.appkey,
                    nid: id,
                    newPassword: md5(this.newPassword)

                })
                axios.post(`${config.baseurl}/php-ci-os/index.php/Os/resetPassword`,
                    data).then((response) => {
                    let res = response.data
                    if (res.ret === '200') {
                        this.$Message.success('成功')
                        this.myDialog = true
                    } else {
                        this.$Message.error('失败')
                    }

                }).catch(function (error) {
                    this.$Message.error('连接服务器失败')
                });


            }
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
        width: 22px;
        height: 22px;
        text-align: center;
        line-height: 22px;
        margin-right: 20px;
        color: #fff;
    }

    .chapter-text {
        font-size: 18px;
        width: 200px;
    }

    .md-title {
        font-size: 15px;
        padding-top: 10px;
        padding-bottom: 10px;
        width: 100%;
        height: 40px;
        line-height: 20px;
        text-align: center;
        border-bottom: 1px solid #eee;
    }

    .md-text-item {
        width: 100%;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
    }

    .md-content {
        font-size: 16px;
        padding-top: 10px;
        padding-bottom: 10px;
    }

    .md-close {
        font-size: 16px;
        padding-top: 10px;
        padding-bottom: 10px;
        width: 100%;
        height: 40px;
        line-height: 20px;
        text-align: center;
        border-top: 1px solid #eee;
    }
</style>