rep(1, times=3)
rep(LETTERS[1:3], each=3)
rep(LETTERS[1:3], times=3)
rep(c('I', 'am'), times=2, length.out=7)

data.frame(customer=rep(c('김일수','김이수'), each=2),
           menu = rep(c('짜장','짬뽕'), times=2))

5.5:-4.5
seq(5.4:-4.5)
seq(5.4, -4.5)

smdt = data.frame(stuno = 1:5,
                  Korean = sample(60:100, 5),
                  English=sample((5:10)*10,5),
                  Math=sample(50:100,5))

s = 'abc,egf,abc'
nchar(s)
toupper(s)
substr(s,1,5)
strsplit(s,',')
sub('abc', 'ttt', s)
gsub('abc','ttt',s)

s = "first\tsecond\nthird"
cat(s)
print(s)
paste('aaa-bbb', 'ccc-ddd', sep='**')
paste(data[1:3, '반'], collapse='**')

outer(month.abb, 2011:2020, paste, sep='-')
month.abb
outer(LETTERS, 2010:2020, paste0)
grep(pattern='^2.*0$', x=data$학번, value = T) 

as.Date('2019-03-04 09:00')
dt1 = as.POSIXct('2019-03-04 09:00')
dt1
seq(dt1, as.POSIXct('2019-04-01'), by='day')
seq(dt1, as.POSIXct('2019-04-01'), by='2 hour')
seq(dt1, as.POSIXct('2019-04-01 23:59'), by='min')

install.packages('lubridate') 
library(lubridate)
ymd('2019/02/28')

year(dt1)
day(dt1) = 15
days_in_month(1:12)

for (i in 1:3){print(i)}
for (r in 1:nrow(data)){print (data[r, 'scout'])}
str(data)
i=0
while(i<10){print(i); i = i+1}

while(TRUE) {
  if (i%%2 == 0)
    next
  if (i>10)
    break
}

while(TRUE) {
  x = as.integer(readline(prompt = "Input the number: "))
  if (x < 0) break
  
  f = 1
  
  if (x == 0)
    print("The factorial of 0 is 1")
  
  else {
    for (i in 1:x)
      f = f * i
    
    print(paste("The factorial of", x, "is", f))
  } 
}

#x = 10000
fn_for = function(n) {
  x = 0
  for (i in 1:n) {
    x = x + i
    #x <<- x + i
  }
  print(paste("x =", x))
}

fn_for(x <- 70)
x




apply(smdt[,2:4], MARGIN = 1, FUN = mean)
smdt
str(smdt)

apply(smdt[,2:4], MARGIN = 2, FUN = mean)
apply(smdt[,2:4], MARGIN = 1, FUN = quantile)
smdt

lapply(smdt[,2:4], FUN = mean)
unlist(lapply(smdt[,2:4], FUN = mean))

sapply(smdt[, 2:4], FUN = mean, simplify = T)
vapply(smdt[, 2:4], FUN = mean, FUN.VALUE = 100)

library('reshape2')
dfsum = cbind(data.frame(no=1:4, year=2016:2019), matrix(round(runif(16), 3) * 1000, ncol=4, dimnames = list(NULL, paste0('Q', 1: 4))))
dfsum

melt(data=dfsum[,2:6], id.vars = "year")
meltsum = melt(dfsum[,2:6], id.vars = "year", variable.name = 'Sales')
meltsum

dcast(meltsum, Sales~year, valuevar="value")

dataArrary = array(1:24, dim=c(3,4,2))
dim(dataArrary)
dataArray[1,2,2] = 555
dimnames(dataArray)


# trythis0305 ####

# 1번
  #첫번째 방법
practice = data
practice$group=sample(rep(LETTERS[1:3], times=nrow(practice)/3), nrow(practice), replace = F)
table(practice$group)
View(practice)

  #두번째 방법
x = c(rep("A", 160 ),rep("B",160),rep("C",160))
practice$group = sample(x, 480)


# 3번
## 벡터는 데이터 타입의 혼용이 어려움.
smdt_try = smdt
temp = apply(smdt_try[, 2:4], MARGIN = 2, FUN = mean)
smdt_try[nrow(smdt_try)+1, ]= c(0, temp)

smdt_try$total= smdt_try$Korean + smdt_try$English + smdt_try$Math 

smdt_try$avg = apply(smdt_try[,2:4], MARGIN = 1, FUN = mean)

smdt_try[nrow(smdt_try),1] = "계"

str(smdt_try)
View(smdt_try)

# 4번

library('reshape2')
rm(try4)
try4=cbind(data.frame(no=1:4 , year=2016:2019), matrix(round(runif(48), 3) * 1000000, ncol=12, dimnames = list(NULL, month.abb))) 

try4 = melt(try4[,2:14], id.vars = "year", variable.name = 'Month', value.name='Saleamt')
try4
dcast(try4, Year~, value.var="value")



