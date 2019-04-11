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
    let details = document.querySelector(`[data-id="${recordID}"]`)
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
    let details = createDetails(result[3][2], chTitl.value, chCont.value)
    let next = document.querySelector(`[data-id="${recordID}"]`)
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