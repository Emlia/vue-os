import Vuex from 'vuex'
import Vue from 'vue'
import axios from 'axios'
import qs from 'qs'

Vue.use(Vuex);
const store = new Vuex.Store({
    state: {
        user: {id: 0, username: '', password: ''},
        myAnswers: [],
        questions: [],
        tags: [],
        chapters: [],
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
        }
    },
    getters: {
        showTF: (state) => {
            let t = []
            let f = []
            let temp = []
            state.questions.forEach(item => {
                temp = state.myAnswers[item.id]
                if (temp != undefined) {
                    if (temp[0] == item.answer[0]) {
                        t.push(item.id)
                    } else {
                        f.push(item.id)
                    }
                }
            })
            return {t, f}
        },
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
        showChapter(state) {
            let temp = '未划分章节'
            state.chapters.forEach(item => {
                console.log(item.value)
                if (item.value === state.question.chapter) {
                    temp = item.label
                }
            })
            return temp
        }
    },
    mutations: {
        // args:{id,username,password}
        setLoginState(state, args) {
            state.user = args
        },
        // args:{key,value}
        addMyAnswer(state, args) {
            // state.myAnswers[args.key] = args.value
            Vue.set(state.myAnswers, args.key, args.value)
        },
        getQuestions(state) {
            if (state.questions.length == 0) {
                axios.get('http://localhost/php-ci-os/index.php/Os/getQuestions').then((response) => {
                    let code = response.data.ret
                    if (code == '200') {
                        state.questions = response.data.data
                        state.question = state.questions[0]
                    }
                }).catch(function (error) {
                    console.log(error);
                });
            }
        },
        getTags(state) {
            if (state.tags.length == 0) {
                axios.get('http://localhost/php-ci-os/index.php/Os/getTags'
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
                axios.get('http://localhost/php-ci-os/index.php/Os/getChapters'
                ).then((res) => {
                    let code = res.data.ret
                    if (code == '200') {
                        let temp = res.data.data
                        let ch = []
                        temp.forEach(item => {
                            ch.push({label: item.name, value: item.id})
                        })
                        state.chapters = ch
                    }

                }).catch(function (error) {
                    console.log(error);
                });
            }
        },
        // pos
        getQuestion(state, pos) {
            state.question = state.questions[pos]
            state.question.options = JSON.parse(state.question.options)
            state.question.tag = JSON.parse(state.question.tag)
            state.question.answer = JSON.parse(state.question.answer)
        },
    },
    actions: {}
});
export default store