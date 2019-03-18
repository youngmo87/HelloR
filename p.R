x = 1:5; y = 1:3
z = outer(x, y, function(x,y) { x + y })   # dim(x) * dim(y)
z

x = seq(-10, 10, length=30); y = x
f = function(x, y) {
  r = sqrt(x^2 + y^2)
  return (10 * sin(r) / r)
}


z = outer(x, y, f)
persp(x, y, z, theta = 45, phi = 30, expand = 0.5, col='lightblue',
      ltheta = 120, shade = 0.75, ticktype='detailed',
      xlab = 'X', ylab = 'Y', zlab = "Sinc(r)")

install.packages('dplyr')
library(dplyr)
library(ggplot2)
head(USArrests)
rownames(USArrests)
library(tibble)
chodata = rownames_to_column(USArrests, var ='state')
chodata$state = tolower(chodata$state)
chodata = data.frame(state = tolower(rownames(USArrests)), USArrests)


install.packages('mapproj')

ggiraphExtra::ggChoropleth() 
install.packages('ggiraphExtra')
install.packages('maps')
library('ggiraphExtra')
usmap = map_data('state')
head(usmap)

ggChoropleth(data=chodata,
             aes(fill=Murder, map_id=state),
             map = usmap,
             title = '..',
             reverse = F,
             interactive = T)

# installing/loading the latest installr package:
install.packages("installr"); library(installr) # install+load installr

updateR() # updating R.

