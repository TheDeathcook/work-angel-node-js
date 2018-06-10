
const db = require("../lib/db");
const express = require("express");
const router = express.Router();

router.post("/register", (req, res) => {
    db.register(req.body.username, req.body.password).then(result => {
        if (result.available) {
            res.json({
                success: true
            });
        } else {
            res.sendStatus(200);
        }
    }).catch(err => {
        res.sendStatus(500);
    });
});

router.post("/login", (req, res) => {

});

module.exports = router;