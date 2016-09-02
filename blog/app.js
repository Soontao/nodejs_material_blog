'use strict'
const express = require('express'),
    path = require('path'),
    favicon = require('serve-favicon'),
    logger = require('morgan'),
    cookieParser = require('cookie-parser'),
    bodyParser = require('body-parser'),
    session = require('express-session'),
    orm = require('orm'),
    mount_uploadify = require('uploadify'),
    fs = require('fs'),
    multer = require('multer'),
    helmet = require('helmet'),

    // 一些Controller
    routes = require('./routes/index'),
    users = require('./routes/users'),
    admin = require("./routes/admin"),
    articles = require("./routes/articles"),
    auth = require("./routes/auth"),

    // 配置文件
    ormsetup = require("./lib/db"),
    authsetup = require("./lib/auth"),
    renderp = require("./lib/renderp"),
    uploadsetup = require("./lib/upload"),

    // express实例
    app = express();


app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

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