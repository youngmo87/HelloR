library(ggplot2)
library(psych)
midwest = as.data.frame(ggplot2::midwest)
View(midwest)

# 3번 ####
tpop = aggregate(data=midwest, poptotal~state, mean)
apop = aggregate(data=midwest, popasian~state, mean)
apop

# 4번 ####
colnames(midwest)[colnames(midwest) == 'poptotal'] = c('total')
colnames(midwest)[colnames(midwest) == 'popasian'] = c('asian')


# 5번 ####
sumasian = sum(midwest$asian)
asianpct = midwest$asian/sumasian
new_c=cbind(midwest, asianpct)
View(new_c)
hist(new_c$asianpct)

# 6번 ####
describe(new_c$asian)
eg6 = aggregate(data=new_c, asian~state, sum)
str(eg6)
describe(eg6)
boxplot(new_c$asian)

# 7번 ####
meanpct = mean(new_c$asianpct)
new_c$asianrate = ifelse(new_c$asianpct > meanpct, 'lg', 'sm')
View(new_c)

# 8번 ####
qplot(new_c$asianrate)
