library(robotstxt)
library(rvest)

url<-"https://www.espncricinfo.com/story/anantha-narayanan-jayasuriya-stunner-in-singapore-and-all-the-other-outliers-in-odi-history-1348299"
path=paths_allowed(url)

web=read_html(url)
View(web)

content<-web%>%html_nodes(".ci-html-content div")%>%html_text()
View(content)
#lower case
lowc=tolower(content)
View(lowc)
lowc
#upper case
highc=toupper(content)
View(highc)
lowc
#character replacement
chartr(old="a",new="A",lowc)
#splitting string
spl=strsplit(highc,split=" ")
View(spl)
spl
#extract as list
spl[[2]]
#extract as word
spl2=unlist(strsplit(highc,split=" "))
View(spl2)
spl2
#accessing single element
spl2
spl2[999]
spl2[2345]
library(stringr)
#length of string
str_length(content)
#str_length(spl)
str_length(spl2)
#detect string
str_detect(spl2,"Z")
str_detect(spl2,"AT")
spl2[875]
#detect string indexs
str_which(spl2,"Z")
#counting mathches in string
str_count(spl2,"E")
spl2[2244]
#flattening string
a=str_flatten(spl2," ")
View(a)
a
#comverting to title format
str_to_title(lowc[33])
#convert to sentence
str_to_sentence(lowc[1])
lowc[1]
