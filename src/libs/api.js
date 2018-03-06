import axios from 'axios'
import qs from 'qs'

let api = {}
api.getTypes = function () {

}
api.getQuestions = function () {
    let result = {}
    axios.get('http://localhost/php-ci-os/index.php/Os/getQuestions').then((response) => {
        result = response.data
    }).catch(function (error) {
        console.log(error);
    });
    return result
}
export default {
    api
}