import axios from 'axios';
import env from '../config/env';
import _ from 'lodash'

let util = {};
util.title = function (title) {
    title = title ? title + ' - Home' : 'iView project';
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
    }
    if (question.type) {
        temp.type = question.type
    }

    temp.chapter = question.chapter
    temp.text = question.text
    temp.src = question.src
    temp.analysis = question.analysis

    console.log('1', temp)
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
    console.log('2', temp)
    return temp
}
export default util;