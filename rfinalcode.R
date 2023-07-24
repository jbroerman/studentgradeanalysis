## R Final Project Mediation 

library(readr)
library(ggplot2)

# Load in file from desktop: https://kaggle.com/uciml/student-alcohol-consumption
student_por <- read_csv("C:\\Users\\lawle\\OneDrive - University of South Florida\\Desktop\\R class\\student-por.csv")

# Convert to dataframe
student_por <- as.data.frame(student_por)
summary(student_por)
str(student_por)

#### Make Ordered Factors for data summary stats

# Medu
table(student_por$Medu)
print(is.ordered(student_por$Medu))
student_por$Medu <- as.factor(student_por$Medu)
student_por$Medu <- factor(student_por$Medu, ordered = TRUE, levels = c(0,1,2,3,4))
print(is.ordered(student_por$Medu))    

# Fedu
student_por$Fedu <- as.factor(student_por$Fedu)
student_por$Fedu <- factor(student_por$Fedu, ordered = TRUE, levels = c(0,1,2,3,4))
print(is.ordered(student_por$Fedu))  
table(student_por$Medu)

# Travel Time
student_por$traveltime <- as.factor(student_por$traveltime)
student_por$traveltime <- factor(student_por$traveltime, ordered = TRUE, levels = c(1,2,3,4))
print(is.ordered(student_por$traveltime))  
table(student_por$traveltime)

# Study Time
student_por$studytime <- as.factor(student_por$studytime)
student_por$studytime <- factor(student_por$studytime, ordered = TRUE, levels = c(1,2,3,4))
print(is.ordered(student_por$studytime))  
table(student_por$studytime)

# Famrel
student_por$famrel <- as.factor(student_por$famrel)
student_por$famrel <- factor(student_por$famrel, ordered = TRUE, levels = c(1,2,3,4,5))
print(is.ordered(student_por$famrel))  
table(student_por$famrel)

# FreeTime
student_por$freetime <- as.factor(student_por$freetime)
student_por$freetime <- factor(student_por$freetime, ordered = TRUE, levels = c(1,2,3,4,5))
print(is.ordered(student_por$freetime))  
table(student_por$freetime)

# Goout
student_por$goout <- as.factor(student_por$goout)
student_por$goout <- factor(student_por$goout, ordered = TRUE, levels = c(1,2,3,4,5))
print(is.ordered(student_por$goout))  
table(student_por$goout)

# Walc
student_por$Walc <- as.factor(student_por$Walc)
student_por$Walc <- factor(student_por$Walc, ordered = TRUE, levels = c(1,2,3,4,5))
print(is.ordered(student_por$Walc))  
table(student_por$Walc)

# Dalc
student_por$Dalc <- as.factor(student_por$Dalc)
student_por$Dalc <- factor(student_por$Dalc, ordered = TRUE, levels = c(1,2,3,4,5))
print(is.ordered(student_por$Dalc))  
table(student_por$Dalc)

# Health
student_por$health <- as.factor(student_por$health)
student_por$health <- factor(student_por$health, ordered = TRUE, levels = c(1,2,3,4,5))
print(is.ordered(student_por$health))  
table(student_por$health)

# change character yes's and no's to numeric 1's and 2's
table(student_por$schoolsup)
student_por$schoolsup[student_por$schoolsup == "yes"] <- 1      # Replace "Yes" by 1
student_por$schoolsup[student_por$schoolsup == "no"] <- 0       # Replace "No" by 1
student_por$schoolsup <- as.numeric(student_por$schoolsup)
table(student_por$schoolsup)

table(student_por$famsup)
student_por$famsup[student_por$famsup == "yes"] <- 1      # Replace "Yes" by 1
student_por$famsup[student_por$famsup == "no"] <- 0       # Replace "No" by 1
student_por$famsup <- as.numeric(student_por$famsup)
table(student_por$famsup)

table(student_por$paid)
student_por$paid[student_por$paid == "yes"] <- 1      # Replace "Yes" by 1
student_por$paid[student_por$paid == "no"] <- 0       # Replace "No" by 1
student_por$paid <- as.numeric(student_por$paid)
table(student_por$paid)

table(student_por$activities)
student_por$activities[student_por$activities == "yes"] <- 1      # Replace "Yes" by 1
student_por$activities[student_por$activities == "no"] <- 0       # Replace "No" by 1
student_por$activities <- as.numeric(student_por$activities)
table(student_por$activities)

