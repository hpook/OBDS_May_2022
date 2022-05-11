## Exercise 1 ## saving objects

a <- 10
b <- "cat"
c <- 1:20 # create 3 new objects

save.image(file = "11_05_2022_Morning_Example_1.RData") # save image to workspace

saveRDS(object = a, file = "object_a.rds") # save object a only (useful for large objects)
rm(a) # remove object a now that it has been saved
ls() # display all objects to check that a has been removed

rm(list = ls()) # clear workspace completely

getwd() # check current working directory
setwd(dir = "/project/obds/hpook/projects/") # change working directory
setwd(dir = "/project/obds/hpook/projects/R_Objects_Basics_2/") # change working directory back to what it was previously
getwd() # check current working directory

object_a <- readRDS("/project/obds/hpook/projects/R_Objects_Basics_2/object_a.rds") # load object a into the environment

## Exercise 2 ## Creating a markdown file

# Created a markdown file called My_First_R_Markdown.Rmd

## Exercise 3 ## Dealing with functions

day2matrix <- readRDS(file = "/project/obds/shared/resources/2_r/my_day2matrix.rds") # load matrix for activity
rowsum <- rowSums(day2matrix) # calculate row totals and assign to vector
rowmean <- rowMeans(day2matrix) # calculate row means and assign to vector 
day2matrix <- cbind(day2matrix, rowsum = rowsum, rowmean = rowmean) # add new vectors rowsums and rowmeans to matrix
day2matrix <- rbind(day2matrix, c(colSums(day2matrix)), c(colMeans(day2matrix))) # calculate column totals and column means, and add to matrix in same step
day2matrix[21:22, 11:12] <- NA # change overlapping rowsums/rowmeans and colsums/colmeans values to NA 

data("ToothGrowth") # load built in dataset ToothGrowth
summary(ToothGrowth) # get summary stats for dataset 
head(ToothGrowth) # see first few lines of dataset
colnames(ToothGrowth) # check column names
mean(ToothGrowth$len) # calculate the mean of the 'len' column
min(ToothGrowth$len) # calculate minimum length
max(ToothGrowth$len) # calculate maximum length
# note: cannot calculate rowsums and rowmeans as one column has characters in it 
sum(ToothGrowth[,1]) # calculate the total length measured
anyNA(ToothGrowth) # check if any NA values in dataset
is.na(ToothGrowth) # determine if each value is NA or not


## Exercise 3 ## Sorting

data("airquality") # load airquality dataset
summary(airquality) # look up more info
colnames(airquality) # check column name and number
rownames(airquality) # check row name and number

airquality_sorted <- airquality[order(airquality$Ozone),] # sort dataframe by Ozone in ascending order
airquality_sorted_2 <- airquality[order(airquality$Month, airquality$Temp, decreasing=TRUE),] # sort dataframe by the Month and then the Temp column in descending order and save to a new variable
airquality_sorted_3 <- airquality[order(airquality$Month),] # sort by month only
write.table(airquality_sorted_2, file = "airquality_sorted_2.txt", quote=FALSE, sep="\t") # save sorted data to tab delimited file on server

## Exercise 4 ## Merging

buildings <-data.frame(location=c(1, 2, 3), name=c("b1", "b2", "b3"))
data <-data.frame(survey=c(1,1,1,2,2,2), location=c(1,2,3,2,3,1),efficiency=c(51,64,70,71,80,58)) # create 2 dataframes

building_stats <- merge(buildings, data, by="location") # create new dataframe by merging building and data dataframes

## Exercise 5 ## Aggregating
aggregate(airquality, by=list(airquality$Month), FUN=mean, na.rm=TRUE) # aggregate airquality data by month and return means on each numeric value, remove NA values
airquality_aggregated <- aggregate(airquality, by=list(airquality$Month), FUN=mean, na.rm=TRUE) # assign aggregated data to new variable
solar.R_by_month <- aggregate(airquality$Solar.R, by=list(Month=airquality$Month), FUN = mean, na.rm=TRUE) # aggregate Solar.R column by month, return means for Solar.R, make header Month
solar.R_by_month_sd <- aggregate(airquality$Solar.R, by=list(Month=airquality$Month), FUN = sd, na.rm=TRUE) # apply standard deviation function instead of mean

