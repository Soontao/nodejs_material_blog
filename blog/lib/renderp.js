const renderp = app => {
    // Express app
    app.use(req => {
        const res = req.res;
        const next = req.next;
        req.models.setting.find({}, function(err, lines) {
            if (err) throw err;
            res.locals['sessionuser'] = req.session.user;
            lines.forEach(record => {
                res.locals[record.key] = JSON.parse(record.value);
            });
            res.renderp = res.render;
            // 强制同步完成之后，再进入下一个路由
            next();
        });
    })
}

module.exports = renderp;