require('dotenv').config()
fs = require 'fs'
downloadBulk = require './utils'
signIn = require './sign_in'

run = ->
    await signIn()
    courses = fs.readdirSync "./files/"
    for fileCourse in courses
        await downloadBulk("./files/" + fileCourse)
    console.log "Finished downloading ALL the courses"

run()