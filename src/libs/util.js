import axios from 'axios';
import env from '../config/env';
import _ from 'lodash'

let util = {};
util.title = function (title) {
    title = title ? title + ' - Home' : 'os';
    window.document.title = title;
};

const ajaxUrl = env === 'development' ?
    'http://127.0.0.1:8888' :
    env === 'production' ?
        'https://www.url.com' :
        'https://debug.url.com';

util.ajax = axios.create({
    baseURL: ajaxUrl,
    timeout: 30000
});

util.toQuestion = function (question) {
    let temp = {}
    if (question.id) {
        temp.id = question.id
    } else {
        return {}
    }
    if (question.type) {
        temp.type = question.type
    }

    temp.chapter = question.chapter
    temp.text = question.text
    temp.src = question.src
    temp.analysis = question.analysis

    // console.log('1', temp)
    if (typeof question.options === 'string') {
        temp.options = JSON.parse(question.options)
    } else {
        temp.options = question.options
    }
    if (typeof question.tag === 'string') {
        temp.tag = JSON.parse(question.tag)
    } else {
        temp.tag = question.tag
    }

    if (typeof question.answer === 'string') {
        temp.answer = JSON.parse(question.answer)
    } else {
        temp.answer = question.answer
    }
    // console.log('1.5', _.cloneDeep(temp))
    // console.log('2', temp)
    return temp
}
// 返回答题的状态,问题的答案和我的答案.答案未知:contain:包含,答案产生结果--empty:没有,作答 error:答案中有错误的,true:完全正确
util.getAnswerState = function (questionAnswer, myAnswer) {

    //如果有错误答案或者完全正确,则
    let a = questionAnswer
    let b = myAnswer
    let flag = true

    // console.log(`---length ----${a.length}----${ b.length}---${a}----${b}`)
    if (b == undefined || b[0] == undefined || b[0] == '') {
        return 'empty'
    }
    // b中包含a没有的,则flag=false
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
    //选择的过程中
    if (flag && a.length > b.length) {
        return 'contain'
    } else if (flag && a.length == b.length) {
        //正确
        return 'true'
    } else {
        //错误
        return 'error'
    }

}
util.myAnswerIsEmpty = function (myAnswers) {
    let len = Object.keys(myAnswers).length
    if (len == 0) {
        return true
    }
    let flag = true
    Object.keys(myAnswers).forEach(key => {
        // console.log('myAnswerIsEmpty---', myAnswers[key])
        if (myAnswers[key].length != 0) {
            flag = false
            // console.log('----?????---', flag)
        }
    })
    return flag
}
util.myAnswerIsExist = function (myAnswers) {
    return !this.myAnswerIsEmpty(myAnswers)
}
util.getQuestionById = function (questions, id) {
    for (let i = 0; i < questions.length; i++) {
        if (questions[i].id == id) {
            return this.toQuestion(questions[i])
        }
    }
    return {
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
}
util.whereIsMyAnswersChapter = function (myAnswers, questions) {
    let keys = Object.keys(myAnswers)
    // console.log('keys', keys)
    if (keys.length != 0 && keys[0] && questions.length != 0) {
        // console.log('value', questions[keys[0]])
        return this.getQuestionById(questions, keys[0]).chapter
    } else {
        return -1
    }

}
util.getSimArray = function (questions) {
    let arr = _.cloneDeep(questions)
    let sim = []
    let ranNum = 10;
    for (let i = 0; i < ranNum; i++) {

        let ran = Math.floor(Math.random() * arr.length)
        let temp = arr.splice(ran, 1)[0]
        sim.push(temp.id)
    }
    return sim
}
util.getQuestionByArray = function (questions, array) {
    let temp = []
    let question = {}
    for (let i = 0; i < array.length; i++) {
        question = this.getQuestionById(questions, array[i])
        if (question.text) {
            temp.push(question)
        }
    }
    // console.log('getQuestionByArray',temp)
    return temp
}
util.setValue = function (key, value) {
    localStorage.setItem(key, JSON.stringify(value))
}
util.getValue = function (key) {
    return JSON.parse(localStorage.getItem(key))
}
export default util;