"use strict";

const http = require("http");
const express = require("express");
const pub = require("./public")
const router = pub;
const bodyparser = require("body-parser");

const RED = require("node-red");
const flow = require("../wa_json_flow")


const app = express();

app.use(bodyparser.json());
app.use(router);
var server = http.createServer(app);

var settings = {
    httpAdminRoot:"/red",
    httpNodeRoot: "/api",
    userDir:"/home/nol/.nodered/",
    functionGlobalContext: { }
};

RED.init(server,settings);
app.use(settings.httpAdminRoot,RED.httpAdmin);
app.use(settings.httpNodeRoot,RED.httpNode);

server.listen(8000);

RED.start();

for (var node in flow) {
    //RED.nodes.createNode(node);
}
