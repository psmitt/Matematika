const editorPanel = document.getElementById('EditorPanel')

function loadChapters() {
  chapterView.innerHTML = ''
  SQL(`SELECT chapter_id, chapter_title, chapter_content, chapter_main FROM chapter
       ORDER BY chapter_main, chapter_number`, result => {
    for (let chapters of result) {
      let details = createDetails(chapters[0], chapters[1], chapters[2])
      if (chapters[3]) {
        document.querySelector(`[data-id="${chapters[3]}"]`).append(details)
      } else {
        chapterView.append(details)
      }
    }
    renderMathInElement(chapterView)
    mainStyle.display = 'block'
  })
}

chapterView.addEventListener('focusin', event => {
  event.target.append(editorPanel)
  editorPanel.style.display = 'table'
  mainTitle.textContent = event.target.firstElementChild.textContent
  mainTitle.onclick = () => displayChapter(event.target.parentNode.dataset.id)
})

function displayChapter(id) {
  chapterView.innerHTML = ''
  SQL(`SELECT chapter_title, chapter_content FROM chapter
       WHERE chapter_id = ${id}`, chapter => {
    let heading = document.createElement('h1')
    heading.innerHTML = chapter[0][0]
    chapterView.append(heading)
    let article = document.createElement('article')
    article.innerHTML = chapter[0][1]
    chapterView.append(article)
    SQL(`SELECT article_id, article_title, article_statement, article_type
                FROM article WHERE article_chapter = ${id}
                ORDER BY article_number`, result => {
      for (let chapters of result) {
        let details = createDetails(chapters[0], chapters[1], chapters[2], chapters[3])
        chapterView.append(details)
      }
      // Display subchapters
      renderMathInElement(chapterView)
      mainStyle.display = 'block'
    })
  })
}

chapterView.addEventListener('focusout', () => editorPanel.style.display = 'none')

function edit(chapter) { // chapter => summary
  asideTitle.textContent = 'FEJEZET SZERKESZTÉSE'
  editChapter(chapter.parentNode.dataset.id)
  asideStyle.display = 'block';
}

function move(chapter, to) { // chapter => summary
  chapter.blur()
  let root = chapter.parentNode
  let main = root.parentNode
  let prev = root.previousElementSibling
  let next = root.nextElementSibling
  switch (to) {
    case 'up':
      if (prev && prev.matches('details')) {
        main.insertBefore(root, prev)
      } else if (main !== chapterView) {
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
        while (!main.nextElementSibling && main !== chapterView)
          main = main.parentNode
        if (main !== chapterView) {
          main.nextElementSibling.open = true
          main.nextElementSibling.insertBefore(root,
            main.nextElementSibling.querySelector('details'))
        }
      }
      break
    case 'left':
      if (main !== chapterView) {
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
  while (details) {
    values.push(`(${details.dataset.id},${root.parentNode.dataset.id ||'NULL'},${index++})`)
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
      values.push(`${details.dataset.id}`)
      details = details.nextElementSibling
    }
    queryChildren =
      `UPDATE chapter SET chapter_main = ${root.dataset.id}
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

chapterView.addEventListener('keyup', event => {
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