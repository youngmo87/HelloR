mpg = as.data.frame(ggplot2::mpg)
str(mpg)
View(mpg)

#try1
try1 = mpg[order(-(mpg$hwy + mpg$cty)), ]
View(try1)

#try2
str(mpg)
mpg[order(mpg$fl),]
View(mpg[mpg$year,])

totalfl = mpg$hwy + mpg$cty
eg2 = aggregate(data=mpg, totalfl~(year+fl), mean)

eg2 = eg2[order(eg2$year),]
eg2