## Extra activity ## Descriptive statistics

data <-data.frame( 
  name = c("Astrid", "Lea", "Sarina", "Remon", "Lea", "Babice", "Jonas", "Wendy", "Niveditha", "Gioia"), 
  sex = c("female", "male", "male", "male", "female", "male", "female", "female", "male", "female"), 
  age = c(30, 25, 25, 29, 31, 30, 33, 35, 25, 34), superhero = c("Batman", "Superman", "Batman", "Spiderman", "Batman", "Antman", "Batman", "Superman", "Maggott", "Superman" ), 
  tattoos = c(11, 15, 12, 12, 17, 12, 9, 13, 9, 9)) # load dataframe

head(data) # check dataframe                 
dim(data)

median(data$age) # calculate median age of pirates
mean(data$age[data$sex=="female"]) # calculate mean age of female pirates
mean(data$age[data$sex=="male"]) # calculate mean age of male pirates

max(data$tattoos[data$sex=="male"]) # find the max number of tattoos on a male pirate

data$age<32 & data$sex=="female" # find pirates who are female and under 32
data$age<32 & data$sex=="male" # find pirates who are male and under 32
sum(data$age<32 & data$sex=="female") # find number of pirates who are female and under 32
sum(data$age<32 & data$sex=="male") # find number of pirates who are male and under 32
Number_Under32_Female <- sum(data$age<32 & data$sex=="female") # assign number of female pirates under 32 to new variable
Number_Under32_Male <- sum(data$age<32 & data$sex=="male")# assign number of male pirates under 32 to new variable 
(Number_Under32_Female/(Number_Under32_Male+Number_Under32_Female))*100 # calculate percentage of female pirates under 32

sum(data$age<32 & data$sex=="female")/sum(data$age<32) # a faster way of calculating percentage of female pirates under age 32


## Exercise 6 ## using the apply function 

vector_10 <- c(1:10) # create a vector of length 10
square<-function(x){
  y=x^2 
  return(y)
  } # write a function which will square a value
square(vector_10) # check function works by applying to vector_10

my_list<-list(7, 3, TRUE, 11) # create a list of 4 items with numbers and logical arguments
lapply(my_list, sum) # apply sum function to list (will return TRUE as a value of 1)
sapply(my_list, sum) # apply same function using sapply to generate a simpler list

repeat_3 <- function(x){
  output<-c(x,x,x)
  return(output)
} # write a function to repeat the list 3 times 

my_list_rep_3 <- sapply(my_list, each=3, rep) # repeat each element in the list 3 times and assign to a new list

## Exercise 7 ## Loops 

for(i in 1:7){
  print(i^3)
} # cube each number in object i 

colnames(iris) # check the column names of the inbuilt iris dataset
for(i in colnames(iris)) {
  print(paste0(i, "(", nchar(i), ")"))
} # A for loop that iterates over the column names of the inbuilt iris dataset and prints each together with the number of characters in the column name in parenthesis

colours_vector<-c("red", "orange", "purple", "yellow", "pink", "blue") # create vector

for(colour in colours_vector){
  if(nchar(colour) == 4){
    print(colour)
  }
} # Print colours in colours_vector that have 4 characters

ifelse(nchar(colours_vector) == 4, print(colours_vector), NA) # use ifelse statement to print colours with 4 characters

## Exercise 8 ## Writing a function 

hypotenuse_calculation <- function(x=1, y=1){
  sqrt((x^2)+(y^2)) # create a function to calculate the hypotenuse of the triangle when given 2 of the sides
}
hypotenuse_calculation(3,4) # test the function by running some numbers 
hypotenuse_calculation(7,9)

hypotenuse_calculation() # as default was set to 1, inputting no values will produce output of 1.41
