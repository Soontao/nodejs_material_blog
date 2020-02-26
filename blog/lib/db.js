const orm = require('orm');
const { models } = require("./models")
const { CONNECTION_URI } = require("./config")

module.exports = function (app) {

    // 数据库ORM实体配置
    app.use(orm.express(CONNECTION_URI, models));

}
