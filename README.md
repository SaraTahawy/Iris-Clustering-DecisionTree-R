
# 🌸 Iris Dataset Analysis & Classification in R

This project demonstrates how to explore, clean, visualize, and model the classic **Iris dataset** using R.

---

## 📦 Requirements

To run this project, you'll need to install the following R packages:

```r
install.packages("rpart")
install.packages("rpart.plot")
install.packages("xlsx")
install.packages("readxl")
```

Then, load the libraries:

```r
library(rpart)
library(rpart.plot)
library(xlsx)
library(readxl)
```

---

## 📥 Loading the Dataset

Make sure your Excel file is located in a valid path. Update this line with your actual path:

```r
Data <- read_excel("C:/Users/dell/Downloads/Iris_dataset.xlsx")
```

---

## 🔍 Data Exploration

We explore the structure, dimensions, and preview rows of the dataset:

```r
print(Data)
dim(Data)
str(Data)
head(Data)
tail(Data)
```

---

## 🧼 Data Cleaning

### ✔️ Removing Duplicates
```r
Data <- Data[!duplicated(Data),]
```

### ✔️ Handling Missing Values
```r
Data <- na.omit(Data)
```

### ✔️ Removing Outliers (Sepal.Length)
```r
outliers <- boxplot(Data$Sepal.Length)$out
Data <- Data[-which(Data$Sepal.Length %in% outliers),]
```

---

## 📊 Data Visualization

- **Barplot**: Sepal Length by Sepal Width  
- **Histogram**: Sepal Length distribution  
- **Pie Chart**: Distribution of species  
- **Boxplot**: Sepal Length  
- **Scatter Plot**: Sepal Length vs. Sepal Width  

Example:
```r
hist(Data$Sepal.Length, main = "Length of Pets")
```

---

## 🤖 Machine Learning

### 1. K-Means Clustering

We apply K-means on the numeric columns:

```r
NewData <- Data[,-c(5)]  # remove Species
result <- kmeans(NewData, centers = 4)
```

### 2. Decision Tree

Train a decision tree classifier on the cleaned data:

```r
tree <- rpart(Species ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width,
              data = Data, minsplit = 3)
rpart.plot(tree)
```

---

## 📌 Notes

- The code assumes the **Iris dataset is in Excel format**.
- If you face any errors with file paths, try using `file.choose()` to browse for the file.
- Make sure to clean your dataset **before training models**, otherwise results might be inaccurate.
