# no-underline db dark-blue z-1 bg-white eh-shadow-1
require('dotenv').config()
cheerio = require 'cheerio'
requestPromise = require 'request-promise'
global.request = requestPromise.defaults
  jar: true
###download_url = 'https://egghead.io/browse/tools/zeit-now'
params_url = '?page='
base_url = 'https://egghead.io/courses/for/'###

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

courseNameCleanup = (courseName) ->
    idx = courseName.indexOf(")")
    if(idx != -1)
        return courseName.substr(0, idx)
    return courseName

removeDuplicates = (ar) ->
  if ar.length == 0
    return []  
  res = {}
  res[ar[key]] = ar[key] for key in [0..ar.length-1]
  value for key, value of res

getCourses = (topic) ->
  i = 1
  base_url = 'https://egghead.io/courses/for/'
  params_url = '?page='
  array_courses = []
  while i==1 || array.length > 0
    html = await request(uri: base_url + topic + params_url + i)
    $ = cheerio.load(html)
    strHtml = $.html()
    array = getAllOccurrences(strHtml, base_url)
    array = array.map (c) -> courseNameCleanup(c)
    array = array.filter (c) -> c.length>0
    for course in array
      array_courses.push course
    i += 1
  console.log removeDuplicates(array_courses).length

getTopicNames = () ->
    html = await request(uri: 'https://egghead.io/courses/')
    $ = cheerio.load(html)
    jsonInfo = $('body script[data-component-name=App]').html()
    return JSON.parse(jsonInfo).tags.map (course) -> [course.name, course.http_url]

run = ->
  #console.log await getTopicNames()
  getCourses('angular')

run()