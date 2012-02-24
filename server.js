express = require("express");
request = require("request");
var app = express.createServer();

app.use(express.bodyParser());

app.post('/zips', function(req, res){
  var file = req.body["files"][0];
  request(file, function(err, response, body) {
    res.send(body);
  });
});

app.listen(3333);
