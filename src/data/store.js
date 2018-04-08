import Vuex from 'vuex'
import Vue from 'vue'
import axios from 'axios'
import qs from 'qs'
import config from '../config/config'

Vue.use(Vuex);
let baseurl = ''
if (config.env === 'production') {

} else {
    baseurl = 'http://localhost'
}

const store = new Vuex.Store({
    state: {
        user: {id: 0, username: '', password: '', appkey: ''},
        orderAnswers: {},
        chapterAnswers: {},
        simulationAnswers: {},
        errors: [],
        tags: [],
        chapters: [],
        chapterId: 0,
        etype: 'order',
        types: [],
        question: {
            id: 0,
            type: 0,
            tag: [],
            chapter: 0,
            answer: [],
            text: '',
            src: '',
            analysis: '',
            options: []
        },
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
                if (temp) {
                    // console.log(`i=${i}  ${temp[0]} == ${qt.answer[0]}  ${temp[0] == qt.answer[0]}`)
                    if (temp[0] == qt.answer[0]) {
                        t.push(i)
                    } else {
                        f.push(i)
                        var set = new Set(state.errors);
                        set.add(i)
                        state.errors=Array.from(set)
                    }
                    // console.log('temp', temp)
                }
            }
            return {t, f}
        },
        // 根据question.tag,得到tag的label集合
        showTags(state) {
            let temp = []
            state.tags.forEach(item => {
                // console.log(state.question.tag,item)
                if (state.question.tag.includes(item.value)) {
                    temp.push(item.label)
                }
            })
            return temp
        },
        // 根据question.chapter,得到chapter的label
        showChapter(state) {
            let temp = '未划分章节'
            state.chapters.forEach(item => {
                // console.log(item.value)
                if (item.value === state.question.chapter) {
                    temp = item.label
                }
            })
            return temp
        },
        showType(state) {
            let temp = '未划分类型'
            state.types.forEach(item => {
                // console.log(item.value)
                if (item.value === state.question.type) {
                    temp = item.label
                }
            })
            return temp
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
        uploadOrderAnswer(state) {
            let data = qs.stringify({
                userid: state.user.id,
                orderAnswer: JSON.stringify(state.orderAnswers)

            })
            axios.post(`${baseurl}/php-ci-os/index.php/Os/updateOrderAnswer`,
                data).then((response) => {
                let res = response.data
                if (res.ret == '200') {

                } else {
                }

            }).catch(function (error) {
                console.log(error);
            });
        },
        uploadChapterAnswer(state) {
            let data = qs.stringify({
                userid: state.user.id,
                chapterAnswer: JSON.stringify(state.chapterAnswers)

            })
            axios.post(`${baseurl}/php-ci-os/index.php/Os/updateChapterAnswer`,
                data).then((response) => {
                let res = response.data
                if (res.ret == '200') {

                } else {
                }

            }).catch(function (error) {
                console.log(error);
            });
        },
        uploadSimulationAnswer(state) {
            let data = qs.stringify({
                userid: state.user.id,
                simulationAnswer: JSON.stringify(state.simulationAnswers)

            })
            axios.post(`${baseurl}/php-ci-os/index.php/Os/updateSimulationAnswer`,
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
                    if (data[0].orderAnswer != '{}') {
                        state.orderAnswers = JSON.parse(data[0].orderAnswer)
                    }
                    if (data[0].chapterAnswer != '{}') {
                        state.chapterAnswers = JSON.parse(data[0].chapterAnswer)
                    }
                    if (data[0].simulationAnswer != '{}') {
                        state.simulationAnswers = JSON.parse(data[0].simulationAnswer)
                    }
                    if (data[0].error != '') {
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
                            ch.push({label: item.label, value: item.value})
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
                            ch.push({label: item.label, value: item.id})
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

            if (typeof state.question.options === 'string') {
                state.question.options = JSON.parse(state.question.options)
                state.question.tag = JSON.parse(state.question.tag)
                state.question.answer = JSON.parse(state.question.answer)
            }
            state.question = state.questions[arg.pos]
        },
        login(state, arg) {
            let data = qs.stringify({
                username: arg.username,
                password: arg.password

            })
            axios.post(`${baseurl}/php-ci-os/index.php/Os/login`,
                data).then((response) => {
                let res = response.data
                if (res.ret == '200') {
                    state.user.appkey = res.data[0].appkey
                    state.user.id = res.data[0].id
                    arg._this.$router.push('/home')
                } else {
                }

            }).catch(function (error) {
                console.log(error);
            });
        }
    },
    actions: {}
});
export default store