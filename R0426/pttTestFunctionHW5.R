library(xml2)
library(tmcn)
library(rvest)

pttTestFunctionHW5 <- function(URL, filename)
{
  #URL   = "https://www.ptt.cc/bbs/travel/index.html"
  html  = read_html(URL)
  title = html_nodes(html, "a")
  href  = html_attr(title, "href")
  data = data.frame(title = toUTF8(html_text(title)),
                    href = href)
  data = data[-c(1:10),]
  data = data[-c(30:32),]
  getContent <- function(x) {
    url  = paste0("https://www.ptt.cc", x)
    tag  = html_node(read_html(url), 'div#main-content.bbs-screen.bbs-content')
    text = toUTF8(html_text(tag))
  }
  #getContent(data$href[1])
  allText = sapply(data$href, getContent)
  allText
  #out <- file(filename, "w", encoding="BIG-5") 
  write.table(allText, filename) 
  #close(out) 
}
