var express = require('express');
var router = express.Router();

// 所有文章
router.all("/allblogs", function(req, res, next) {
    req.models.articles.find({}, ['create_date', 'Z'],
        function(err, articles) {
            res.renderp('allblogs', {
                articles: articles,
                page: undefined
            });
        });
});

router.all("/allblogs/page/:pageid", function(req, res, next) {
    var pageid = req.params.pageid;
    req.models.articles.find({}, { offset: (pageid - 1) * 15 }, 15, ['create_date', 'Z'],
        function(err, articles) {
            req.models.articles.count({}, function(err, count) {
                page = {
                    pageid: pageid,
                    count: count,
                    singlepagecount: 15,
                    totalpage: Math.ceil(count / 15),
                    pageurl: "/articles/allblogs/page/"
                };
                res.renderp('allblogs', {
                    articles: articles,
                    page: page
                });
            })
        });
});

router.get("/allblogs/user/:userid", function(req, res, next) {
    req.models.articles.find({
            userid: req.params.userid
        }, ['create_date', 'Z'],
        function(err, articles) {
            if (err) throw err;
            if (articles.length >= 0) {
                res.renderp('allblogs', {
                    articles: articles,
                    page: undefined
                });
            } else {
                next();
            }
        });
});

router.all("/allblogs/user/:userid/page/:pageid", function(req, res, next) {
    var userid = req.params.userid;
    var pageid = req.params.pageid;
    req.models.articles.find({ userid: userid }, { offset: (pageid - 1) * 15 }, 15, ['create_date', 'Z'],
        function(err, articles) {
            req.models.articles.count({ userid: userid }, function(err, count) {
                page = {
                    pageid: pageid,
                    count: count,
                    singlepagecount: 15,
                    totalpage: Math.ceil(count / 15),
                    pageurl: "/artilces/allblogs/user/" + userid + "/page/"
                };
                res.renderp('allblogs', {
                    articles: articles,
                    page: page
                });
            })
        });
});

router.all("/blog/:blogid", function(req, res, next) {

    req.models.articles.get(req.params.blogid, function(err, article) {
        try {
            if (err) throw err;
            req.models.user.get(article.userid, function(err, user) {
                if (err) throw err;
                req.db.driver.execQuery("select comment.*,user.nickname from comment left join user on user.id = comment.userid where comment.articleid  = ? order by createdate desc", [article.id], function(err, comments) {
                    if (err) throw err;
                    res.renderp("blogdetail", {
                        article: article,
                        user: user,
                        comments: comments
                    });
                });
            })
        } catch (e) {
            next(e);
        }
    });

});


// 添加blog API
router.post("/addblog", function(req, res, next) {
    req.models.articles.create({
        title: req.body.title,
        content: req.body.content,
        userid: req.session.user.id,
        create_date: Date.now(),
        modify_date: Date.now()
    }, function(err) {
        if (err)
            throw err;
    });
    res.send("success");
});

// 新建博客
router.all("/newblog", function(req, res, next) {
    res.renderp("newblog", {
        article: undefined
    });
});

// 渲染修改页面
router.get("/editblog/:blogid", function(req, res, next) {
    req.models.articles.get(req.params.blogid, function(err, article) {
        if (err) throw err;
        if (article && article.userid == req.session.user.id)
            res.renderp("editblog", {
                article: article
            });
        else
            res.redirect(req.headers.referer);
    });
});

// 提交修改结果
router.post("/editblog/:blogid", function(req, res, next) {
    req.models.articles.get(req.params.blogid, function(err, article) {
        if (err) throw err;
        if (article && article.userid == req.session.user.id) {
            article.title = req.body.title;
            article.content = req.body.content;
            article.modify_date = Date.now()
            article.save(function(err) {
                if (err) throw err;
                res.send("update success")
            });
        } else
            next();
    });
});

// 显示博客管理器
router.get("/blogmanager", function(req, res, next) {
    res.redirect("/articles/blogmanager/page/1");
});

router.get("/blogmanager/page/:pageid", function(req, res, next) {
    var pageid = req.params.pageid
    var usertype = req.session.user.usertype;
    req.db.driver.execQuery("select articles.*,user.nickname from articles LEFT JOIN user on articles.userid = user.id order by create_date desc limit ?,?", [(pageid - 1) * 10, pageid * 10], function(err, articles) {
        if (err) throw err;
        req.models.user.count({}, function(err, count) {
            if (err) throw err;
            page = {
                pageid: pageid,
                count: count,
                singlepagecount: 10,
                totalpage: Math.ceil(count / 10),
                pageurl: "/articles/blogmanager/page/"
            };
            res.renderp('blogmanager', {
                articles: articles,
                page: page
            });
        });
    });
});


// 删除博客
router.all("/deleteblog/:blogid", function(req, res, next) {
    req.models.articles.find({
        id: req.params.blogid,
    }).remove(function(err) {
        if (err) throw err;
        else res.send("success");
    });
});

// 渲染评论管理器
router.get("/comment/commentmanager", function(req, res, next) {
    res.redirect("/articles/comment/commentmanager/page/1");
});


router.get("/comment/commentmanager/page/:pageid", function(req, res, next) {
    var pageid = req.params.pageid
    req.db.driver.execQuery("select comment.*,articles.title,user.nickname from comment  LEFT JOIN articles on articles.id = comment.articleid LEFT JOIN user on comment.userid = user.id order by createdate desc limit ?,?", [(pageid - 1) * 10, pageid * 10], function(err, comments) {
        if (err) throw err;
        req.models.comment.count({}, function(err, count) {
            if (err) throw err;
            page = {
                pageid: pageid,
                count: count,
                singlepagecount: 10,
                totalpage: Math.ceil(count / 10),
                pageurl: "/articles/comment/commentmanager/page/"
            };
            res.renderp('commentmanager', {
                comments: comments,
                page: page
            });
        });
    });
});


// 提交新评论
router.post("/comment/add/:blogid", function(req, res, next) {
    acomment = req.body;
    acomment.userid = req.session.user.id;
    acomment.createdate = Date.now();
    acomment.articleid = req.params.blogid;
    req.models.comment.create(acomment, function(err) {
        if (err) throw err;
        console.log(acomment);
        res.send("success");
    });
});

router.get("/comment/update/:cid", function(req, res, next) {

});

router.post("/comment/update/:cid", function(req, res, next) {
    req.models.comment.get(req.params.cid, function(err, cmt) {
        if (err) throw err;
        if (cmt && cmt.userid == req.session.user.id) {
            cmt.save(req.body, function(err) {
                if (err) throw err;
                res.send("success")
            });
        } else
            next();
    });
});


router.all("/comment/delete/:cid", function(req, res, next) {
    req.models.comment.find({
        id: req.params.cid
    }).remove(function(err) {
        if (err) throw err;
        else res.redirect(req.headers.referer)
    });
});


module.exports = router;