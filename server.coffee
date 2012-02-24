express = require("express")
request = require("request")
app = express.createServer()

app.use(express.bodyParser())

app.post '/zips', (req, res) ->
  url = req.body["files"][0]
  file = request url
  file.pipe res

app.listen(3333)
