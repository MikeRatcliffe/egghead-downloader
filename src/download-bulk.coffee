require('dotenv').config()
fs = require 'fs'
program = require 'commander'
requestPromise = require 'request-promise'
global.request = requestPromise.defaults
  jar: true

signIn = require './sign_in'
downloadBulk = require './utils'
downloadSeries = require './download'
program.parse process.argv

if program.args.length == 0
  return console.error("Pass a file containing the URL of the courses")

run = (fileCourses) ->
  await signIn()
  downloadBulk(fileCourses)

run(program.args[0])