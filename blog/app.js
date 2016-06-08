var express = require('express');
var path = require('path');
var favicon = require('serve-favicon');
var logger = require('morgan');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');
var session = require('express-session');
var orm = require('orm');
var mount_uploadify = require('uploadify');
var fs = require('fs');
var multer = require('multer');
var helmet = require('helmet')


var routes = require('./routes/index');
var users = require('./routes/users');
var admin = require("./routes/admin");
var articles = require("./routes/articles");
var auth = require("./routes/auth");

var ormsetup = require("./lib/db");
var authsetup = require("./lib/auth");
var renderp = require("./lib/renderp");
var uploadsetup = require("./lib/upload");


var app = express();


// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');
app.set('env', 'development');

app.use(logger('dev'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
    extended: false
}));
// helmet 安全框架
app.use(helmet());
app.use(cookieParser());
// session配置
app.use(session({
    secret: 'user auth',
    resave: true,
    saveUninitialized: false
}));

// 数据库ORM实体配置
ormsetup(app);
// 权限配置
authsetup(app);
// 重新封装render 实现全局渲染
renderp(app);
// 配置文件上传
uploadsetup(app);

// 配置各个路由
app.use('/', routes);
app.use('/admin/users', users);
app.use('/admin', admin);
app.use('/articles', articles);
app.use('/admin/auth', auth);


// 经过所有路由之后,才查找静态文件
app.use(express.static(path.join(__dirname, 'public')));

// 如果没有找到一个文件或者路由来处理请求
// 就会到这里,抛出404 Error
app.use(function(req, res, next) {
    var err = new Error('Not Found');
    err.status = 404;
    next(err);
});

// error handlers

// development error handler
// will print stacktrace
if (app.get('env') === 'development') {
    app.use(function(err, req, res, next) {
        res.status(err.status || 500);
        res.render('error', {
            message: err.message,
            error: err
        });
    });
}

// production error handler
// no stacktraces leaked to user
app.use(function(err, req, res, next) {
    res.status(err.status || 500);
    res.render('error', {
        message: err.message,
        error: {}
    });
});


module.exports = app;
