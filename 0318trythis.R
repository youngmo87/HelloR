#0318trythis1 ####
ggChoropleth(data=chodata,
             aes(fill=c(Murder, Assault, UrbanPop, Rape), map_id=state),
             map = usmap,
             title = '..',
             reverse = F,
             interactive = T)

usmap = map_data('state')
save(usmap, file = 'data/usmap.rda')


#0318trythis2 ####
tooltips2 = paste0(
  sprintf("<p><strong>%s</strong></p>", as.character(chodata$state)),
  '<table>',
  '  <tr>',
  '    <td>인구(만)</td>',
  sprintf('<td>%s</td>', paste(as.character(round(chodata$Rape)), '/',(chodata$UrbanPop * 10))),
  '  </tr>',
  '</table>' )

onclick2 = sprintf("window.open(\"%s\")", paste("http://en.wikipedia.org/wiki/%s",as.character(chodata$state)))
#onclick2 = sprintf("window.open(http://en.wikipedia.org/wiki/%s)", as.character(chodata$state))


tooltips2 = stringi::stri_enc_toutf8(tooltips2)

try2 = ggplot(chodata, aes(map_id = state))

try2 + geom_map_interactive( 
  aes(fill = Rape,
      data_id = state,
      tooltip = tooltips2,
      onclick = onclick2),
  map = usmap)+
  expand_limits(x = usmap$long, y = usmap$lat) +
  scale_fill_gradient2('강간', low='red', high = "blue", mid = "green") -> gg_map2


ggiraph(code = print(gg_map2))



# trythis 3 #####
try3 = as.data.frame(kormaps2014::tbc)
try3 = kormaps2014::changeCode(try3)
try3map = kormaps2014::changeCode(kormap1)

try3$name1= stringi::stri_enc_toutf8(try3$name1)
#rm(try3)
#rm(try3map)
#str(try3)
try3$year = as.numeric(try3$year)
try3$NewPts = as.numeric(try3$NewPts)


try3[5][is.na(try3[5])] = 0
finaltry3 = try3 %>% filter( 2006 <= year) %>% filter(year <= 2015 ) %>% group_by(name1, code) %>% summarise(sumpop = sum(NewPts))

tooltips3 = paste0(
  sprintf("<p><strong>%s</strong></p>", as.character(finaltry3$name1)),
  '<table>',
  '  <tr>',
  '    <td>2006년부터 15년까지의 환자수</td>',
  sprintf('<td>%s명</td>', as.character(finaltry3$sumpop)),
  '  </tr>',
  '</table>' )

ggplot(finaltry3, aes(data = sumpop, map_id = code)) +
  geom_map_interactive( 
    aes(fill = sumpop, 
        data_id = code,
        tooltip = tooltips3),
    map = kormap1) + 
  expand_limits(x = kormap1$long, y = kormap1$lat) +
  scale_fill_gradient2('sumpop', low='darkblue') +
  xlab('경도') + ylab('위도') + 
  labs(title="시도별 결핵환자수 ") -> finaltry4


ggiraph(code = print(finaltry4))
