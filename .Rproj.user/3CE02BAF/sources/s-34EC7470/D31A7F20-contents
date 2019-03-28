# Text Mining ####

getSources()
getReaders()

folder = system.file("texts", "txt", package='tm')
txtSource = DirSource(folder)
class(txtSource); str(txtSource)
doc = VCorpus(txtSource, readerControl = list(language='lat'))
class(doc); summary(doc)

meta(doc)
meta(doc, type = 'local')

inspect(doc)
inspect(doc[1])

writeCorpus(doc, path="data", filenames = names(doc))

str(doc)

getTransformations()
doc = tm_map(doc, stripWhitespace)

data("crude")
class(crude)
meta(crude, type ='local')
inspect(crude[1])
View(crude)

crude = tm_map(crude, stripWhitespace)
crude = tm_map(crude, content_transformer(tolower))
crude = tm_map(crude, removePunctuation)
crude = tm_map(crude, removeWords, stopwords("english"))
crude = tm_map(crude, stripWhitespace)      # 한번 더! (최종 정리) 
crude = tm_map(crude, stemDocument, language="english")
crude[[1]][1]


tdm = TermDocumentMatrix(crude)
rownames(tdm)
head(as.matrix(tdm))
View(as.matrix(tdm))

eg = as.matrix(tdm)

tdm['year',]


findFreqTerms(tdm, 20)
findFreqTerms(tdm, 20, 30)
findAssocs(tdm, "last", 0.5)
findAssocs(tdm, "oil", .7)  

rowSums(as.matrix(tdm))
wFreq = sort(rowSums(as.matrix(tdm)), decreasing = T)
wFreq
names(wFreq)
wFreq > 10
wFreq = subset(wFreq, wFreq > 10)
wFreq

brewer.pal.info
darks = brewer.pal(8, 'Dark2')

display.brewer.all()

set.seed(100);
wordcloud(words = names(wFreq), freq=wFreq, min.freq=1, random.order = T, colors = darks, scale = c(3,1))

