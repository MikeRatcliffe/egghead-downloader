# no-underline db dark-blue z-1 bg-white eh-shadow-1
require('dotenv').config()
cheerio = require 'cheerio'
requestPromise = require 'request-promise'
global.request = requestPromise.defaults
  jar: true
download_url = 'https://egghead.io/courses/for/angular'
params_url = '?page='
base_url = 'https://egghead.io/courses/for/angular'

getAllOccurrences = (html, baseUrl) ->
  index = html.indexOf("https://egghead.io/courses/")
  occurrences = []
  while index != -1
    url = html.substr(index, html.substr(index+1).indexOf("\"")+1)
    html = html.substr(index+1)
    index = html.indexOf("https://egghead.io/courses/")
    if url.indexOf(baseUrl) == -1
      occurrences.push url
  return occurrences

get = () ->
  i = 1
  while i==1 || array.length > 0
    html = await request(uri: base_url + params_url + i)
    $ = cheerio.load(html)
    strHtml = $.html()
    array = getAllOccurrences(strHtml, base_url)
    console.log array
    i += 1

run = ->
  get()

run()