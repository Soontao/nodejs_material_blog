var express = require('express');
var router = express.Router();
var util = require('../lib/util');

// 一些主要的API

router.all("/", function(req, res, next) {
    res.redirect("index");
});

router.all("/index", function(req, res, next) {
    req.models.articles.find({}, {}, 10, ['modify_date', 'Z'], function(err,
        articles) {
        res.renderp("index", {
            articles: articles
        });
    });

});

/* 登录处理 */
router.post("/login", function(req, res, next) {
    uname = req.body.username;
    password = req.body.password;
    req.models.user.find({
        username: uname
    }, function(err, people) {
        if (err)
            throw err;
        var auth = false;
        if (people.length > 0 && people[0].passwd === util.cryptpass(password)) {
            auth = true;
            people[0].lastlogindate = Date.now();
            people[0].lastloginip = req.ip;
            people[0].save(function(err) {
                if (err) throw err;
            });
        };
        if (auth) {
            req.session.islogin = true;
            req.session.user = people[0];
            res.send("success");
        } else {
            res.send("failed");
        }
    });

});

router.get("/login", function(req, res, next) {
    res.renderp("login");
});


// 注销
router.all("/logout", function(req, res, next) {
    req.session.destroy(function(err) {
        if (err) throw err;
        res.redirect("/");
    })

});

//注册页面
router.get("/register", function(req, res, next) {
    req.models.usertype.find({}, function(err, items) {
        res.renderp("user", {
            submiturl: "/register",
            usertypes: [{
                id: 2,
                usertype: "普通用户"
            }]
        });
    })
});

//注册请求
router.post("/register", function(req, res, next) {
    adduser = req.body;
    if (adduser) {
        adduser.usertype = 2;
        adduser.passwd = util.cryptpass(adduser.passwd);
        req.models.user.create(adduser, function(err) {
            if (err) throw err;
            res.redirect("/login");
        });
    } else {
        next();
    }
});


module.exports = router;
