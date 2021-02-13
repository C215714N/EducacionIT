const dbCon = require('mysql').createConnection(
    {
        host : 'localhost',
        user : 'root',
        password : '',
        database : 'Delilah'
    }
);

dbCon.connect(
    function(error) {
        if (error) throw error ;
        console.log('Acceso garantizado.')
    }
)

module.exports = dbCon