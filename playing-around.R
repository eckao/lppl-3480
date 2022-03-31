setwd("~/Documents/lppl 3480/lppl-3480")
og_text<-scan("original.txt",what="char")
og_text <- tolower(og_text)
og_text
#install.packages("stringr")                       # Install stringr package
library("stringr")
og_text <- str_replace_all(og_text, "[[:punct:]]", "")
og_text
og_text <- str_replace_all(og_text, "`", "")
og_text
og_text_one <- paste(unlist(og_text), collapse = " ")
og_text_one
conn1<-file("og_clean.txt")
writeLines(og_text_one, conn1)
close(conn1)

passed_text <- scan("passed.txt", what = "char")
passed_text <- tolower(passed_text)
passed_text
passed_text <- str_replace_all(passed_text, "[[:punct:]]", "")
passed_text <- str_replace_all(passed_text, "`", "")
passed_text
passed_text_one <- paste(unlist(og_text), collapse = " ")
passed_text_one
conn<-file("passed_clean.txt")
writeLines(passed_text_one, conn)
close(conn)
