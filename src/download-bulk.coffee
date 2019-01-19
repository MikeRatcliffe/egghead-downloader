require('dotenv').config()
fs = require 'fs'
program = require 'commander'
requestPromise = require 'request-promise'
global.request = requestPromise.defaults
  jar: true

signIn = require './sign_in'
downloadSeries = require './download'
program.parse process.argv

if program.args.length == 0
  return console.error("Pass a file containing the URL of the courses")

run = ->
    await signIn()
    console.log program.args[0]
    urls = (fs.readFileSync program.args[0], 'utf8').split("\n")
    for url in urls
      await downloadSeries url
    console.log "All courses in file #{program.args[0]} downloaded 🎉"

run()
