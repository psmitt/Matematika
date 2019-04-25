function move(item, to) {
  switch (item.className) {
    case 'Fejezet':
      moveChapter(item, to)
      break;
    default:
      console.log(to, item.className)
      break;
  }
}

function edit(item) { // item => summary
  switch (item.className) {
    case 'Fejezet':
      asideTitle.textContent = 'FEJEZET SZERKESZTÉSE'
      editChapter(item.dataset.id)
      break;
    default:
      alert(item.className)
      break;
  }
  asideStyle.display = 'block';
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

/* ASIDE */

var asideStyle = document.querySelector('aside').style

const asideIcon = document.getElementById('AsideIcon')
const asideTitle = document.getElementById('AsideTitle')
const asidePanel = document.getElementById('AsidePanel')

const chapterTable = document.getElementById('ChapterTable')
const articleTable = document.getElementById('ArticleTable')
const sectionTable = document.getElementById('SectionTable')

const chTitl = document.getElementById('chapter_title')
const chCont = document.getElementById('chapter_content')

const arTitl = document.getElementById('article_title')
const arChap = document.getElementById('article_chapter')
const arType = document.getElementById('article_type')
const arEnts = document.getElementById('article_entities')
const arChrs = document.getElementById('characteristics')
const arKeys = document.getElementById('article_keywords')
const arStat = document.getElementById('article_statement')

const seType = document.getElementById('section_type')
const seSumm = document.getElementById('section_summary')
const seDets = document.getElementById('section_details')

var recordID = null

const fix = text => text.replace(/('|\\)/g, "\\$&")

/* EDIT CHAPTERS */

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
    let details = document.querySelector(`[data-id="${recordID}"]`).parentNode
    details.querySelector('summary').innerHTML = chTitl.value
    details.querySelector('article').innerHTML = chCont.value
    renderMathInElement(details)
    recordID = null
    asideStyle.display = 'none'
  })
}

function deleteChapter() {
  console.log(`DELETE FROM chapter WHERE chapter_id = ${recordID}`);

  recordID = null
  asideStyle.display = 'none'
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
    let next = document.querySelector(`[data-id="${recordID}"]`).parentNode
    next.parentNode.insertBefore(details, next)
    renderMathInElement(details)
    recordID = null
    asideStyle.display = 'none'
  })
}

/* EDIT ARTICLES */

function validateDatalist(input) {
  let option = document.getElementById(input.list.id)
    .querySelector(`option[value="${input.value.replace(/("|\\)/g, '\\$&')}"]`)
  input.dataset.value = option ? option.dataset.value : input.value = ''
}

arChap.onchange = event => validateDatalist(arChap)
arEnts.onchange = event => validateDatalist(arEnts)

function editArticle(id) {
  recordID = id
  document.querySelectorAll('aside table').forEach(table => table.style.display = 'none')
  SQL(`SELECT article_title, article_chapter, article_type, article_entities
       characteristics, article_keywords, article_statement FROM article
       WHERE article_id = ${id}`, result => {
    arTitl.value = result[0][0]
    arChap.value = result[0][1]
    arType.value = result[0][2]
    arEnts.value = result[0][3]
    arChrs.value = result[0][4]
    arKeys.value = result[0][5]
    arStat.value = result[0][6]
    chapterTable.style.display = 'table'
    asideStyle.display = 'block'
  })
}

function saveArticle() {
  let title = arTitl.value ? `'${arTitl.value}'` : 'NULL'
  let entities = arEnts.value ? `'${arEnts.value}'` : 'NULL'
  let characteristics = arChrs.value ? `'${arChrs.value}'` : 'NULL'
  let keywords = arKeys.value ? `'${arKeys.value}'` : 'NULL'
  let statement = arStat.value ? `'${arStat.value}'` : 'NULL'
  console.log(`UPDATE article SET
               article_title = '${title}',
               article_chapter = ${arChap.value || 'NULL'},
               article_type = '${arType.value}',
               article_entities = ${arEnts.value || 'NULL'},
               characteristics = '${characteristics}',
               article_keywords = '${keywords}',
               article_statement = '${statement}'
               WHERE article_id = ${recordID}`);

  recordID = null
  asideStyle.display = 'none'
}

function deleteArticle() {
  console.log(`DELETE FROM article WHERE article_id = ${recordID}`);

  recordID = null
  asideStyle.display = 'none'
}

function newArticle() {

  recordID = null
  asideStyle.display = 'none'
}

arChrs.onchange = () => arEnts.required = Boolean(arChrs.value)

/* EDIT SECTIONS */

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