var express = require('express');
var router = express.Router();

router.all('/', function(req, res, next) {
    res.redirect("/admin/overview");
});

router.get("/overview", function(req, res, next) {
    req.db.driver.execQuery("select view.viewname from usertypeview left join usertype on usertype.id = usertypeview.usertypeid left join view on usertypeview.viewid = view.id where usertype.id = ?", [req.session.user.usertype], function(err, data) {
        if (err) throw err;
        res.renderp("overview", {
            process: process,
            views: data
        });
    });
});

router.get("/costume", function(req, res, next) {
    res.renderp("costume");
});

router.post("/costume", function(req, res, next) {
    req.models.setting.find({
        key: "site"
    }, function(err, values) {
        values[0].save({ value: JSON.stringify(req.body) }, function(err) {
            if (err) throw err;
            res.send("success");
        });
    });
});

module.exports = router;
