# This is the list of libraries and packages we need
install.packages("rpart")
install.packages("rpart.plot")
library(rpart)
library(rpart.plot)
library("xlsx")
library(readxl)

# Read the Iris data set file
Data <- read_excel("C:/Users/dell/Downloads/Iris_dataset.xlsx")

# Exploring the data
print(Data)
dim(Data)
str(Data)
head(Data)
tail(Data)

# Cleaning the data

# Check for duplicated data
duplicated(Data)

# Print duplicated data
Data[duplicated(Data),]
# Remove duplicated data
Data <- Data[!duplicated(Data),]

# Print the new dataset
print(Data)

# Check for missing values in the dataset
is.na(Data)

# Get the sum of NA values in the dataset
sum(is.na(Data))

# Remove rows with NA using omit()
Data <- na.omit(Data)

# Description of the data
str(Data)

# Check outliers using box plot diagram
boxplot(Data$Sepal.Length, main = "Distribution", xlab = "Sepal Length")

# Display outlier values
outliers <- boxplot(Data$Sepal.Length)$out
print(outliers)

# Display outlier records
Data[which(data$Sepal.Length %in% outliers),]

# Remove outliers
Data <- Data[-which(data$Sepal.Length %in% outliers),]
print(Data)

# Describe the new data using str() function
str(Data)

# Data Visualization

par(mfrow = c(3, 2))




# Barplot plot of new data
barplot(Data$Sepal.Length,
        name=Data$Sepal.Width,
        ylab   = "Sepal Length",
        xlab  = "Sepal Width",
        col = "blue",
        horiz = FALSE)



# Histogram
hist(Data$Sepal.Length,
     col = "red",
     border = "blue",
     main = "Length of Pets",
     ylab = "Sepal.Length",
     xlab   = "Sepal.Width")


# Pie chart
x <- table(Data$Species)
percentage <- paste0(round(100 * x / sum(x)), "%")
pie(x,
    labels = percentage,
    main = "Compare Species by Type",
    col = c("red", "black", "blue"))
legend("bottomright", legend = c("setosa", "versicolor", "virginica"),
       fill = c("red", "black", "blue"))

# Boxplot
boxplot(x = Data$Sepal.Length,
        main = "Distribution of Sepal Length",
        xlab = "Length")

# Scatter plot
plot(x = Data$Sepal.Length,
     y = Data$Sepal.Width,
     main = "Sepal Length vs. Sepal Width",
     xlab = "Sepal Length",
     ylab = "Sepal Width",
     col = "black")
#kmeans
#drop column number 5 to make K-means
NewData<-Data[,-c(5)]
NewData
#show Data after K-mean clustering
Data<-kmeans(NewData,centers = 4)
Data

#decission tree
tree<-rpart(Species~Sepal.Length+Sepal.Width+Petal.Length+Petal.Width,data = Data,minsplit=3)
tree
rpart.plot(tree)
