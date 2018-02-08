<template>
    <div style="width:100%;height:100%;">
        <div class="wrapper-center">
            <div class="wrapper-title">
                <Avatar src="https://i.loli.net/2017/08/21/599a521472424.jpg" size="large"/>
                <div class="home-text-login">登录</div>
            </div>
            <Input class="home-input" v-model="username" placeholder="请输入用户名" clearable autofocus></Input>
            <Input class="home-input" v-model="password" placeholder="请输入密码" clearable></Input>
            <Button class="home-input" type="info" long @click="doSomething">登录</Button>
            <Row>
                <Col span="12" class="a-text" style="text-align: left;" @click="doSomething">
                忘记密码?</Col>
                <Col span="12" class="a-text"
                     style="text-align: right;"  @click="doSomething">
                新用户注册</Col>
            </Row>
        </div>
        <Row class="wrapper-bottom">
            <Col span="24" style="text-align: center;">
            登录即代表阅读并统一
            <div class="a-text"  @click="doSomething">服务条款</div>
            </Col>
        </Row>
    </div>


</template>

<script>
    import axios from 'axios';

    export default {
        name: "home",
        data() {
            return {
                username: '',
                password: ''
            }
        },
        created() {
            this.getBackgroundImage()
        },
        methods: {
            async getBackgroundImage() {
                let res = await axios.get('http://guolin.tech/api/bing_pic').then(function (response) {
                    console.log(response);
                })
                    .catch(function (error) {
                        console.log(error);
                    });
                ;

            },
            doSomething() {
                this.$Message.info('do something ...')
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