import Vuex from 'vuex'
import Vue from 'vue'
import axios from 'axios'
import qs from 'qs'
import config from '../config/config'
import md5 from 'md5'

Vue.use(Vuex);
let baseurl = ''
if (config.env === 'production') {

} else {
    baseurl = 'http://localhost'
}

const store = new Vuex.Store({
    state: {
        user: {id: 0, username: '', appkey: ''},
        orderAnswers: {},
        chapterAnswers: {},
        simulationAnswers: {},
        errorAnswers: {},
        errors: [],
        tags: [],
        chapters: [],
        chapterId: 0,
        etype: 'order',
        types: [],
        keepOnSim: false,
        keepOnChapter: false,
        questions: [],
    },
    getters: {
        // t:true的题目id,f:false的题目id
        showTF: (state, getters) => {
            let t = []
            let f = []
            let temp = []
            let qt = {}

            for (let i = 0; i < state.questions.length; i++) {

                if (typeof state.questions[i].options === 'string') {
                    state.questions[i].options = JSON.parse(state.questions[i].options)
                    state.questions[i].tag = JSON.parse(state.questions[i].tag)
                    state.questions[i].answer = JSON.parse(state.questions[i].answer)
                }
                qt = state.questions[i]
                temp = getters.getMyAnswer[qt.id]
                // console.log(`+++${qt}++++${temp}++++`)
                if (qt && temp && temp[0]) {
                    // console.log(`i=${i}  ${temp[0]} == ${qt.answer[0]}  ${temp[0] == qt.answer[0]}`)
//


                    let a = qt.answer
                    let b = temp
                    let flag = true

                    // console.log(`---length ----${a.length}----${ b.length}---${a}----${b}`)
                    if (a && b) {
                        for (let j = 0; j < b.length; j++) {
                            // console.log(`包含的判断 ${b[j]}  ${a.includes(b[j])} a=  ${a}; b= ${b}`)
                            if (!a.includes(b[j])) {
                                flag = false
                            }
                        }
                    } else {
                        flag = false
                    }
                    // console.log(`${flag}  ${a.length} ${temp.length}`)
                    if (flag && a.length > temp.length) {

                    } else if (flag && a.length == temp.length) {
                        t.push(i)
                    } else {
                        f.push(i)
                        var set = new Set(state.errors);
                        set.add(i)
                        state.errors = Array.from(set)
                    }
                    // console.log('temp', temp)
                }
            }
            return {t, f}
        },

        getMyAnswer(state) {
            let temp = []
            switch (state.etype) {
                case 'order':
                    temp = state.orderAnswers
                    break;
                case 'chapter':
                    temp = state.chapterAnswers
                    break;
                case 'simulation':
                    temp = state.simulationAnswers
                    break;
                case 'error':
                    temp = state.errorAnswers
                    break;
                default:
                    temp = {}
                    console.log('ettype 出错')
            }
            // console.log('MytAnswer', temp)
            return temp
        }
    },
    mutations: {
        setChapterId(state, id) {
            state.chapterId = id
        },
        setEtype(state, type) {
            state.etype = type
        },
        // args:{id,username,password}
        setLoginState(state, args) {
            state.user = args
        },
        // args:{id,value}
        addAnswer(state, args) {
            switch (state.etype) {
                case 'order':
                    Vue.set(state.orderAnswers, args.id, args.value);
                    this.commit('uploadAnswer')
                    break;
                case 'chapter':
                    Vue.set(state.chapterAnswers, args.id, args.value);
                    this.commit('uploadAnswer')
                    break;
                case 'simulation':
                    Vue.set(state.simulationAnswers, args.id, args.value);
                    this.commit('uploadAnswer')
                    break;
                case 'error':
                    Vue.set(state.errorAnswers, args.id, args.value);
                    break;
                default:
                    console.log('ettype 出错')
            }


        },
        uploadAnswer(state) {
            let data = qs.stringify({
                userid: state.user.id,
                orderAnswer: JSON.stringify(state.orderAnswers),
                chapterAnswer: JSON.stringify(state.chapterAnswers),
                simulationAnswer: JSON.stringify(state.simulationAnswers),
                error: JSON.stringify(state.errors)
            })
            axios.post(`${baseurl}/php-ci-os/index.php/Os/updateAnswer`,
                data).then((response) => {
                let res = response.data
                if (res.ret == '200') {

                } else {
                }

            }).catch(function (error) {
                console.log(error);
            });
        },
        getAnswers(state) {
            if (Object.keys(state.orderAnswers).length !== 0) {
                return
            }
            let data = qs.stringify({
                userid: state.user.id,
            })
            axios.post(`${baseurl}/php-ci-os/index.php/Os/getAnswersById`, data).then((response) => {
                let code = response.data.ret
                if (code == '200') {

                    let data = response.data.data
                    if (data.length == 0) {
                        return
                    }
                    // console.log(`${data[0].orderAnswer == ''} ${data[0].orderAnswer == '{}'}`)
                    if (!(data[0].orderAnswer == '' || data[0].orderAnswer == '{}')) {
                        state.orderAnswers = JSON.parse(data[0].orderAnswer)
                    }
                    if (!(data[0].chapterAnswer == '' || data[0].chapterAnswer == '{}')) {
                        state.chapterAnswers = JSON.parse(data[0].chapterAnswer)
                        state.keepOnChapter = true
                    }
                    if (!(data[0].simulationAnswer == '' || data[0].simulationAnswer == '{}')) {
                        state.simulationAnswers = JSON.parse(data[0].simulationAnswer)
                        state.keepOnSim = true
                    }
                    if (!(data[0].error == '' || data[0].error == '{}')) {
                        state.errors = JSON.parse(data[0].error)
                    }

                }
            }).catch(function (error) {
                console.log(error);
            });


        },
        getQuestions(state) {
            console.log('getQuestions')
            if (state.questions.length == 0) {
                axios.get(`${baseurl}/php-ci-os/index.php/Os/getQuestions`).then((response) => {
                    let code = response.data.ret
                    if (code == '200') {
                        state.questions = response.data.data
                        // state.question = state.questions[0]
                        // Vue.nextTick(() => {
                        this.commit('getQuestion', {type: 'order', pos: 0})
                        // })

                        // console.log('question', this.commit('getQuestion', 0))
                    }
                }).catch(function (error) {
                    console.log(error);
                });

            } else {
                this.commit('getQuestion', {type: 'order', pos: 0})
            }
        },
        getTags(state) {
            if (state.tags.length == 0) {
                axios.get(`${baseurl}/php-ci-os/index.php/Os/getTags`
                ).then((res) => {
                    let code = res.data.ret
                    if (code == '200') {
                        let temp = res.data.data
                        let ch = []
                        temp.forEach(item => {
                            ch.push({label: item.label, value: item.id})
                        })
                        state.tags = ch
                    }

                }).catch(function (error) {
                    console.log(error);
                });
            }
        },
        getChapters(state) {
            if (state.chapters.length == 0) {
                axios.get(`${baseurl}/php-ci-os/index.php/Os/getChapters`
                ).then((res) => {
                    let code = res.data.ret
                    if (code == '200') {
                        let temp = res.data.data
                        let ch = []
                        temp.forEach(item => {
                            ch.push({label: item.label, value: item.value, id: item.id})
                        })
                        state.chapters = ch
                    }

                }).catch(function (error) {
                    console.log(error);
                });
            }
        },
        getTypes(state) {
            if (state.types.length == 0) {
                axios.get(`${baseurl}/php-ci-os/index.php/Os/getTypes`
                ).then((res) => {
                    let code = res.data.ret
                    if (code == '200') {
                        let temp = res.data.data
                        let ch = []
                        temp.forEach(item => {
                            // console.log('ggg')
                            ch.push({label: item.label, value: item.value, id: item.id})
                        })
                        state.types = ch
                    }
                }).catch(function (error) {
                    console.log(error);
                });
            }
        },
        // {type,pos}
        getQuestion(state, arg) {
            // console.log('getQuestion-', arg.pos)
            let i = arg.pos
            if (typeof state.questions[i].options === 'string') {
                state.questions[i].options = JSON.parse(state.questions[i].options)
                state.questions[i].tag = JSON.parse(state.questions[i].tag)
                state.questions[i].answer = JSON.parse(state.questions[i].answer)
            }
        },
        login(state, arg) {
            let data = qs.stringify({
                username: arg.username,
                password: md5(arg.password)

            })
            axios.post(`${baseurl}/php-ci-os/index.php/Os/login`,
                data).then((response) => {
                let res = response.data
                if (res.ret == '200') {
                    state.user.appkey = res.data[0].appkey
                    state.user.id = res.data[0].id
                    state.user.username = res.data[0].username
                    //初始化

                    state.orderAnswers = {}
                    state.chapterAnswers = {}
                    state.simulationAnswers = {}
                    state.errors = []
                    state.keepOnSim = false
                    state.keepOnChapter = false

                    arg._this.$router.push('/home')
                    arg._this.$Message.success('登录成功')
                } else {
                    arg._this.$Message.error('用户名或密码错误')
                }

            }).catch(function (error) {
                arg._this.$Message.error('连接服务器失败')
                console.log(error);
            });
        },
        reStartSim(state) {
            state.keepOnSim = false
            state.simulationAnswers = {}
        },
        reStartChapter(state) {
            state.keepOnChapter = false
            state.chapterAnswers = {}
        },

    },
    actions: {}
});
export default store