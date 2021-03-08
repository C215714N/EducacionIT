const mysql = require('mysql')
/* Environment DB connection */
  const dbConn = mysql.createConnection({
      host : 'localhost',
      user : 'root',
      password : '',
      database : 'delilah'
    } )
    dbConn.connect(function(err) {
      if (err) throw err;
      console.log("Acceso concedido");
    } )
module.exports = dbConn