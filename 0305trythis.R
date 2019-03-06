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

