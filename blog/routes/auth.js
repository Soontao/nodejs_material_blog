var express = require('express');
var router = express.Router();
var util = require('../lib/util');

// 用户类型管理
router.get("/usertype/manager", function(req, res, next) {
    req.db.driver.execQuery("select * from usertype", function(err, items) {
        res.renderp("usertypemanager", {
            usertypes: items
        });
    });
});

router.get("/usertype/add", function(req, res, next) {
    res.renderp("usertype", {
        type: undefined,
        submiturl: req.baseUrl + "/usertype/add"
    });
});


router.post("/usertype/add", function(req, res, next) {
    req.models.usertype.create(req.body, function(err) {
        if (err) throw err;
        res.redirect(req.baseUrl + "/usertype/manager");
    });

});

router.get("/usertype/update/:id", function(req, res, next) {
    var id = req.params.id;
    req.models.usertype.get(id, function(err, item) {
        if (err) throw err;
        res.renderp("usertype", {
            type: item,
            submiturl: req.baseUrl + "/usertype/update/" + id
        });
    });

});

router.post("/usertype/update/:id", function(req, res, next) {
    var id = req.params.id;
    req.models.usertype.get(id, function(err, item) {
        if (err) throw err;
        item.save(req.body, function(err) {
            if (err) throw err;
            res.send("success");
        })
    });
});

router.post("/usertype/delete/:id", function(req, res, next) {
    var id = req.params.id;
    req.models.usertype.find({ id: id }).remove(function(err) {
        if (err) throw err;
        res.send("success");
    })

});

// 用户类型API管理
router.get("/usertypeapi/manager/:typeid", function(req, res, next) {
    var typeid = req.params.typeid;
    if (typeid)
        req.db.driver.execQuery("select api.*,usertype.usertype ,(select count(*) from usertypeapi where usertypeapi.apiid = api.id and usertypeapi.usertypeid = usertype.id) as auth from api,usertype where usertype.id = ?", [typeid], function(err, items) {
            res.renderp("usertypeapimanager", {
                usertypes: items,
                typeid: typeid
            });
        });
    else next();

});

// router.get("/usertypeapi/add", function(req, res, next) {

// });

// router.post("/usertypeapi/add", function(req, res, next) {

// });

router.post("/usertypeapi/enable/:apiid/:typeid", function(req, res, next) {
    var apiid = req.params.apiid;
    var typeid = req.params.typeid;
    req.models.usertypeapi.create([{ apiid: apiid, usertypeid: typeid }], function(err, data) {
        if (err) throw err;
        res.send("success");
    });
});

router.post("/usertypeapi/disable/:apiid/:typeid", function(req, res, next) {
    var apiid = req.params.apiid;
    var typeid = req.params.typeid;
    req.models.usertypeapi.find({ apiid: apiid, usertypeid: typeid }).remove(function(err) {
        if (err) throw err;
        res.send("success");
    });
});




// 用户类型VIEW管理
router.get("/usertypeview/manager/:typeid", function(req, res, next) {
    var typeid = req.params.typeid;
    if (typeid)
        req.db.driver.execQuery("select view.*,usertype.usertype,(select count(*) from usertypeview where usertypeview.viewid = view.id and usertypeview.usertypeid = usertype.id) as auth from 'view' ,usertype where usertype.id = ?", [typeid],
            function(err, items) {
                res.renderp("usertypeviewmanager", {
                    usertypes: items,
                    typeid: typeid
                });
            });
    else next();


});

// 暂时不用
// router.get("/usertypeview/add", function(req, res, next) {

// });

// router.post("/usertypeview/add", function(req, res, next) {

// });


router.post("/usertypeview/enable/:viewid/:typeid", function(req, res, next) {
    var viewid = req.params.viewid;
    var typeid = req.params.typeid;
    req.models.usertypeview.create([{ viewid: viewid, usertypeid: typeid }], function(err, data) {
        if (err) throw err;
        res.send("success");
    });
});

router.post("/usertypeview/disable/:viewid/:typeid", function(req, res, next) {
    var viewid = req.params.viewid;
    var typeid = req.params.typeid;
    req.models.usertypeview.find({ viewid: viewid, usertypeid: typeid }).remove(function(err) {
        if (err) throw err;
        res.send("success");
    });
});


module.exports = router;
