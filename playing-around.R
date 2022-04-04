setwd("~/Documents/lppl 3480/lppl-3480")
#read in and clean the original bill text
og_text<-scan("original.txt",what="char")
og_text <- tolower(og_text)
og_text
#install.packages("stringr")                       # Install stringr package
library("stringr")
og_text <- str_replace_all(og_text, "[[:punct:]]", "")
og_text <- str_replace_all(og_text, "`", "")
#blob it back together and separate each word onto new line for comparison purposes
og_text_one <- paste(unlist(og_text), collapse = "\n")
og_text_one
#write to text file
conn1<-file("og_clean.txt")
writeLines(og_text_one, conn1)
close(conn1)

#now do the same for the passed version of the bill 
#read in and clean the text
passed_text <- scan("passed.txt", what = "char")
passed_text <- tolower(passed_text)
passed_text
passed_text <- str_replace_all(passed_text, "[[:punct:]]", "")
passed_text <- str_replace_all(passed_text, "`", "")
passed_text
#blob it back together and separate each word onto new line for comparison purposes
passed_text_one <- paste(unlist(passed_text), collapse = "\n")
#write to text file
conn<-file("passed_clean.txt")
writeLines(passed_text_one, conn)
close(conn)

#install.packages("diffr")
library(diffr)
#output difference between original bill and passed bill
diffr("og_clean.txt", "passed_clean.txt")

#install.packages("stopwords")
#install.packages("tm")
library("tm")
og_clean_stop <- removeWords(og_text, words = stopwords(kind = "en"))
passed_clean_stop <- removeWords(passed_text, words = stopwords(kind = "en"))
og_clean_stop

og_clean_stop <- og_clean_stop[og_clean_stop != ""]
og_clean_stop <- paste(unlist(og_clean_stop), collapse = "\n")

passed_clean_stop <- passed_clean_stop[passed_clean_stop != ""]
passed_clean_stop <- paste(unlist(passed_clean_stop), collapse = "\n")

conn2<-file("passed_clean_nostop.txt")
writeLines(passed_clean_stop, conn2)
close(conn2)

conn3<-file("og_clean_nostop.txt")
writeLines(og_clean_stop, conn3)
close(conn3)

diffr("og_clean_nostop.txt", "passed_clean_nostop.txt")
