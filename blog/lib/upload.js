var mount_uploadify = require('uploadify');
var fs = require('fs');
var multer = require('multer');


module.exports = function upload(app) {
    // Express app
    // 上传配置
    mount_uploadify(app, {
        path: '/images/upload',
        fileKey: 'upfile',
        multer: { dest: 'public/images' },
        callback: function(req) {
            req.files.forEach(function(file) {
                var suffix = file.originalname.split('.').pop()
                var npath = file.path + "." + suffix
                var nname = file.filename + "." + suffix
                file.filename = nname
                fs.rename(file.path, npath, (err) => {
                    if (err) throw err;
                });
                file.path = npath;
                file.url = "/images/" + nname;
                file.state = "SUCCESS";
                file.name = nname;
                file.type = suffix;
            });
            return req.files[0]
        }
    });

}
