mpg
install.packages('dplyr')
library('dplyr')
install.packages('ggplot2')
library('ggplot2')

# thythis1 #####
mpg = rename(mpg, manu=manufacturer)

d2 = mpg %>% filter(year==2008) %>% group_by(displ, year) %>% 
  summarise(m1 = mean(cty), m2 = mean(hwy))

d3 = mpg %>% filter(year==1999) %>% group_by(displ, year) %>% 
  summarise(m1 = mean(cty), m2 = mean(hwy))

trythis1 = ggplot()+
  geom_line(data=d2, aes(x=displ, y=m1, color = '2008cty'), size=2) +
  geom_line(data=d2, aes(x=displ, y=m2, color = '2008hwy'), size=2) +
  geom_line(data=d3, aes(x=displ, y=m1, color = '1999cty'))+
  geom_line(data=d3, aes(x=displ, y=m2, color = '1999hwy'))+
  
scale_colour_manual("", breaks = c("2008cty", "2008hwy", "1999cty", "1999hwy"), values = c("black", "green", "blue", "orange"))+

xlab("배기량") +
xlim(1, 8) +
scale_y_continuous("연비", limits = c(5, 45)) +
labs(title = '연도별 통합 연비', subtitle = '굵은 선은 2008년') 
trythis1

save(trythis1, file='data/trythis1_eg.rda')


#trythis2 #/###
options(encoding='utf-8')
data = read.csv('data/성적.csv')

dt2 = data %>% filter(국어>= 80)%>%select(반, 성별) 
 
trythis3 = ggplot(dt2, aes(반)) +
geom_bar(aes(fill=성별),
         width = 0.5) +
xlab("학급")+
ylab("학생수")+
labs(title = "국어 우수 학생", subtitle =  "(80점 이상)")
save(data, file='data/data_trythis3.rda')


# trythis3 #####
dt3 = data %>% filter(국어>= 95)%>%select(반, 성별, 국어) 
trythis3 = ggplot(dt3, aes(국어))+
  geom_density(aes(fill=factor(반)), alpha = 0.5)+
  labs(title = "반별 국어 우수학생", subtitle = "(국어성적 A+)", caption="Source:ggplot2::mpg", x ="성적",y="밀도", fill="학급")

save(data, file='data/data_trythis3.rda')

# trythis4 ####
midwest = as.data.frame(ggplot2::midwest)

View(midwest)

dt4 = midwest %>% select(county, state, poptotal, popasian) 

dt41 = midwest %>% select(county, state, poptotal) 
dt42 = midwest %>% select(county, state, popasian) 


dt4 = midwest %>% group_by(state) %>% 
  summarise(m1 = sum(poptotal), m2 = sum(popasian))
dt4=melt(dt4[,1:4], id.vars="state", variable.name = "index")

dcast(dt4, county~state, value.var="value")



dt4
str(dt4)

ggplot(dt4, aes(x=state, y=value))+
  geom_(stat='identity', aes(fill=index), width = 0.5) 
  xlab("학급")+
  ylab("학생수")+
  labs(title = "국어 우수 학생", subtitle =  "(80점 이상)")


ggplot(mpg, aes(manufacturer)) +
  geom_bar(aes(fill=class),
           width = 0.5) +
  theme(axis.text.x = element_text(angle=45,       # 글씨의 기울기
                                   vjust=0.6)) +   # 글씨의 하단 맞춤(띄우기)
  scale_fill_discrete(name = "class") +      # legend
  labs(title = 'Title', subtitle = 'Sub Title')

library('reshape2')
dfsum = cbind( data.frame(no=1:4, year=2016:2019), 
               matrix(round(runif(16), 3) * 1000, ncol=4, dimnames = list(NULL, paste0('Q', 1:4))))

dfsum
melt(data=dfsum[,2:6], id.vars = "year")
meltsum = melt(dfsum[,2:6], id.vars = "year", variable.name = 'Sales')
meltsum
