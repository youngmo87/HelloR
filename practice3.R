# data ####
data
data[1,]
# factor ####
factor(1)
factor(1, levels=1:5)
factor(1, levels=1:5, labels=LETTERS[1:5], ordered=T)
f = factor(2, levels=1:3, labels=c('A', 'B', 'C'))
is.factor(f)
levels(f)
nlevels(f)
as.numeric(f)
c(f)
as.vector(f)
as.character(f)

# vector ####
v1 = c(1,2,3)
v1
v1[1] + v1[3]
length(v1)
v1[1] + v1[2]
summary(v1)
v1[1] = 4
v1[6] = 6
class(v1)
v1

v1[c(1,3,5)] = 0

v1[-3]

v1[-(1:3)]

v1[c(1:2, 4)]
names(v1)
names(v1) = LETTERS[1:length(v1)]

v1['A']
names(v1) = NULL


# matrix ####
m1 = matrix(c('A','F', 'G', 'D', 'C', 'B'), nrow=2, ncol=3, byrow = TRUE)
m1
m2 = matrix(LETTERS, ncol=5)

m2 = matrix(c(LETTERS, 1, 2, 3, 4), ncol=5, byrow = TRUE)
nrow(m2)
colnames(m2) = c('1분단', '2분단', '3분단', '4분단', '5분단')
rownames(m2) = seq(1:nrow(m2))
m2[,c(1,3)]

m3 = matrix(1:30, ncol=30/5, byrow=T)
m3
colnames(m3) = LETTERS[1:ncol(m3)]
rownames(m3) = LETTERS[1:nrow(m3)]
m3[,1:3]


data_m = 1:30
rowcnt=5
m4 = matrix(data_m, ncol=length(data_m)/rowcnt, byrow=TRUE)
m4

# trythis - factor, vector, matrix ####
  #factor
trythis1 = function(level){
  f=factor(level, levels=1:4, labels =c('A', 'B', 'AB', 'O'))
  print(as.vector(f))
}
trythis1(3)

  #vector
v1 = c(1,2,3)
trythis2 = function(vec_val){
  val = length(v1) + 1
  v1[val] = vec_val
  v1
}
trythis2(5)

  #matrix
mat = matrix(1:200, nrow=10, byrow=TRUE)
rownames(mat) = letters[1:nrow(mat)]
colnames(mat) = LETTERS[1:ncol(mat)]
colnames(mat[,c(10,20)])
a=colnames(mat)[10]
b=colnames(mat)[20]
colnames(mat)[10] = paste(a, 10, sep='')
colnames(mat)[20] = paste(b, 20, sep='')
mat

v2 = c(1:20)
trythis3 = function(v2){
  rbind(mat, v2)
  #rownames(mat) = letters[nrow(mat)]
}

trythis3(v2)

# list ####
lst1 = list(a=1:3, b=4:6)
lst1$a
lst1['a']
str(lst1)
lst2 = list(a=1:3, b=c(4, '5', 6))
str(lst2)
names(lst2)
lst3 = list(1:3, LETTERS[1:3], c(2.5, 4.5, 3.7))
lst3
lst3[1]
unlist(lst3)           # 1차원 vector로변환
unlist(lst1)


# data.frame ####

df1 = data.frame(column1=11:15, column2=LETTERS[1:5])
class(df1)
str(df1)

df2 = data[1:10, 1:6]
df3 = data[1:10, c(7,8)]
eg=cbind(df2, df3)
eg
df100 = data[101:110, 1:6]
rbind(df2, df100)

data[c(1:4, 7, 6, 8, 5 )]

# built in something #########
data()
dr = data()$result
str(dr)
head(dr)
class(dr)
dr[,'Item']

data("AirPassengers")
class(AirPassengers)
AirPassengers

data('trees')
trees

library('data.table')

