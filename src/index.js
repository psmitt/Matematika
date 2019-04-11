'use strict'

const electron = !/^https?:\/\//.test(location.href)

const navMenu = document.getElementById('NavMenu')
const chapterPanel = document.getElementById('ChapterPanel')
const entityPanel = document.getElementById('EntityPanel')

const mainTitle = document.getElementById('MainTitle')
const chapterView = document.getElementById('ChapterView')
const articleView = document.getElementById('ArticleView')

var mainStyle = document.querySelector('main').style

function importModule(filename) {
  const fs = require('fs')
  const path = require('path')

  let link = document.createElement('link')
  link.href = `Electron/${filename}.css`
  link.rel = 'stylesheet';
  document.head.append(link)

  let fragment = new DOMParser().parseFromString(fs.readFileSync(
    path.join('src', 'Electron', `${filename}.html`), 'utf8'), 'text/html')
  document.body.insertBefore(fragment.body.firstElementChild,
    document.body.querySelector('script'))

  let script = document.createElement('script')
  script.src = `Electron/${filename}.js`
  document.body.append(script)
}

function createDetails(title, content, id, type) {
  let details = document.createElement('details')
  let summary = document.createElement('summary')
  let span = document.createElement('span')

  if (id)
    details.dataset.id = id

  if (type)
    span.textContent = `${type}: ${title}`
  else
    span.textContent = title

  summary.append(span)
  details.append(summary)

  if (content) {
    let article = document.createElement('article')
    article.textContent = content
    details.append(article)
  }
  return details
}

function buildTree(query, panel) { // query: root, branch, id, item, keywords?
  SQL(query, result => {
    let root = null
    let branch = null
    let currentNode = null
    let item = null
    for (let row of result) {
      if (root !== row[0]) {
        root = row[0]
        panel.append(currentNode = createDetails(root))
        branch = null
      }
      if (branch !== row[1]) {
        if (branch)
          currentNode = currentNode.parentNode
        branch = row[1]
        currentNode.append(item = createDetails(branch))
        currentNode = item
      }
      item = document.createElement('div')
      item.dataset.id = row[2]
      item.innerHTML = row[3]
      if (row[4])
        item.dataset.keywords = row[4]
      currentNode.append(item)
    }
  })
}

/*
   Returns SELECT result as array of arrays
   Otherwise returns { affectedRows, insertId, errorInfo }
*/
var SQL; // MySQL query funtion

new Promise((sqlReady, sqlFailed) => {
  if (electron) { // database client
    if (typeof require === 'undefined')
      sqlFailed('Indítási hiba!')
    let database = require('electron').remote.getCurrentWindow().knowledgebase
    let mysql = require('mysql')
    mysql.createConnection(database).connect(error => {
      if (error) {
        sqlFailed('Kapcsolódási hiba!')
      } else {
        let mysqlPool = mysql.createPool(database)
        document.title = `Matematika @ ${database.host} : ${database.port}`
        SQL = async function (query, callback) {
          return new Promise((resolve, reject) => {
            mysqlPool.getConnection((error, connection) => {
              if (error) {
                alert(error)
                reject(connection.release())
              } else {
                connection.query({
                  sql: query,
                  nestTables: '.'
                }, (error, result, fields) => {
                  if (error) {
                    console.log(query)
                    alert(error)
                    reject(connection.release())
                  } else {
                    callback(result.constructor.name === 'OkPacket' ? result :
                      result.map(object => Object.values(object)))
                    resolve(connection.release())
                  }
                }) // query
              } // no error
            }) // mysqlPool.getConnection
          }) // Promise
        } // SQL
        sqlReady()
      } // no error
    }) // mysql connect
  } else { // web client
    const postTarget = location.href.replace(/index.html$/, '') + 'MySQL.php'
    SQL = async function (query, callback) {
      return new Promise((resolve, reject) => {
        let httpRequest = new XMLHttpRequest()
        httpRequest.onreadystatechange = function () {
          if (httpRequest.readyState == 4) {
            if (httpRequest.status == 200) {
              let json = JSON.parse(httpRequest.responseText)
              try {
                resolve(callback(json))
              } catch {
                alert(json.message)
              }
            } else
              alert(`${httpRequest.status}: ${httpRequest.responseText}`)
          }
        }
        httpRequest.open('POST', postTarget)
        httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded')
        httpRequest.send('SQL=' + encodeURIComponent(query))
      })
    }
    sqlReady()
  }
}).then(() => {
  if (electron) { // load editor and aside
    importModule('aside')
    importModule('editor')
  }

  buildTree(`SELECT entities_name, characteristics, article_id, article_title
       FROM entities JOIN article ON (entities_id = article_entities)
       ORDER BY entities_name, characteristics, article_title`, entityPanel)

  buildTree(`SELECT chapter_title, article_type, article_id, article_title, article_keywords
      FROM chapter JOIN article ON (chapter_id = article_chapter)
      ORDER BY article_type, article_number`, chapterPanel)

}, error => {
  document.body.textContent = error
})