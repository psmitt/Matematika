function viewChapters() {
  editableItem = null
  mainView.innerHTML = ''
  SQL(`SELECT chapter_title, chapter_content, chapter_id, chapter_main FROM chapter
       ORDER BY chapter_main, chapter_number`, result => {
    for (let chapters of result) {
      let details = createDetails(chapters[0], chapters[1], chapters[2], 'Fejezet')
      details.className = 'Fejezet'
      if (chapters[3]) {
        mainView.querySelector(`[data-id="${chapters[3]}"]`).parentNode.append(details)
      } else {
        mainView.append(details)
      }
    }
    renderMathInElement(mainView)
    mainStyle.display = 'block'
  })
}

function viewOutlines(chapter, article, scroll) {
  editableItem = null
  mainView.innerHTML = ''
  SQL(`SELECT chapter_title, chapter_content FROM chapter
        WHERE chapter_id = ${chapter}`, result => {
    let h2 = document.createElement('h2')
    h2.textContent = result[0][0]
    let article = document.createElement('article')
    article.innerHTML = result[0][1]
    mainView.append(h2)
    mainView.append(article)
    SQL(`SELECT article_title, article_statement, article_id, article_type,
                section_summary, section_details, section_id, section_type
           FROM article LEFT JOIN section ON (section_article = article_id)
          WHERE article_chapter = ${chapter}
       ORDER BY article_number, section_number`, result => {
      let currentArticle = null
      let details = null
      for (let article of result) {
        if (currentArticle !== article[2]) {
          let details = createDetails(article[0], article[1], article[2], article[3])
          mainView.append(details)
          currentArticle = article[2]
        }
        if (article[6]) { // currentSection
          details.append(createDetails(article[4], articl[5], article[6], article[7]))
        }
      }
      SQL(`SELECT chapter_title, chapter_content, chapter_id FROM chapter
            WHERE chapter_main = ${chapter}
         ORDER BY chapter_number`, result => {
        for (let chapter of result) {
          let h3 = document.createElement('h3')
          h3.textContent = chapter[0]
          let article = document.createElement('article')
          article.innerHTML = chapter[1]
          mainView.append(h3)
          mainView.append(article)
        }
        renderMathInElement(mainView)
        mainStyle.display = 'block'
      })
    })
  })
}