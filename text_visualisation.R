library(udpipe)
data(brussels_listings,package = 'udpipe')
View(brussels_listings)
#segregation
x<-table(brussels_listings$neighbourhood)
View(x)
#sort
x<-sort(x)
x1<-sort(x,decreasing = TRUE)
View(x)
View(x1)
#import text visualization library
library(textplot)
textplot_bar(x,panel = "location",col.panel ="darkgrey",
             xlab="listings",cextext=0.75,addpct=TRUE,
             cexpect=0.5)
data(brussels_reviews_anno,package = 'udpipe')
View(brussels_reviews_anno)

y<-subset(brussels_reviews_anno,
          xpos%in% "NN"&language %in% "nl"& !is.na(lemma))
View(y)
y1<-document_term_frequencies(y,document = "doc_id",term = "lemma")
View(y1)
#document matrix
dtm<-document_term_matrix(y1)
dtm
#remove low frequency term
dtm<-dtm_remove_lowfreq(dtm,maxterms = 60)
dtm
#correlation
cor<-dtm_cor(dtm)
View(cor)
library(glasso)
#word cooccurrence graph
w<-subset(brussels_reviews_anno,xpos %in%"JJ"& language %in% "fr")
View(w)
#cooccurence term
w<-cooccurrence(w,group="doc_id", term = "lemma")
w
#plot
textplot_cooccurrence(w,top_n = 40,subtitle = "showing only top 25")
#creating data
sentence="hey friends,welcome to the class lets start about the text analytics"
#tokanizatuion
z<-udpipe(sentence,"english")
View(z)
library(ggraph)
textplot_dependencyparser(z)
