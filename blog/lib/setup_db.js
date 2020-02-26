const orm = require("orm")
const { CONNECTION_URI, DEFAULT_USERNAME, DEFAULT_USERNAME_PASSWORD } = require("./config")
const { models: { define } } = require("./models")
const { readFileSync } = require("fs")

const setUpDB = (cb) => {
  orm.connect(CONNECTION_URI, (err, db) => {
    if (err) { cb(err); return; }
    if (db) {
      const _models = {}
      define(db, _models, () => {  // define models 

        db.sync(err => {  // database model synced

          if (err) { cb(err); return; }

          _models.user.count({}, (err, count) => {

            if (err) { cb(err); return; }

            if (count == 0) { // if database not have any user, add a default admin user

              _models.user.create({ username: DEFAULT_USERNAME, password: DEFAULT_USERNAME_PASSWORD }, err => {

                if (err) { cb(err); return; }
                cb() // finished, callback

              })

            } else {

              cb()

            }

          })


        })

      })

    }
  })
}

module.exports = { setUpDB }