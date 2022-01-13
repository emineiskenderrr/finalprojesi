var mysql = require("mysql");

var connection = mysql.createConnection({
	host: 'localhost',
	database: 'veritabani',
	user: 'root',
	password: 'aeden.84'
});

module.exports = connection;