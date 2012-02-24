express = require("express")
request = require("request")
app = express.createServer()

app.use(express.bodyParser())

app.post '/zips', (req, res) ->
  file = req.body["files"][0]
  request file, (err, response, body) ->
    res.send(body)

app.listen(3333)
