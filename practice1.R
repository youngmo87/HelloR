t = c(5,7,8,20,11, 19)
order(t)
t[order(t)]

smdt_try[order(smdt_try$avg, -smdt_try$Korean)]

t[sort(t)]
sort(t)

# missing value #####
t = c ( 1:5, NA, 7, NA, 9 10)
m1=m2=m3 = matrix(c(1:3, NA, 9:3, NA, 1:3), nrow=3)

# dplyr #####
install.packages('dplyr')
library('dplyr')

options(encoding='utf-8')
data = read.csv('data/성적.csv')
mpg = as.data.frame(ggplot2::mpg)
rename(data, Korean=국어)

data=dplyr::rename(data, math=수학)


data$group=sample(rep(LETTERS[1:3], times=nrow(data)/3), nrow(data), replace = F)



data
data %>% filter(group == 'C')
data %>% filter(group == 'C' & 수학 > 90)
data %>% filter(group %in% c('A', 'C'))
