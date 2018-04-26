<template>
    <div>
        <navPage></navPage>
        <whitespace>
            <div class="tag">编辑通知栏</div>
            <div class="n-edit-switch">
                <div class="n-edit-switch-text">是否打开通知栏</div>
                <Switch v-model="mySwitch" @on-change="change"></Switch>
            </div>
            <Input class="n-edit-switch-input" v-model="notice" type="textarea" placeholder="请输入通知栏信息"></Input>
            <div class="n-edit-item">
                <Button @click="change">修改</Button>
            </div>

        </whitespace>
    </div>
</template>

<script>
    import navPage from '../../../components/nav/navPage'
    import whitespace from '../../../components/whitespace/whitespace'
    import qs from 'qs'
    import axios from 'axios'
    import config from '../../../../config/config'
    import mixin from '../../../../libs/mixin'

    export default {
        name: "edit",
        components: {navPage, whitespace},
        mixins: [mixin],
        data() {
            return {
                notice: '',
                mySwitch: false
            }
        },
        mounted() {
            this.$store.commit('getConfiguration')
            this.notice = this.Cnotice
            this.mySwitch = this.CmySwitch
        },
        methods: {
            change() {
                let data = qs.stringify({
                    notice: JSON.stringify({notice: this.notice, switch: this.mySwitch})
                })
                axios.post(`${config.baseurl}/php-ci-os/index.php/Os/updateConfiguration`,
                    data).then((response) => {
                    let res = response.data
                    if (res.ret === '200') {

                        this.$Message.success('success')
                    } else {
                        this.$Message.error('fail')
                    }

                }).catch(function (error) {
                    console.log(error);
                });
            }
        },
        watch: {
            Cnotice(value) {
                this.notice = value
            },
            CmySwitch(value) {
                this.mySwitch = value
            }
        },
        computed: {
            Cnotice() {
                return this.$store.state.configuration.notice
            },
            CmySwitch() {
                return this.$store.state.configuration.switch
            }
        }
    }
</script>

<style scoped>
    .tag {
        font-size: 18px;
        border-left: #2db7f5 4px solid;
        padding-left: 5px;
        margin-bottom: 10px;
    }

    .n-edit-item {
        display: flex;
        flex-direction: row-reverse;
        justify-content: flex-start;
        align-items: center;
        margin-top: 20px;
    }

    .n-edit-switch {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-top: 20px;
    }

    .n-edit-switch-text {
        font-size: 16px;
    }

    .n-edit-switch-input {
        margin-top: 10px;
        padding-top: 20px;
        border-top: 1px solid #eee;
    }
</style>