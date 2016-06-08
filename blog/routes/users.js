var express = require('express');
var router = express.Router();
var debug = require("debug")("models:user");
var util = require("../lib/util");

router.get("/usermanager", function(req, res, next) {
    res.redirect("/admin/users/usermanager/page/1");
});

router.get("/usermanager/page/:pageid", function(req, res, next) {
    var pageid = req.params.pageid
    req.models.user.find({}, { offset: (pageid - 1) * 10 }, 10, function(err, users) {
        req.models.user.count({}, function(err, count) {
            if (err) throw err;
            page = {
                pageid: pageid,
                count: count,
                singlepagecount: 10,
                totalpage: Math.ceil(count / 10),
                pageurl: "/admin/users/usermanager/page/"
            };
            res.renderp('usermanager', {
                users: users,
                page: page
            });
        })
    });
});


router.all("/delete/:userid", function(req, res, next) {
    req.models.user.find({
        id: req.params.userid
    }).remove(function(err) {
        if (err) throw err;
        else res.redirect("/admin/users/usermanager");
    });
});

router.get("/get/:userid", function(req, res, next) {
    req.models.user.find({
        id: req.params.userid
    }, function(err, users) {
        if (err) throw err;
        if (users[0]) {
            res.json(users[0]);
        } else {
            next();
        }
    });
});

router.get("/add", function(req, res, next) {
    req.models.usertype.find({}, function(err, items) {
        res.renderp("user", {
            submiturl: "/admin/users/add",
            usertypes: items
        });
    })
});

router.post("/add", function(req, res, next) {
    adduser = req.body;
    if (adduser) {
        adduser.usertype = adduser.usertype || 2;
        adduser.passwd = util.cryptpass(adduser.passwd);
        req.models.user.create(adduser, function(err) {
            if (err) throw err;
            res.redirect("/admin/users/usermanager");
        });
    } else {
        next();
    }
});

router.get("/update/:userid", function(req, res, next) {
    req.models.user.get(
        req.params.userid,
        function(err, auser) {
            if (err) throw err;
            if (auser) {
                auser.passwd = undefined;
                req.models.usertype.find({}, function(err, items) {
                    res.renderp("user", {
                        submiturl: "/admin/users/update/" + auser.id,
                        user: auser,
                        usertypes: items
                    });
                });
            } else {
                next();
            }
        });
});

router.post("/update/:userid", function(req, res, next) {
    if (req.body) {
        req.models.user.get(
            req.params.userid,
            function(err, auser) {
                if (err) throw err;
                if (auser) {
                    req.body.passwd = req.body.passwd || "";
                    if (req.body.passwd) req.body.passwd = util.cryptpass(req.body.passwd);
                    else delete req.body.passwd;
                    auser.save(req.body, function(err) {
                        if (err) throw err;
                        res.redirect("/admin/users/usermanager");
                    });
                } else {
                    next();
                }
            });
    } else {
        next();
    }
});



module.exports = router;