table(student_por$nursery)
student_por$nursery[student_por$nursery == "yes"] <- 1      # Replace "Yes" by 1
student_por$nursery[student_por$nursery == "no"] <- 0       # Replace "No" by 1
student_por$nursery <- as.numeric(student_por$nursery)
table(student_por$nursery)

table(student_por$higher)
student_por$higher[student_por$higher == "yes"] <- 1      # Replace "Yes" by 1
student_por$higher[student_por$higher == "no"] <- 0       # Replace "No" by 1
student_por$higher <- as.numeric(student_por$higher)
table(student_por$higher)

table(student_por$internet)
student_por$internet[student_por$internet == "yes"] <- 1      # Replace "Yes" by 1
student_por$internet[student_por$internet == "no"] <- 0       # Replace "No" by 1
student_por$internet <- as.numeric(student_por$internet)
table(student_por$internet)

table(student_por$romantic)
student_por$romantic[student_por$romantic == "yes"] <- 1      # Replace "Yes" by 1
student_por$romantic[student_por$romantic == "no"] <- 0       # Replace "No" by 1
student_por$romantic <- as.numeric(student_por$romantic)
table(student_por$romantic)

table(student_por$sex)
student_por$sex[student_por$sex == "M"] <- 1    
student_por$sex[student_por$sex == "F"] <- 0      
student_por$sex <- as.numeric(student_por$sex)
table(student_por$sex)


summary(student_por)


###########



fin_por = subset(student_por, select = c(sex, age, paid, famrel, goout, studytime, health, schoolsup, higher, G3, Dalc, Walc))
names(fin_por) 
str(fin_por)


### Build step both Model (Forward Backwards selection) (direct effect on)
set.seed(123)
fin_train_rows <- sample(1:nrow(fin_por), size = round(nrow(fin_por)*0.7)) # 70/30 split

fin_train <- fin_por[fin_train_rows , ] # split data into train and test data sets
fin_test <- fin_por[-fin_train_rows , ]


########### 
# Model 1 : Path A
## Remove G1 and G2 before fitting the model because they are also grade point averages (dependent variable)
## Also remove absences and failures because they are part of overall school performance and are highly correlated to grades
new_por = subset(student_por, select = -c(G1, G2, failures, absences, reason, school, famsize, Mjob, Fjob, guardian, Dalc, Walc))
names(new_por) 
str(new_por)


### Build step both Model (Forward Backwards selection) (direct effect on)
set.seed(123)
train_rows <- sample(1:nrow(new_por), size = round(nrow(new_por)*0.7)) # 70/30 split

x_train <- new_por[train_rows , ] # split data into train and test data sets
x_test <- new_por[-train_rows , ]

fit_lm2 <- lm(G3 ~ . , data = x_train[complete.cases(x_train),])
## Forward-Backward Selection
library(MASS)
step_both <- stepAIC(fit_lm2, direction = "both")
summary(step_both)
AIC(step_both)


###
Dalc_por = subset(student_por, select = -c(G1, G2, G3, failures, absences, reason, school, famsize, Mjob, Fjob, guardian, Walc))
names(Dalc_por) 
str(Dalc_por)
set.seed(123)
train_rows2 <- sample(1:nrow(Dalc_por), size = round(nrow(Dalc_por)*0.7)) # 70/30 split

x_train2 <- Dalc_por[train_rows2 , ] # split data into train and test data sets
x_test2 <- Dalc_por[-train_rows2 , ]


fit_lm3 <- lm(Dalc ~ . , data = x_train2[complete.cases(x_train2),])
step_both2 <- stepAIC(fit_lm3, direction = "both")
summary(step_both2)
AIC(step_both2)


###
Walc_por = subset(student_por, select = -c(G1, G2, G3, failures, absences, reason, school, famsize, Mjob, Fjob, guardian, Dalc))
names(Walc_por) 
str(Walc_por)
set.seed(123)
train_rows3 <- sample(1:nrow(Walc_por), size = round(nrow(Walc_por)*0.7)) # 70/30 split

x_train3 <- Walc_por[train_rows3 , ] # split data into train and test data sets
x_test3 <- Walc_por[-train_rows3 , ]


fit_lm4 <- lm(Walc ~ . , data = x_train3[complete.cases(x_train3),])
step_both3 <- stepAIC(fit_lm4, direction = "both")
summary(step_both3)
AIC(step_both3)

##


