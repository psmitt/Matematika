const asideIcon = document.getElementById('AsideIcon')
const asideTitle = document.getElementById('AsideTitle')
const asidePanel = document.getElementById('AsidePanel')

var asideStyle = document.querySelector('aside').style

function closeAside() {
  recordID = null
  asideStyle.display = 'none'
}

function edit(item) { // item => summary
  if (item) switch (item.className) {
    case 'Fejezet':
      asideTitle.textContent = 'FEJEZET SZERKESZTÉSE'
      editChapter(item.dataset.id)
      break;
    case 'Bizonyítás':
    case 'Folyomány':
    case 'Megoldás':
      alert(item.className)
      break;
    default: // article
      asideTitle.textContent = 'CIKK SZERKESZTÉSE'
      editArticle(item.dataset.id)
      break;
  }
  asideStyle.display = 'block';
}

function move(item, to) {
  if (item) switch (item.className) {
    case 'Fejezet':
      moveChapter(item, to)
      break;
    case 'Bizonyítás':
    case 'Folyomány':
    case 'Megoldás':
      console.log(to, item.className)
      break;
    default: // cikk
      moveArticle(item, to)
  }
}

mainView.addEventListener('keyup', event => {
  if (event.target.matches('summary') && event.ctrlKey) {
    let root = event.target.parentNode
    switch (event.code) {
      case 'Enter': // close subchapters
        root.open = true
        root.querySelectorAll('details').forEach(details => details.open = false)
        break;
      case 'Space': // open subchapters
        root.open = false
        root.querySelectorAll('details').forEach(details => details.open = true)
        break;
      case 'ArrowUp': // move chapter forward
        move(event.target, 'up')
        break;
      case 'ArrowDown': // move chapter backward
        move(event.target, 'down')
        break;
      case 'ArrowLeft': // promote chapter
        move(event.target, 'left')
        break;
      case 'ArrowRight': // demote chapter
        move(event.target, 'right')
        break;
    }
  }
})

var recordID = null

