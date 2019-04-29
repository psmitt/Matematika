'use strict'

const electron = !/^https?:\/\//.test(location.href)
var editableItem = null

const navMenu = document.getElementById('NavMenu')
const chapterPanel = document.getElementById('ChapterPanel')
const entityPanel = document.getElementById('EntityPanel')

const mainStyle = document.querySelector('main').style
const mainTitle = document.getElementById('MainTitle')
const mainView = document.getElementById('MainView')

function createDetails(title, content, id, type) {
  let details = document.createElement('details')
  let summary = document.createElement('summary')
  let span = document.createElement('span')
  span.textContent = title
  if (id)
    summary.dataset.id = id
  if (type)
    summary.className = type
  summary.append(span)
  details.append(summary)

  let article = document.createElement('article')
  article.innerHTML = content
  details.append(article)

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

  if (electron) {
    document.styleSheets[4].insertRule(`#MainView summary:focus {
      text-shadow: blue 0 0 1px;
    }`)
    mainView.addEventListener('focusin', event => editableItem = event.target)

    let script = document.createElement('script')
    script.src = `editor.js`
    document.body.append(script)

    let editors = document.getElementById('EditorPanel').children
    editors[0].onclick = () => move(editableItem, 'up')
    editors[1].onclick = () => move(editableItem, 'left')
    editors[2].onclick = () => edit(editableItem)
    editors[3].onclick = () => move(editableItem, 'right')
    editors[4].onclick = () => move(editableItem, 'down')

  } else {

    document.getElementById('EditorPanel').remove()
    document.getElementById('AsidePanel').querySelectorAll('table').forEach(table => table.remove())
  }

  buildTree(`SELECT entities_name, CONCAT_WS(' ', characteristics,
                 IF(characteristics = 'Nevezetes', LOWER(entities_name), NULL)),
                    article_id, article_title
               FROM entities JOIN article ON (entities_id = article_entities)
           ORDER BY entities_name, characteristics, article_title`, entityPanel)

  buildTree(`SELECT chapter_title, article_type, article_id, article_title, article_keywords
               FROM chapter JOIN article ON (chapter_id = article_chapter)
           ORDER BY article_type, article_title`, chapterPanel)

}, error => {
  document.body.textContent = error
})