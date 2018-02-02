Auto=read.table("Auto.data", header=T, na.strings="?")
fix(Auto)
?dim
dim(Auto)
Auto=na.omit(Auto)
dim(Auto)
names(Auto)
plot(Auto$cylinders, Auto$mpg)
cylinders=as.factor(cylinders)
attach(Auto)
plot(cylinders, mpg, col="red", varwidth=T, xlab="cylinders", ylab="MPG")
hist(mpg, col=2, breaks=15)
pairs(Auto)
pairs(~ mpg + displacement + horsepower + weight + acceleration, Auto)
plot(horsepower, mpg)
identify(horsepower,mpg,name)
summary(Auto)
summary(mpg)
## The above code is still part of the chapter, not the exercises. I'm just practicing here.

College=read.csv("College.csv")
fix(College)
rownames(College)=College[,1]
fix(College)
College=College[,-1]
fix(College)

summary(College)
pairs(College[,1:10])

plot(College$Outstate, College$Private)## Well, this didn't work...
plot(College$Private, College$Outstate)

Outstate=as.factor(Outstate)
attach(College)
plot(Outstate, Private)
Outstate=as.factor(Outstate)
Private=as.factor(Private)
plot(Outstate, Private) ## This created a solid black square so I did something wrong...
Outstate=as.numeric(Outstate) ## Here I'm trying to fix it.
plot(Outstate, Private) ## But I didn't because it still doesn't give me a boxplot...Why not?

Elite=rep("No", nrow(College)) ## What is "rep": repeat. nrow - how many rows. And break this down, in general
Elite[College$Top10perc > 50]="Yes"
Elite=as.factor(Elite)
College=data.frame(College, Elite)
summary(College)
plot(Outstate, Elite) ## This one doesn't work. For this kind of thing, do you just try both ways until one looks right?
plot(Elite, Outstate) ## This one works. But what are the #s for "outstate"?
hist(Apps, col="blue") ## Okay, I realize I didn't bin anything here so I didn't do what they wanted. Look at E's.
hist(Enroll, col="purple")
plot(Apps, Accept) ## How do I make this make more sense, be more readable?

##9
fix(Auto)

range(Auto)
?range ## This didn't work
range(Auto ,1:8) ## So I tried this and it didn't work. BECAUSE I HAVE TO DO THEM ONE BY ONE. THEY DON'T EVEN MAKE SENSE TO DO ALL AT ONCE.

summary(Auto)
summary(mpg)
range(mpg) ## This is what works, individual columns...
sd(mpg)

## Problem number 9D
AutoRevised2 = Auto[-c(10:85), ] ## IT WORKED!!!!!!
range(AutoRevised2) ## Did not work, but I know why (see above)
range(AutoRevised2$mpg)
mean(AutoRevised2$mpg)
sd(AutoRevised2$mpg)
range(AutoRevised2$cylinders)
mean(AutoRevised2$cylinders)
sd(AutoRevised2$cylinders)

## Problem number 9E
plot(Auto$mpg) ## What is this showing me???
plot(Auto$year, Auto$mpg)
cylinders=as.factor(cylinders)
attach(Auto)
plot(cylinders, mpg, col="pink", varwidth=T, xlab="cylinders", ylab="MPG")
identify(cylinders,mpg,name)

## Problem number 10
library(MASS)
?Boston
Boston
summary(Boston)
dim(Boston)

pairs(Boston)
cor(Boston)["crim",] ## THIS IS SO GREAT AND HELPFUL! USE THIS A LOT.
pairs ( ~ medv + lstat, Boston)
pairs ( ~ crim + age, Boston) ## So, most of these don't have a relationship, as evident by the dark concentrations across the axis (like in this pair)?
pairs ( ~ crim + dis, Boston) ## and this one, right?
pairs ( ~ crim + tax, Boston) ## but I don't get this one
pairs ( ~ crim + black, Boston) ## no association here either, right?
pairs ( ~ crim + lstat, Boston) ## slight one here, right?
pairs ( ~ crim + medv, Boston) # slight one here, right?
hist (crim)
hist (Boston$crim)
plot (Boston$crim)
identify(Boston$crim, name)
attach(Boston)

### 9D
identify(dis, crim, crim) ## that didn't work
?Boston
?identify
plot(crim,dis) ##nope!
plot(dis,tax) #not THAT high but...
identify(dis,tax) ##these ones:[1]  55 200 352
plot(dis,ptratio) ##yes
identify(dis,ptratio) ##these ones: [1]  55 355
## what does the last question of 9D mean?

## 9D REAL ANSWERS
summary(Boston) ## So looking at the difference between the 75% percentile and the max...

##9E
plot(chas)
summary(Boston$chas)
attach(Boston)
hist(chas)
dim(Boston$chas) ##How do I just see the numbers? The histogram shows that most don't bound the river, only less than 100 do but if I wanted to be accurate...

##9E REAL ANSWERS
dim(Boston)
Boston$chas==1 ## This is saying: Give me a vector of Booleans back for Chas is 1. Note: =s always get used for assignment. If I'm comparing, use double equals. ex: All comparisons: 1>2, 1==2, 1<2. How do I write "does not equal"? Answer: 1 != 2 
Boston[Boston$chas==1,]

MyChasIndex=Boston$chas==1 ## Alt way of doing the same as above
Boston[MyChasIndex,] ## This line is the same as the above. 
dim(MyChasIndex)
dim(Boston[MyChasIndex,]) 

## Really easy way
sum(Boston$chas)

##9F
summary(Boston$ptratio) ##19.05

##9G
plot(dis, medv)
identify(dis,medv)## 506
Boston[506,] ##whoa this worked! What are E's comments on this?

##E
which.min(Boston$medv) ## Will tell me the row number of the min value
Boston[399,]

##9H
plot(dis,rm)
## I'm not sure I'm analyzing this correctly...there are a LOT of data points with more than 7 rooms... Or maybe there's a command I should know?
identify(dis,rm) ## 254 seems further away and has more than 8 rooms. I can look at that one...
Boston[254,]

##E
sum(Boston$rm > 7)
sum(Boston$rm > 8)
summary(Boston[Boston$rm > 8,]) ## Then compare this summary to the summary of all the data. How do they compare?

Boston[c(254,33,44,21),] ## I could also do this. Different way of going about it. (Fake row numbers, note)

## Another way to look at it
par(mfrow=c(2,1))
hist(Boston$medv[Boston$rm >8])
hist(Boston$medv)
