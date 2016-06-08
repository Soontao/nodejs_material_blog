module.exports = function renderp(app) {
    // Express app
    app.use(function(req, res, next) {
        req.models.setting.find({}, function(err, keys) {
            if (err) throw err;
            res.renderp = function(template, data) {
                data = data || {};
                keys.forEach(function(record) {
                    data[record.key] = JSON.parse(record.value);
                });
                data['sessionuser'] = req.session.user;
                return res.render(template, data);

            }
            next();
        });

    })
}
