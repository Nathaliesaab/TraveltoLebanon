
const delay = ms => new Promise(resolve => setTimeout(resolve, ms));
var moment = require("moment-timezone");

// MYSQL DATABASE CONNECTION
const connection = require('../config/database.config.js');


exports.getAll = async (req, res) => {
    let tableName = "Users";
    let sql = `SELECT * FROM ${tableName}`;
    connection.query(sql, (error, result) => {
        if (error) throw error;
        res.status(200).send(result);
    })

}


exports.deleteUser = (req, res) => {
    const { id } = req.body
    let sql = `delete from users WHERE id=${id}`;
    console.log(sql);
    connection.query(sql, (err, result) => {
        if (err) throw err;
        res.status(200).send(result)

    })
}


exports.updateUser = (req, res) => {

    const { id, Name, Email, Password, Location } = req.body;

    let updateSql = `UPDATE Users set Name = "${Name}", Password = "${Password}",\
    Location = "${Location}", Email ="${Email}"\
    WHERE id = ${id}`;

    console.log(updateSql);

    connection.query(updateSql, (err, result) => {
        if (err) throw err;
        res.status(200).send(result)

    })

}


exports.insertUser = (req, res) => {

    const { Name, Email, Password, Location } = req.body;

    let saveSql = `INSERT INTO Users (Name, Password,Location,Email) VALUES\
        ("${Name}", "${Password}", "${Location}", "${Email}" )`;

    console.log(saveSql);

    connection.query(saveSql, (err, result) => {
        if (err) throw err;
        res.status(200).send(result)

    })

}
