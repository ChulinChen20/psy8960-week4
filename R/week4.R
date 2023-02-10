# Script Settings and Resources
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
library(tidyverse)

# Data Import
import_tbl <- read_delim("../data/week4.dat",delim = "-", col_names = c("casenum", "parnum", "stimver", "datadate", "qs"))
glimpse(import_tbl)
wide_tbl <- import_tbl%>% separate(qs, into = c("q1", "q2","q3","q4","q5"),sep = " - ")
sapply(wide_tbl[,5:9],as.integer)
wide_tbl$datadate <- as.POSIXct(wide_tbl$datadate, format = "%b %d %Y, %H:%M:%S")
wide_tbl <- cbind(wide_tbl[,1:4],sapply(wide_tbl[,5:9], function(x=wide_tbl[,5:9]) sub(pattern = "0", x, replacement= "NA")))
