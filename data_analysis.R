
# load packages -----------------------------------------------------------


library(tidyverse)
library(viridis)


# load the data -----------------------------------------------------------



nsf<-read_csv("./data_raw/grfp_2019_2025.csv") 


yr_summary<-nsf %>% 
group_by(year) %>%
  tally() 

yr_summary %>% 
ggplot(aes(x=year, y=n)) + 
  geom_bar(stat = "identity")+
  ggtitle("NSF GRFs Awarded per Year")+
  theme_bw()
  

# summary by major field x year -------------------------------------------



field_summary<-nsf %>% 
  group_by(field_1,year) %>%
  tally()
field_summary


field_summary %>% 
  ggplot( aes(x=year, y=n, group=field_1, color=field_1)) +
  geom_line()+
  theme_bw()+
  ggtitle("NSF GRF Awarded per Year in  Major Fields") %>% 


# total by Inst -----------------------------------------------------------


overall_inst_summary<-nsf %>% 
  group_by(bacc_inst) %>%
  tally() %>% 
  arrange(desc(n))



overall_inst_summary %>% 
  arrange(desc(n)) %>% 
  slice_head(n=30) %>% 
  ggplot(aes(x=bacc_inst, y=n)) + 
  geom_bar(stat = "identity")+
  theme(axis.text.x = element_text(angle = 90, vjust =.6 , hjust=1))
  ggtitle("NSF GRFs by Inst (top 30")+
  theme_bw()





# summary by inst x year  -------------------------------------------------


inst_summary<-nsf %>% 
  group_by(bacc_inst,year) %>%
  tally()


