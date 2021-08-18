async function connect() {
    if(global.connection && global.connection.state !== 'disconnected')
        return global.connection;

    const mysql = require("mysql2/promise");
    const connection = await mysql.createConnection('mysql://root:@localhost:3306/db_mc');
    console.log('Create connection with mysql.');
    global.connection = connection;
    return connection;
}

module.exports = connect;