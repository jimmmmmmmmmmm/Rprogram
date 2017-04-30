rm(list = ls(all=TRUE))
library(dplyr)
rawdata = read.csv(
  'airpollutiontest.csv',
  encoding = 'UTF-8')
#空氣品質監測日污染指標

#各地測站懸浮微粒平均濃度
df <- rawdata %>% group_by(SiteName)
result1 = summarise(df, mean(PM10SubIndex))
#4/14~28ˋ整體平均
mean1=mean(rawdata$PM10SubIndex,na.rm = T)
#每日懸浮微粒平均濃度
df <- rawdata %>% group_by(MonitorDate)
result11 = summarise(df, mean(PM10SubIndex))
#台灣標準：24小時平均值不得超過125 μg／m3
dfTWSd <- rawdata %>% group_by(SiteName)
result2 = dfTWSd %>% filter(PM10SubIndex>125)
#歐盟標準：24小時平均值不得超過50 μg／m3
dfEUSd <- rawdata %>% group_by(SiteName)
result3 = dfEUSd %>% filter(PM10SubIndex>50)
EUPM10=result3  %>% group_by(SiteName)
result4=summarise(EUPM10)
#高於整體平均的地區
dfTAVG <- result1 %>% group_by(SiteName)
result5 = dfTAVG %>% filter(result1$mean(PM10SubIndex)>mean1)
AAVG=result5  %>% group_by(SiteName)
result6=summarise(AAVG)
#低於整體平均的地區
dfTAVG1 <- result1 %>% group_by(SiteName)
result7 = dfTAVG1 %>% filter(mean(PM10SubIndex)<mean1)
BAVG=result7  %>% group_by(SiteName)
result8=summarise(BAVG)
#係指粒徑在10微米以下之粒子，又稱浮游塵。主要來源包括道路揚塵、
#車輛排放廢氣、露天燃燒、營建施工及農地耕作等，或由原生性空氣污染物轉化成之二次污染物，
#由於粒徑小於10微米以下，能深入人體肺部深處，如該粒子附著其他污染物，則將加深對呼吸系統之危害。