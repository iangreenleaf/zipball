express = require "express"
request = require "request"
fs = require "fs"
zip = require "node-native-zip"

app = express.createServer()
app.use express.bodyParser()

app.post '/zips', (req, res) ->
  url = req.body["files"][0]
  archive = new zip()
  request url, (err, response, body) ->
    file = new Buffer(body, "utf8")
    archive.add "foo.txt", file
    res.contentType "zip"
    res.attachment("a.zip")
    res.send archive.toBuffer()

app.listen 3333
