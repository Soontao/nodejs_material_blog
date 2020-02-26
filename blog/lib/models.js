const models = {
  define: function (db, models, next) {
    models.user = db.define("user", {
      id: {
        type: 'serial',
        key: true
      },
      username: String,
      passwd: String,
      usertype: Number,
      nickname: String,
      comment: String,
      lastlogindate: Number,
      lastloginip: String
    });
    models.articles = db.define("articles", {
      id: {
        type: 'serial',
        key: true
      },
      title: String,
      content: String,
      userid: {
        type: 'integer'
      },
      create_date: Number,
      modify_date: Number
    });

    models.setting = db.define("setting", {
      id: {
        type: 'serial',
        key: true
      },
      key: String,
      value: String

    });
    models.comment = db.define("comment", {
      id: {
        type: 'serial',
        key: 'true'
      },
      articleid: Number,
      userid: Number,
      comment: String,
      createdate: Number
    });
    models.usertype = db.define("usertype", {
      id: {
        type: 'serial',
        key: 'true'
      },
      usertype: String,
      descripe: String,
    });
    models.usertypeapi = db.define("usertypeapi", {
      id: {
        type: 'serial',
        key: 'true'
      },
      usertypeid: Number,
      apiid: Number,
    });
    models.usertypeview = db.define("usertypeview", {
      id: {
        type: 'serial',
        key: 'true'
      },
      usertypeid: Number,
      viewid: Number,
    });
    models.api = db.define("api", {
      id: {
        type: 'serial',
        key: 'true'
      },
      authname: String,
      url: String,
      describe: String,
    });
    models.view = db.define("view", {
      id: {
        type: 'serial',
        key: 'true'
      },
      viewname: String,
      url: String,
      descripe: String,
    });
    next();
  }
}

module.exports = { models }