# read.delim ####
sepdata = read.delim('data/sep.txt', sep='#')
sepdata
class(sepdata)
str(sepdata)
summary(sepdata)
View(sepdata)
sepdata$name= as.character(sepdata$name)
class(sepdata$name)

# read.table - tsv ####
tsvdata = read.table("data/tcv.tsv", sep='\t')
tsvdata = read.table("data/tcv.tsv", sep='\t', header = TRUE)
tsvdata = read.table("data/tcv.tsv", sep='\t', header = TRUE, stringsAsFactors = F)
str(tsvdata)
View(tsvdata)

#read.fwf - fwf ####
fwfdata = read.fwf('data/fwf.txt', header=F, width=c(8,6,5,3,4))
fwfdata
str(fwfdata)
dim(fwfdata)
head(fwfdata)
View(fwfdata)

# read_excel - readxl ####
#install.packages('readxl')
#library('readxl')
mtx = read_excel('data/meltop100.xlsx')
mtx = read_excel('data/meltop100.xlsx', sheet = 1)
mtx = read_excel('data/meltop100.xlsx', sheet = 1, col_names = F)
mtx
str(mtx)
dim(mtx)
View(mtx)

# RData ####
mtx = read_excel('data/meltop100.xlsx', sheet = 1, col_names = F)
save(mtx, file = 'data/meltop100.rda')
rm(mtx)
load('data/meltop100.rda')
mtx

# trythis-190228 #####
mtx = read_excel('data/meltop100.xlsx', sheet = 1)
mtx
dim(mtx)
data1 = mtx[1:100,]
save(data1, file = 'data/meltop100.rda')
data1

#install.packages('psych')


# trythis - 1902281 ####
#trythis1
idata1=data[data$반 == '난',]
idata2=idata1[idata1$성별 =='남', ]
idata3=idata2[idata2$국어 > 90 & idata2$수학 > 90, ]
idata3[-order(idata3$국어), ]
idata3
colnames(idata3)[9]

#trythis2
total = data$국어 + data$영어 + data$수학 + data$과학 + data$예체
new_t=cbind(data, total/5)
colnames(new_t)[9]='평균'
data=new_t
idata=new_t[new_t$국어 > 80, ]
colnames(idata)
dim(idata)
aggregate(data=idata, 국어~반, mean)
aggregate(data=idata, cbind(국어,영어,수학,과학,예체)~반, mean)
# ifelse ####

data$pass = ifelse(data$평균 >= 60, TRUE, FALSE)
head(data)
data[data$pass, ]

abc = data$scout = ifelse(data$평균 >= 60, 
                    ifelse(data$성별 == '남', 'BoyScout', 'GirlScout'),
                    '')

# Try this 190228-3 ####
#1
data
qplot(data$pass)
qplot(data$scout)
eg1 = data[data$scout == 'BoyScout'|data$scout == 'GirlScout',]
qplot(eg1$scout)

#2
data
data$grade = ifelse(data$평균 >= 90, 'A', '' )
data$grade = ifelse(data$평균 >= 80, 'B','')
data$grade = ifelse(data$평균 >= 70, 'C', '')
data$grade = ifelse(data$평균 >= 60, 'D', 'Fail')

data = data[,-c(12,13,14)]
colnames(data)[13]
data
# ggplot2::mpg ####
library(ggplot2)
mpg = as.data.frame(ggplot2::mpg)
str(mpg)
View(mpg)

#try1
try1 = mpg[order(-(mpg$hwy + mpg$cty)), ]
View(try1)

#try2
str(mpg)
mpg[order(mpg$fl),]
View(mpg[order(mpg$year),])
abcd = mpg[mpg$f1,]

aggregate(data=mpg, (mpg$hwy + mpg$cty))~fl, mean)


> aggregate(data=data, cbind(국어,영어,수학)~반, mean)

midwest = as.data.frame(ggplot2::midwest)
summary(midwest)
colnames(midwest)
head(midwest)
