fs = require 'fs'
program = require 'commander'
requestPromise = require 'request-promise'
global.request = requestPromise.defaults
  jar: true

downloadSeries = require './download'

downloadBulk = (fileCourses) ->
    new Promise (resolve, reject) ->
        console.log fileCourses
        urls = (fs.readFileSync fileCourses, 'utf8').split("\n")
        for url in urls
            await downloadSeries url
        resolve console.log "All courses in file #{fileCourses} downloaded 🎉"

module.exports = downloadBulk