# Anova Sample Script

group1_cond11 <- runif(10)
group1_cond12 <- runif(10)+1 
group1_cond21 <- runif(10)+2
group1_cond22 <- runif(10)+3

group2_cond11 <- runif(10)+4
group2_cond12 <- runif(10)+5
group2_cond21 <- runif(10)+6
group2_cond22 <- runif(10)+7


# Make a huge Matrix with Value x Cond1 x Cond2 x Group x Subject
# Values
alldat <- list()
alldat$values <- c(
group1_cond11,
group1_cond12,
group1_cond21,
group1_cond22,

group2_cond11,
group2_cond12,
group2_cond21,
group2_cond22
)

alldat$Cond1[1:80] <- 0
# Cond1
alldat$Cond1[1:10] <- 0
alldat$Cond1[11:20] <- 0
alldat$Cond1[21:30] <- 1
alldat$Cond1[31:40] <- 1

alldat$Cond1[41:50] <- 0
alldat$Cond1[51:60] <- 0
alldat$Cond1[61:70] <- 1
alldat$Cond1[71:80] <- 1

alldat$Cond2[1:80] <- 0
# Cond2
alldat$Cond2[1:10] <- 0
alldat$Cond2[11:20] <- 1
alldat$Cond2[21:30] <- 0
alldat$Cond2[31:40] <- 1

alldat$Cond2[41:50] <- 0
alldat$Cond2[51:60] <- 1
alldat$Cond2[61:70] <- 0
alldat$Cond2[71:80] <- 1

alldat$Group[1:80] <- 0
# Group
alldat$Group[1:40] <- 0
alldat$Group[41:80] <- 1

alldat$Subj[1:80] <- 0
# Subject
alldat$Subj[1:10] <- 1:10
alldat$Subj[11:20] <- 1:10
alldat$Subj[21:30] <- 1:10
alldat$Subj[31:40] <- 1:10

alldat$Subj[41:50] <- 11:20
alldat$Subj[51:60] <- 11:20
alldat$Subj[61:70] <- 11:20
alldat$Subj[71:80] <- 11:20

# Make a Data Frame
allmat <- as.data.frame(alldat)
allmat$Cond1 <- as.factor(allmat$Cond1)
allmat$Cond2 <- as.factor(allmat$Cond2)
allmat$Group <- as.factor(allmat$Group)
allmat$Subj <- as.factor(allmat$Subj)



## Anova
# Within: Cond1 & Cond2
# Between: Group
# Error is Subject / Within

aov1 <- aov(values~(Cond1*Cond2*Group)+Error(Subj/(Cond1*Cond2)),data=allmat)
summary(aov1)
print(model.tables(aov1,"means"),digits=3))