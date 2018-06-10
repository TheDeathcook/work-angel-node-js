"use strict";

const mysql = require("mysql");
const auth = require("./auth");
const connection = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "******",
    database: "work_angel_db"
});

const checkUserQuery = "select * from user u where u.username = ?"
/*
connection.connect((err) => {
    if (err) {
        console.error("error connecting to Database: " + err.stack);
        return;
    }
    console.log("Successful connection: " + connection.threadId);
});
*/

const placeholder = () => {};

const register = (username, password) => {
    return new Promise((resolve, reject) => {
        var inserts = [username];
        var sql = mysql.format(checkUserQuery, inserts);
        connection.query(sql, (err, result, fields) => {
            if (err) {
                reject(err);
            };
            console.log("Result: " + result + "\n" + "Fields:" + fields);
        });
        const hash = auth.getHash(password, auth.genRandomString());
        resolve({
            available: true
        });
    });
};

module.exports = {
    register,
    placeholder
}