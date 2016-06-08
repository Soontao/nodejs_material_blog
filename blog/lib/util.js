var crypto = require("crypto");
var util = new Object();

// 密码加密 如果需要加强密码 改这一个犯法就可以了
util.cryptpass = function cryptpass(str) {
    return crypto.createHash('sha256').update(str).digest('hex');
}

module.exports = util;
