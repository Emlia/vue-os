<template>
    <div style="width:100%;height:100%;">
        <div class="wrapper-center">
            <div class="wrapper-title">
                <Avatar src="https://i.loli.net/2017/08/21/599a521472424.jpg" size="large"/>
                <div class="home-text-login">注册</div>
            </div>
            <Input class="home-input" v-model="username" placeholder="请输入用户名" clearable autofocus/>
            <Input class="home-input" v-model="password" placeholder="请输入密码" clearable/>
            <Input class="home-input" v-model="conformPassword" placeholder="请再输入密码" clearable/>
            <Button class="home-input" type="info" long @click="register">注册</Button>
            <Row>
                <Col span="12" class="a-text"
                     style="text-align: left;">
                <div @click="$router.push('/login')">已有帐号,去登录</div>
                </Col>
            </Row>
        </div>
        <Row class="wrapper-bottom">
            <Col span="24" style="text-align: center;">
            登录即代表阅读并统一
            <div class="a-text" @click="doSomething">服务条款</div>
            </Col>
        </Row>
    </div>


</template>

<script>
    import axios from 'axios'
    import qs from 'qs'

    export default {
        name: "register",
        data() {
            return {
                username: '',
                password: '',
                conformPassword: ''
            }
        },
        created() {
        },
        methods: {
            doSomething() {
                this.$Message.info('do something ...')
            },
            register() {
                let data = qs.stringify({
                    username: this.username,
                    password: this.password

                })
                axios.post('http://localhost/php-ci-os/index.php/Os/register',
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