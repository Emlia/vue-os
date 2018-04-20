<template>
    <div style="width:100%;height:100%;">
        <navPage>
        </navPage>
        <div class="wrapper-center">
            <div class="wrapper-title">
                <Avatar src="https://i.loli.net/2017/08/21/599a521472424.jpg" size="large"/>
                <div class="home-text-login">登录</div>
            </div>
            <div class="input-text">
                <Input class="home-input" v-model="username" placeholder="请输入用户名" clearable autofocus></Input>
                <!--<Icon class="input-icon" size="20" color="#ed3f14" type="close-round"></Icon>-->
            </div>
            <div class="input-text">
                <Input class="home-input" type="password" v-model="password" placeholder="请输入密码" clearable></Input>
                <!--<div class="input-icon" style="color:#19be6b;width:19px;height:20px;line-height: 20px;font-size: 15px;">强</div>-->
                <!--<div class="input-icon" style="width: 19px;"></div>-->
            </div>

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
        <!--<div>{{res}}</div>-->
    </div>


</template>

<script>
    import navPage from '../components/nav/navPage'

    export default {
        name: "login",
        components: {navPage},
        data() {
            return {
                username: 'admin',
                password: 'admin',
                res: ''
            }
        },
        methods: {
            doSomething() {
                this.$Message.info('do something ...')
            },
            login() {
                this.$store.commit('login', {username: this.username, password: this.password, _this: this})
            },

        },

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
        top: 33%;
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

    .input-text {
        display: flex;
        flex-direction: row;
        justify-content: flex-start;
        align-items: center;
    }

    .input-icon {
        margin-left: 5px;
        margin-bottom: 15px;
    }
</style>