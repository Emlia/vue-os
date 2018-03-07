<template>
    <div style="width:100%;height:100%;">
        <div class="wrapper-center">
            <div class="wrapper-title">
                <Avatar src="https://i.loli.net/2017/08/21/599a521472424.jpg" size="large"/>
                <div class="home-text-login">登录</div>
            </div>
            <Input class="home-input" v-model="username" placeholder="请输入用户名" clearable autofocus></Input>
            <Input class="home-input" v-model="password" placeholder="请输入密码" clearable></Input>
            <Button class="home-input" type="info" long @click="login">登录</Button>
            <Row>
                <Col span="12" class="a-text" style="text-align: left;" @click="doSomething">
                忘记密码?</Col>
                <Col span="12" class="a-text"
                     style="text-align: right;">
                <div @click="$router.push('/register')">新用户注册</div>
                </Col>
            </Row>
        </div>
        <Row class="wrapper-bottom">
            <Col span="24" style="text-align: center;">
            登录即代表阅读并统一
            <div class="a-text" @click="doSomething">服务条款</div>
            </Col>
        </Row>
        <div>{{res}}</div>
    </div>


</template>

<script>
    import axios from 'axios'
    import qs from "qs"

    export default {
        name: "login",
        data() {
            return {
                username: 'emlia',
                password: 'emlia103',
                res: ''
            }
        },
        created() {
            // this.getBackgroundImage()
            console.log('os', this)
            // this.login()
        },
        methods: {
            // async getBackgroundImage() {
            //     let res = await axios.get('http://guolin.tech/api/bing_pic')
            // },
            doSomething() {
                this.$Message.info('do something ...')
            },
            login() {
                let data = qs.stringify({
                    username: this.username,
                    password: this.password

                })
                axios.post('http://localhost/php-ci-os/index.php/Os/login',
                    data).then((response) => {
                    this.res = response.data
                    if (this.res.ret == '200') {
                        this.$store.commit('setLoginState', this.res.data[0])
                        this.$router.push('home')
                    } else {
                        this.$Message.error('用户名或密码错误')
                    }
                }).catch(function (error) {
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
        top: 28%;
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