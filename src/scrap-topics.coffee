require('dotenv').config()
cheerio = require 'cheerio'
requestPromise = require 'request-promise'
global.request = requestPromise.defaults
  jar: true

getTopicNames = () ->
    html = await request(uri: 'https://egghead.io/courses/')
    $ = cheerio.load(html)
    jsonInfo = $('body script[data-component-name=App]').html()
    return JSON.parse(jsonInfo).tags.map (course) -> [course.name, course.http_url]

run = ->
  console.log await getTopicNames()

run()