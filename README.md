# Student Grade Analysis
Using data about high school level students’ home life, social life, and school life, we examine how different factors affect student’s grades..

## Abstract
This paper examines the effects of a student’s family relationships on grades and alcohol consumption. Using data about high school level students’ home life, social life, and school life, we examine how different factors affect student’s grades.  Through data cleaning and data analysis techniques, we were able to conduct a mediation analysis on these relationships and identify variables that were significant in the mediation model. 

## Data
Although we had to convert most of the variables to numeric to accommodate the mediation analysis package, we also needed to change the variable types before this in order to generate meaningful summary statistics. We converted all the variables with equal levels to ordered factors and generated the summary statistics as shown below. (Note: for the mediation model, every variable used was reverted back to numeric).
![image](https://github.com/jbroerman/studentgradeanalysis/assets/122945798/3586992e-bb21-4639-adc7-bfba3c18db57)
 
Looking at the results, we can see that most of the students have parents that are together (569) rather than apart (80). Also, most students generally had positive family relations, with only 51 total students scoring below a 3 for famrel. Our dependent variable had a mean of 11.91. The graph below shows the distribution of G3. 
![image](https://github.com/jbroerman/studentgradeanalysis/assets/122945798/c227a78a-fdb7-4ca5-9f73-41b7393e2892)

A majority of students fall within the 8-15 grade zone, representative of our 11.92 mean calculation. The data is slightly skewed with some outlier observations (students who received 0’s), but overall the distribution is fairly normal. 

## Descriptive Analysis
![image](https://github.com/jbroerman/studentgradeanalysis/assets/122945798/7a5545ef-1ca7-4ac8-91f2-bbf9396e329f)
This graph visualizes the relationship between Dalc and G3. This relationship is discussed later in the mediation model, but here we are able to visually show it. As grades go up, Dalc scores of 1 grow more and more common. This indicates that weekday alcohol consumption may have a negative effect on grades.

![image](https://github.com/jbroerman/studentgradeanalysis/assets/122945798/28ac19c2-9c93-4127-aa58-8bba41cc2241)
This Graph shows the relationship between Walc and G3. Although it appears there is less of a direct correlation than there was between Dalc and G3, there is still a constant drop off in the higher levels of Walc consumption as grades rise. 

## Models & Methods
After cleaning the data, and removing non relevant variables, we had 23 remaining variables: 20 being used as predictors, 2 being used as mediators (Dalc and Walc), and 1 being used as our dependent variable (G3). In order to build our mediation model, we first had to identify variables that are significant to our dependent variable, G3, or that are significant to either of our two mediator variables, Dalc and Walc. To do this, we constructed three different linear regression models using forward and backward selection, one with G3 as our dependent and with Dalc and Walc excluded, one with Dalc as the dependent and with Walc and G3 excluded, and finally one with Walc as the dependent and with G3 and Dalc excluded. We then generated summary statistics for each model and analyzed the results to identify significant variables. Out of 20 predictors, only these 9 were found to have a significant relationship to either G3, Dalc, or Walc: sex, age, paid (yes/no: extra paid classes with course subject), famrel, goout(how often student goes out), studytime, health, schoolsup(yes/no: extra educational support), and higher(yes/no: wants to take higher education). Interestingly, Pstatus was not found to be significant in any of the models. This means that our initial hypothesized model (Pstatus, Famrel → Dalc, Walc, → G3) has to be rejected and revised. However, famrel was found to be at least somewhat significant in all three of the models. To revise our hypothesized model now that we know Pstatus has no significant effect, we simply took out Pstatus and changed it to the following: 
Famrel → Dalc, Walc, → G3.

To build our mediation model, we inserted the 9 predictors found to be significant, and used Dalc and Walc as mediators, with G3 still being our dependent. We used dummy variables with every regular variable to show the effects of each individual variable on Dalc, Walc, and G3.  

Here is a visualization of the mediation model:
![image](https://github.com/jbroerman/studentgradeanalysis/assets/122945798/0ae91609-3248-4280-b1cb-3918162b4210)

This all-in-one model entails everything that has been searched for from the beginning and does a quality job on finding the underlying variables that affect student alcoholism and grades.

## Results:
What directly effects Grades? P < .05
Study time
Schoolsup
Higher education
What directly effects Dalc?
Sex
Age
Paid
Family relationship
Going out
Does Dalc directly effect grades?
NO
What directly effects Walc?
Sex
Family relationship
Going out
Study time
Health
Does Walc directly effect grades?
YES

Indirect Effects
Family relationship mediated by Dalc = NO
Family relationship mediated by Walc = YES

Total model p value = .069
![image](https://github.com/jbroerman/studentgradeanalysis/assets/122945798/cc81d042-c778-461a-8422-9ffd6111d4dc)

![image](https://github.com/jbroerman/studentgradeanalysis/assets/122945798/782d6eb8-fe29-4a66-8873-92836d304e1d)
![image](https://github.com/jbroerman/studentgradeanalysis/assets/122945798/e569ff66-56b2-4523-81eb-6e89cf21d2f9)





