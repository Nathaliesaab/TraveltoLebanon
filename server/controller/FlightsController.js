const delay = ms => new Promise(resolve => setTimeout(resolve, ms));
var moment = require("moment-timezone");

// MYSQL DATABASE CONNECTION
const connection = require('../config/database.config.js');



exports.insertFlight = (req, res) => {

    const { id, user_id, TicketNo } = req.body;

    let saveSql = "";


    saveSQL = `INSERT INTO User_Ticket(user_id,TicketNo) VALUES\
        ("${user_id}", "${TicketNo}")`;

    console.log(saveSql);

    connection.query(saveSQL, (err, result) => {
        if (err) throw err;
        res.status(200).send(result)

    })

}