############
model2 <- ' # direct effect
             G3 ~ c1*sex+c2*age+c3*paid+c4*famrel+c5*goout+c6*studytime+c7*health+c8*schoolsup+c9*higher
           # mediator #1
             Dalc ~ a1*sex+a2*age+a3*paid+a4*famrel+a5*goout+a6*studytime+a7*health+a8*schoolsup+a9*higher
             G3 ~ b1*Dalc
           # mediator #2
             Walc ~ d1*sex+d2*age+d3*paid+d4*famrel+d5*goout+d6*studytime+d7*health+d8*schoolsup+d9*higher
             G3~ b2*Walc
           # indirect effect #1 (a4*b1) 
	           ab41 := a4*b1
	         # indirect effect #2
	           db42 := d4*b2
           # total effect
             total := c4 + a4 *b1 + d4*b2
             '
fit101 <- sem(model2, data = fin_por[fin_train_rows,], meanstructure = TRUE)

summary(fit101)
##

### Predict and graph actual grades vs predicted grades
### Predict and graph actual grades vs predicted grades
summ <- summary(fit101)

# direct effect
G3preddir = summ$PE$est[78]+
  summ$PE$est[which(summ$PE$label=="c1")]*fin_por[-fin_train_rows,'sex']+
  summ$PE$est[which(summ$PE$label=="c2")]*fin_por[-fin_train_rows,'age']+
  summ$PE$est[which(summ$PE$label=="c3")]*fin_por[-fin_train_rows,'paid']+
  summ$PE$est[which(summ$PE$label=="c4")]*fin_por[-fin_train_rows,'famrel']+
  summ$PE$est[which(summ$PE$label=="c5")]*fin_por[-fin_train_rows,'goout']+
  summ$PE$est[which(summ$PE$label=="c6")]*fin_por[-fin_train_rows,'studytime']+
  summ$PE$est[which(summ$PE$label=="c7")]*fin_por[-fin_train_rows,'health']+
  summ$PE$est[which(summ$PE$label=="c8")]*fin_por[-fin_train_rows,'schoolsup']+
  summ$PE$est[which(summ$PE$label=="c9")]*fin_por[-fin_train_rows,'higher']
# mediator #1
Dalc = summ$PE$est[79]+
  summ$PE$est[which(summ$PE$label=="a1")]*fin_por[-fin_train_rows,'sex']+
  summ$PE$est[which(summ$PE$label=="a2")]*fin_por[-fin_train_rows,'age']+
  summ$PE$est[which(summ$PE$label=="a3")]*fin_por[-fin_train_rows,'paid']+
  summ$PE$est[which(summ$PE$label=="a4")]*fin_por[-fin_train_rows,'famrel']+
  summ$PE$est[which(summ$PE$label=="a5")]*fin_por[-fin_train_rows,'goout']+
  summ$PE$est[which(summ$PE$label=="a6")]*fin_por[-fin_train_rows,'studytime']+
  summ$PE$est[which(summ$PE$label=="a7")]*fin_por[-fin_train_rows,'health']+
  summ$PE$est[which(summ$PE$label=="a8")]*fin_por[-fin_train_rows,'schoolsup']+
  summ$PE$est[which(summ$PE$label=="a9")]*fin_por[-fin_train_rows,'higher']
G3med1 = summ$PE$est[which(summ$PE$label=="b1")]*Dalc
# mediator #2
Walc = summ$PE$est[80]+
  summ$PE$est[which(summ$PE$label=="d1")]*fin_por[-fin_train_rows,'sex']+
  summ$PE$est[which(summ$PE$label=="d2")]*fin_por[-fin_train_rows,'age']+
  summ$PE$est[which(summ$PE$label=="d3")]*fin_por[-fin_train_rows,'paid']+
  summ$PE$est[which(summ$PE$label=="d4")]*fin_por[-fin_train_rows,'famrel']+
  summ$PE$est[which(summ$PE$label=="d5")]*fin_por[-fin_train_rows,'goout']+
  summ$PE$est[which(summ$PE$label=="d6")]*fin_por[-fin_train_rows,'studytime']+
  summ$PE$est[which(summ$PE$label=="d7")]*fin_por[-fin_train_rows,'health']+
  summ$PE$est[which(summ$PE$label=="d8")]*fin_por[-fin_train_rows,'schoolsup']+
  summ$PE$est[which(summ$PE$label=="d9")]*fin_por[-fin_train_rows,'higher']
G3med2 = summ$PE$est[which(summ$PE$label=="b2")]*Walc
predictions <- G3preddir + G3med1 + G3med2
plot(y = fin_test$G3, x = predictions, ylab = "Actual Grade", xlab = "Predicted Grade")
lines(fin_test$G3, fin_test$G3, type = "l", col = "red")