const fix = text => text.replace(/('|\\)/g, "\\$&")

/* EDIT CHAPTERS */

const chapterTable = document.getElementById('ChapterTable')
const chTitl = document.getElementById('chapter_title')
const chCont = document.getElementById('chapter_content')

function editChapter(id) {
  recordID = id
  document.querySelectorAll('aside table').forEach(table => table.style.display = 'none')
  SQL(`SELECT chapter_title, chapter_content FROM chapter
       WHERE chapter_id = ${id}`, result => {
    chTitl.value = result[0][0]
    chCont.value = result[0][1]
    chapterTable.style.display = 'table'
    asideStyle.display = 'block'
  })
}

function saveChapter() {
  let content = chCont.value ? `'${fix(chCont.value)}'` : 'NULL'
  SQL(`UPDATE chapter
          SET chapter_title = '${fix(chTitl.value)}',
              chapter_content = ${content}
        WHERE chapter_id = ${recordID}`, result => {
    let summary = mainView.querySelector(`[data-id="${recordID}"]`)
    summary.innerHTML = chTitl.value
    summary.nextElementSibling.innerHTML = chCont.value
    renderMathInElement(summary.parentNode)
    summary.focus()
    closeAside()
  })
}

function deleteChapter() {
  console.log(`DELETE FROM chapter WHERE chapter_id = ${recordID}`);
  closeAside()
}

function newChapter() {
  let content = chCont.value ? `'${fix(chCont.value)}'` : 'NULL'
  SQL(`SET @main = (SELECT chapter_main FROM chapter WHERE chapter_id = ${recordID});
       SET @number = (SELECT chapter_number FROM chapter WHERE chapter_id = ${recordID});
       UPDATE chapter SET chapter_number = chapter_number + 1
       WHERE chapter_main = @main
         AND chapter_number >= @number;
       INSERT INTO chapter (chapter_main, chapter_number, chapter_title, chapter_content)
       VALUES (@main, @number - 1, '${fix(chTitl.value)}', ${content})`, result => {
    let details = createDetails(chTitl.value, chCont.value, result[3][2], 'Fejezet')
    details.className = 'Fejezet'
    let next = mainView.querySelector(`[data-id="${recordID}"]`).parentNode
    next.parentNode.insertBefore(details, next)
    renderMathInElement(details)
    details.firstElementChild.focus()
    closeAside()
  })
}

function moveChapter(chapter, to) { // chapter => summary
  chapter.blur()
  let root = chapter.parentNode
  let main = root.parentNode
  let prev = root.previousElementSibling
  let next = root.nextElementSibling
  switch (to) {
    case 'up':
      if (prev && prev.matches('details')) {
        main.insertBefore(root, prev)
      } else if (main !== mainView) {
        let premain = main.previousElementSibling
        if (premain && premain.matches('details')) {
          premain.open = true
          premain.appendChild(root)
        } else {
          main.parentNode.insertBefore(root, main)
        }
      }
      break
    case 'down':
      if (next) {
        main.insertBefore(next, root)
      } else {
        while (!main.nextElementSibling && main !== mainView)
          main = main.parentNode
        if (main !== mainView) {
          main.nextElementSibling.open = true
          main.nextElementSibling.insertBefore(root,
            main.nextElementSibling.querySelector('details'))
        }
      }
      break
    case 'left':
      if (main !== mainView) {
        if (!root.querySelector('details')) { // no subchapters
          while (next) {
            root.append(next)
            next = root.nextElementSibling
          }
        }
        main.parentNode.insertBefore(root, main.nextElementSibling)
        root.open = true
      }
      break
    case 'right':
      if (prev.matches('details')) {
        prev.open = true
        prev.append(root)
        if (root.open) { // promote subchapters
          while (root.querySelector('details')) {
            prev.append(root.querySelector('details'))
          }
        }
        root.open = true
      }
      break
  }
  // Siblings SQL
  let index = 1
  let values = []
  let details = root.parentNode.querySelector('details')
  const getID = details => details.firstElementChild.dataset.id
  while (details) {
    values.push(`(${getID(details)},${getID(root.parentNode) ||'NULL'},${index++})`)
    details = details.nextElementSibling
  }
  let querySiblings =
    `INSERT INTO chapter (chapter_id, chapter_main, chapter_number)
     VALUES ${values.join(',')}
     ON DUPLICATE KEY UPDATE
     chapter_main = VALUES(chapter_main),
     chapter_number = VALUES(chapter_number)`
  // Children SQL
  let queryChildren = null
  if (details = root.querySelector('details')) {
    values = []
    while (details) {
      values.push(`${getID(details)}`)
      details = details.nextElementSibling
    }
    queryChildren =
      `UPDATE chapter SET chapter_main = ${getID(root)}
       WHERE chapter_id IN (${values.join(',')})`
  }
  // Execute the double query
  SQL(querySiblings, () => {
    if (queryChildren)
      SQL(queryChildren, () => chapter.focus())
    else
      chapter.focus()
  })
}

/* EDIT ARTICLES */

const articleTable = document.getElementById('ArticleTable')
const arTitl = document.getElementById('article_title')
const arChap = document.getElementById('article_chapter')
const arChapList = document.getElementById('chapters')
const arType = document.getElementById('article_type')
const arEnts = document.getElementById('article_entities')
const arEntsList = document.getElementById('entities')
const arChrs = document.getElementById('characteristics')
const arKeys = document.getElementById('article_keywords')
const arStat = document.getElementById('article_statement')

/* DATALISTS */

function loadDatalist(query, datalist) {
  SQL(query, result => {
    datalist.innerHTML = ''
    for (let value of result) {
      let option = document.createElement('option')
      option.dataset.value = value[0]
      option.value = value[1]
      datalist.append(option)
    }
  })
}

function loadEntities() {
  loadDatalist(`SELECT entities_id, entities_name FROM entities
                ORDER BY entities_name`, arEntsList)
}
loadEntities()

function validateDatalist(input) {
  let option = document.getElementById(input.list.id)
    .querySelector(`option[value="${input.value.replace(/("|\\)/g, '\\$&')}"]`)
  input.dataset.value = option ? option.dataset.value : input.value = ''
}

AsidePanel.addEventListener('focusin', event => {
  let input = event.target
  if (input.list) {
    input.placeholder = input.value
    input.value = ''
    input.addEventListener('focusout', () => {
      if (!input.value)
        input.value = input.placeholder
      input.placeholder = ''
      validateDatalist(input)
    }, {
      once: true
    })
  }
})

arChap.onchange = event => validateDatalist(arChap)
arEnts.onchange = event => validateDatalist(arEnts)
arChrs.onchange = () => arEnts.required = Boolean(arChrs.value)

function editArticle(id) {
  recordID = id
  document.querySelectorAll('aside table').forEach(table => table.style.display = 'none')
  SQL(`SELECT article_title, chapter_title, article_type, article_entities,
       characteristics, article_keywords, article_statement
       FROM article JOIN chapter ON (chapter_id = article_chapter)
       WHERE article_id = ${id}`, result => {
    arTitl.value = result[0][0]
    arChap.value = result[0][1]
    arType.value = result[0][2]
    if (result[0][3]) {
      arEnts.value = arEntsList.querySelector(`option[data-value="${result[0][3]}"]`).value
      validateDatalist(arEnts)
    }
    arChrs.value = result[0][4]
    arKeys.value = result[0][5]
    arStat.value = result[0][6]
    articleTable.style.display = 'table'
    asideStyle.display = 'block'
  })
}

function saveArticle() {
  let title = arTitl.value ? `'${fix(arTitl.value)}'` : 'NULL'
  let characteristics = arChrs.value ? `'${arChrs.value}'` : 'NULL'
  let keywords = arKeys.value ? `'${fix(arKeys.value)}'` : 'NULL'
  let statement = arStat.value ? `'${fix(arStat.value)}'` : 'NULL'
  SQL(`UPDATE article SET
       article_title = ${title},
       article_type = '${arType.value}',
       article_entities = ${arEnts.dataset.value || 'NULL'},
       characteristics = ${characteristics},
       article_keywords = ${keywords},
       article_statement = ${statement}
       WHERE article_id = ${recordID}`, result => {
    let summary = mainView.querySelector(`[data-id="${recordID}"]`)
    summary.innerHTML = arTitl.value
    summary.className = arType.value
    summary.nextElementSibling.innerHTML = arStat.value
    renderMathInElement(summary.parentNode)
    summary.focus()
    closeAside()
  });
}

function deleteArticle() {
  SQL(`DELETE FROM article WHERE article_id = ${recordID}`, result => {
    if (result.affectedRows)
      mainView.querySelector(`[data-id="${recordID}"]`).parentNode.remove()
    closeAside()
  })
}

function newArticle() {
  let title = arTitl.value ? `'${fix(arTitl.value)}'` : 'NULL'
  let characteristics = arChrs.value ? `'${arChrs.value}'` : 'NULL'
  let keywords = arKeys.value ? `'${fix(arKeys.value)}'` : 'NULL'
  let statement = arStat.value ? `'${fix(arStat.value)}'` : 'NULL'
  SQL(`SET @chapter = (SELECT article_chapter FROM article WHERE article_id = ${recordID});
       SET @number = (SELECT article_number FROM article WHERE article_id = ${recordID});
       UPDATE article SET article_number = article_number + 1
       WHERE article_chapter = @chapter
         AND article_number >= @number;
       INSERT INTO article (article_chapter, article_number, article_title, article_type,
                  article_entities, characteristics, article_keywords, article_statement)
       VALUES (@chapter, @number - 1, ${title}, '${arType.value}', ${arEnts.dataset.value || 'NULL'},
               ${characteristics}, ${keywords}, ${statement})`, result => {
    let details = createDetails(arTitl.value, arStat.value, result[3][2], arType.value)
    let next = mainView.querySelector(`[data-id="${recordID}"]`).parentNode
    next.parentNode.insertBefore(details, next)
    renderMathInElement(details)
    details.firstElementChild.focus()
    closeAside()
    loadChapters()
  })
}

function moveArticle(article, to) { // article => summary
  article.blur()
  let details = article.parentNode
  let chapter = details.parentNode

  function swap(prev, next) { // details
    let ids = `(${prev.firstElementChild.dataset.id},
                ${next.firstElementChild.dataset.id})`
    SQL(`UPDATE article a INNER JOIN article b
         ON (a.article_id IN ${ids} AND b.article_id IN ${ids}
             AND a.article_id != b.article_id)
         SET a.article_number = b.article_number,
             b.article_number = a.article_number`,
      ready => chapter.insertBefore(next, prev))
    article.focus()
  }
  let prev = details.previousElementSibling
  let next = details.nextElementSibling
  if (to == 'up' && prev && prev.matches('details')) {
    swap(prev, details)
  } else if (to == 'down' && next && next.matches('details')) {
    swap(details, next)
  }
}

/* EDIT SECTIONS */

const sectionTable = document.getElementById('SectionTable')
const seType = document.getElementById('section_type')
const seSumm = document.getElementById('section_summary')
const seDets = document.getElementById('section_details')

function editSection(id) {
  recordID = id
  document.querySelectorAll('aside table').forEach(table => table.style.display = 'none')
  SQL(`SELECT section_type, section_summary, section_details FROM section
       WHERE article_id = ${id}`, result => {
    seType.value = result[0][0]
    seSumm.value = result[0][1]
    seDets.value = result[0][2]
    chapterTable.style.display = 'table'
    asideStyle.display = 'block'
  })
}

function saveSection() {
  let summary = seSumm.value ? `'${seSumm.value}'` : 'NULL'
  console.log(`UPDATE section SET
               section_type = '${seType.value}',
               section_summary = '${summary}',
               section_details = '${seDets.value}'
               WHERE section_id = ${recordID}`);

  recordID = null
  asideStyle.display = 'none'
}

function deleteSection() {
  console.log(`DELETE FROM section WHERE section_id = ${recordID}`);
  recordID = null
  asideStyle.display = 'none'
}

function newSection() {

  recordID = null
  asideStyle.display = 'none'
}