module.exports = function auth(app) {
    // 通过Session记录认证信息
    app.use(function(req, res, next) {
        if (!req.session.isinit) {
            req.session.isinit = true;
            req.session.islogin = false;
            req.session.user = "";
        };
        next();
    });

    // 配置
    app.use(function(req, res, next) {
        var url = req.originalUrl;
        var method = req.method;
        var isStatic = false;
        //session user或者未注册用户
        var user = req.session.user || {
            usertype: 0
        }

        if (url.startsWith("/js") || url.startsWith("/css") || url.startsWith("/images") || url.startsWith("/umeditor") || url == "/") {
            isStatic = true;
        }
        if (!isStatic) {
            // 非静态文件
            if (method == 'GET') {
                // view 
                req.db.driver.execQuery("select * from usertypeview where viewid in (select id from view where substr(?,1,length(url)) = url) and usertypeid = ?", [url, user.usertype], function(err, views) {
                    if (err) throw err;
                    if (views.length > 0) {
                        next();
                    } else {
                        var err = new Error();
                        err.status = 401;
                        next(err);
                    }
                })
            } else if (method == 'POST') {
                // api
                req.db.driver.execQuery("select * from usertypeapi where apiid in (select id from api where substr(?,1,length(url)) = url) and usertypeid = ?", [url, user.usertype], function(err, apis) {
                    if (err) throw err;
                    if (apis.length > 0) {
                        next();
                    } else {
                        var err = new Error();
                        err.status = 401;
                        next(err);
                    }

                })

            } else {
                var err = new Error("非标准方法");
                err.status = 500;
                next(err);
            }
        } else {
            next();
        }


    });

}
