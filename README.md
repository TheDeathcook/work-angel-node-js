# work-angel-node-red
The Node-RED powered web-service for Work Angel.

#Die DB Pakete unter Raspbian sucken alle, weshalb dieser Webservice nicht auf dem Raspi laeuft...
Unter Windows laeuft aber alles super

#Installation Instructions

1.Install DB (tested on MariaDB 10.3, earlier versions don't work because authentication is retarded)

2.Run SQL-Scripts

3.Install Node.js

4.Clone repository

5.npm i in repository

6.node index.js to start the server

7.address:port/red to open node-red

8.Copy contents of wa_json_flow.json

9.node-red menu top right -> import -> clipboard -> paste

10.deploy
