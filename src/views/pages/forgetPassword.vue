<template>
    <div style="width:100%;height:100%;">
        <!--<navPage></navPage>-->
        <div class="wrapper-center">
            <div class="wrapper-title">
                <Avatar src="https://i.loli.net/2017/08/21/599a521472424.jpg" size="large"/>
                <div class="home-text-login">修改密码</div>
            </div>
            <Input class="home-input" v-model="username" placeholder="请输入用户名" clearable autofocus/>
            <Input class="home-input" type="password" v-model="oldPassword" placeholder="请输入原密码" clearable/>
            <Input class="home-input" type="password" v-model="newPassword" placeholder="请输入新密码" clearable/>
            <Input class="home-input" type="password" v-model="conformPassword" placeholder="请再输入新密码" clearable/>
            <Button class="home-input" type="info" long @click="forgetPassword">确认修改</Button>
            <Row>
                <Col span="12" class="a-text"
                     style="text-align: left;">
                <div @click="$router.push('/login')">去登录</div>
                </Col>
            </Row>
        </div>
        <!--<Row class="wrapper-bottom">-->
        <!--<Col span="24" style="text-align: center;">-->
        <!--登录即代表阅读并统一-->
        <!--<div class="a-text" @click="doSomething">服务条款</div>-->
        <!--</Col>-->
        <!--</Row>-->
    </div>


</template>

<script>
    import navPage from '../components/nav/navPage'
    import axios from 'axios'
    import qs from 'qs'
    import md5 from 'md5'
    import config from '../../config/config'

    export default {
        name: "forgetPassword",
        components: {navPage},
        data() {
            return {
                username: '',
                oldPassword: '',
                newPassword: '',
                conformPassword: ''
            }
        },
        methods: {
            forgetPassword() {

                let reg = /^[a-zA-Z0-9]{3,12}$/
                if (!reg.test(this.username)) {
                    this.$Message.info('用户名:英文数字,3-12位')
                    return
                }
                reg = /^[a-zA-Z0-9]{5,12}$/
                if (!reg.test(this.oldPassword)) {
                    this.$Message.info('密码:英文数字,5-12位')
                    return
                }
                reg = /^[a-zA-Z0-9]{5,12}$/
                if (!reg.test(this.newPassword)) {
                    this.$Message.info('密码:英文数字,5-12位')
                    return
                }
                if (this.newPassword !== this.conformPassword) {
                    this.$Message.info('两次密码输入不一致')
                    return
                }
                let data = qs.stringify({
                    username: this.username,
                    oldPassword: md5(this.oldPassword),
                    newPassword: md5(this.newPassword)

                })
                axios.post(`${config.baseurl}/php-ci-os/index.php/Os/forgetPassword`,
                    data).then((response) => {
                    let res = response.data
                    if (res.ret == '200') {
                        this.$Message.success('修改成功')
                        this.$router.replace('/login')
                    } else {
                        this.$Message.error('修改失败,请确认用户名和原密码')
                    }
                }).catch(function (error) {
                    this.$Message.error('连接服务器失败')
                    console.log(error);
                });
            }
        }
    }
</script>

<style scoped>
    .wrapper-title {
        display: flex;
        flex-direction: row;
        justify-content: flex-start;
        align-items: center;
        margin-bottom: 30px;
    }

    .wrapper-center {
        left: 10%;
        right: 10%;
        position: absolute;
        top: 200px;
        transform: translateY(-50%);
    }

    .wrapper-bottom {
        width: 100%;
        position: absolute;
        bottom: 50px;
    }

    .home-text-login {
        font-size: 24px;
        font-weight: 500;
        margin-left: 10px;
    }

    .home-input {
        margin-bottom: 10px;
    }

    .a-text {
        font-size: 10px;
        color: #2d8cf0;
    }

</style>