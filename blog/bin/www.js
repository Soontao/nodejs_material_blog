#!/usr/bin/env node

// 依赖
const app = require('../app')
const http = require('http')
const { setUpDB } = require("../lib/setup_db")

const port = normalizePort(process.env.PORT || '9379');
app.set('port', port);

setUpDB(err => {
    if (err) { console.error(err); return; }
    const server = http.createServer(app);

    server.listen(port);

    server.on('error', onError);
    server.on('listening', () => {
        var addr = server.address();
        var bind = typeof addr === 'string' ? 'pipe ' + addr : 'port ' + addr.port;
        console.info('Listening on ' + bind);
    });
})

function normalizePort(val) {
    var port = parseInt(val, 10);

    if (isNaN(port)) {
        return val;
    }

    if (port >= 0) {
        return port;
    }

    return false;
}


function onError(error) {
    if (error.syscall !== 'listen') {
        throw error;
    }
    const bind = typeof port === 'string' ? 'Pipe ' + port : 'Port ' + port;
    switch (error.code) {
        case 'EACCES':
            console.error(bind + ' requires elevated privileges');
            process.exit(1);
            break;
        case 'EADDRINUSE':
            console.error(bind + ' is already in use');
            process.exit(1);
            break;
        default:
            throw error;
    }
}

