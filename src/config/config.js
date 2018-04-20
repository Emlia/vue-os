import Env from './env';

let baseurl = ''
if (Env === 'production') {

} else {
    baseurl = 'http://localhost'
}
let config = {
    env: Env,
    baseurl: baseurl
};
export default config;