1+1 # this is a simple sum
3*4

## Exercise 2 ##

a <- 1:200 # create vector a 
b <- a*123 # create vector b by multiplying vector a by 123
b[44] # extract the 44th element of vector b
b_sub <- b[1:15] # extract the first 15 elements and assign to a new vector b_sub
b_sub <- c(b_sub, 24108, 24231) # add new numbers to vector b_sub

c <- c('actb', 100, 3.4) # make new vector c
object_c <- c[2] # extract second element of vector c
object_c*4 # this will not work as 100 is in quotes meaning it is seen as a character. This is because with vector c we mixed numbers and characters

d_named_vector <- c(fruit = "apple", fruit = "banana", vegetable = "carrot", animal = "dog") # create new vector d with each element having an attribute
attributes(d_named_vector) # display attributes only
names(d_named_vector) # another way of displaying attributes

## Exercise 3 ##

matrix_1 <- matrix(1:9, nrow=3) # create a matrix containing numbers 1-9 with 3 rows and 3 columns
matrix_1 [2, 3] # extract the number 8, which is located in row 2, column 3
matrix_2 <- matrix(1:12, nrow=3, ncol=4, byrow=T) # create a matrix containing numbers 1-12 with 3 rows and 4 columns, which is listed by row
colnames(matrix_2) <- c("first", "second", "third", "fourth") # add column names to matrix 2
row.names(matrix_2) <- c("r1", "r2", "r3") # add row names to matrix 2
matrix_2 # display matrix 2 to check

array_1 <- array(1:24, dim=c(4,2,3)) # create an array containing numbers 1-24, with 4 columns, 2 rows, and 3 matrices
array_1[3,2,2] # extract the number 15, which is on the 3rd row, 2nd column, 2nd matrix
array_1_last_matrix <- array_1[,,3] # create a new array using the last matrix of array_1
list_1 <- list(1:10, "cat", TRUE, 7, F) # create a list with 5 items
list_1[c(3,5)] # extract the 3rd and 5th items from the list using the combine function
list_1[[5]] # extract 5th item

## Extra activity ##

# Create objects 
movie <- c("Whatever Works","ItFollows","Loveand Mercy","TheGoonies","JiroDreams of Sushi","ThereWill be Blood", "Moon", "Spice World", "Serenity", "Finding Vivian Maier")
year <- c("2009", "2015", "2015", "1985", "2012", "2007", "2009", "1988", "2005", "2014")
boxoffice<-c(35,15,15,62,3,10,321,79,39,1.5)
genre <- c("Comedy","Horror","Drama","Adventure","Documentary","Drama","Science,Fiction","Comedy","Science Fiction", "Documentary")

movie[10] # find 10th movie on the list 
genre[1:4] # find the genres of the first 4 movies
movie[movie=="Spice World"] <- "The Naked Gun" # remove Spice World from the list and replace it with The Naked Gun
movie [year < 1990] # Find movies created before 1990
movie [genre=="Comedy"] # Find the names of the Comedy movies
boxoffice [genre=="Comedy"] # Find the Box Office totals of the Comedy movies
movie [boxoffice<50 & genre=="Comedy"] # Find the movies which made less than 50M dollars AND which were comedies

## Exercise 4 ##

data("iris") # load built in data frame iris

coding_gene_region <- read.table(file="/project/obds/shared/resources/2_r/baseR/coding_gene_region.bed", header=FALSE, sep="\t") # load coding_gene_region.bed into R
View(coding_gene_region) # view loaded data frame
dim(coding_gene_region) # check dimensions of data frame
nrow(coding_gene_region) # count number of rows
ncol(coding_gene_region) # count number of columns

colnames(coding_gene_region) <- c("chr","start","stop","name", "score","strand") # add column names to data frame
names(coding_gene_region) # a different way of viewing column names
coding_gene_region[30,3] # extract element at row 30, column 3
coding_gene_region[,2] # extract second column
start <- coding_gene_region$start # create new vector 

coding_gene_region$int_length <- coding_gene_region$stop - coding_gene_region$start # create new column called int_length, which is calculated from stop position minus start position
medium_length <- coding_gene_region[coding_gene_region$int_length >= 100001 & coding_gene_region$int_length <= 200000,] #create a new object called medium_size which contains fragments between 100001 and 200000 in length

write.table(medium_length, file="medium_length_table.txt", quote=FALSE, row.names=FALSE, sep="\t") # create a table containing the medium length fragments (quote=FALSE to remove quote marks, sep="\t" to specify tab delimited format)
