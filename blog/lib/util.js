var crypto = require("crypto");

// 密码加密 如果需要加强密码 改这一个方法就可以了
const cryptpass = function cryptpass(str) {
    return crypto.createHash('sha256').update(str).digest('hex');
}

module.exports = { cryptpass };
