#IMPORTING LIBRARY

library(robotstxt)
library(rvest)

#SCRAPING WEBSITE

url <- "https://towardsdatascience.com/processing-xml-in-python-elementtree-c8992941efd2"

#ALLOWABILITY

path <- paths_allowed(url)

#HTML FROM THE WEBSITE
web <- read_html(url)
View(web)

#SEGREGATING TEXT DATA

textdata <- web  %>% html_node(".qr+ .bj , .pd , #fa50 , #92c2") %>% html_text()
View(textdata)

#SEGRATING HEADING TEXT

textheading <- web  %>% html_node("#1d0d") %>% html_text()
View(textheading)


#CREATE DATA FRAME

text <- data.frame(textdata)
titles <- data.frame(textheading)
View(text)
View(titles)

#SAVING AS DOCUMENT FILE

write.dcf(text,"process_xml.doc")
write.dcf(titles,"process_xmlHEADING.doc")
