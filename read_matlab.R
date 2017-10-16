## Read in Matlab-Files and Calculate Bayes-Factor for TFR-Matrix
# Important! Save n-Dimensional Matrix as '-V6' in Matlab/Octave, as newer data cannot be read
# 0. Load required packets
library(R.matlab)
library(BayesFactor)
library(lattice)
library(gridExtra)

# 1. Set Working Directory
setwd('~/Desktop/R_Matlab_Common/')

# 2. Read in Matlab-File
indat <- readMat('testfile.mat')

# 3. Compute the Bayes-Factors for T-Values
n <- 15 # Number of Subjects
at<-array(data=NA,dim=dim(indat$x)) # Pre-allocate for speed
for (i in 1:(dim(indat$x)[1])){
	for (j in 1:(dim(indat$x)[2])){
		for (k in 1:(dim(indat$x)[3])){

			tmp <- ttest.tstat(indat$x[i,j,k],n,n)
			at[i,j,k] <- exp(tmp$bf)
	
		}
	}
}

# 4. Compute the Bayes-Factors for R-Values
n <- 15 # Number of Subjects
ar<-array(data=NA,dim=dim(indat$x)) # Pre-allocate for speed
for (i in 1:(dim(indat$x)[1])){
	for (j in 1:(dim(indat$x)[2])){
		for (k in 1:(dim(indat$x)[3])){
	
			tmp <- linearReg.R2stat(n,1,indat$x[i,j,k]^2)
			ar[i,j,k] <- exp(tmp$bf) 
			
		}
	}
}
# 5. Plot the results
rgb.palette <- colorRampPalette(c("white","yellow","red"), space = "rgb")


p1<-levelplot(indat$x[,,1],col.regions=rgb.palette(120)) 
p2<-levelplot(at[,,1],col.regions=rgb.palette(120)) 
p3<-levelplot(ar[,,1],col.regions=rgb.palette(120)) 

grid.arrange(p1,p2,p3,ncol = 3)

# 6. Save output matrix back to matlab
writeMat('testfile_R.mat',ar=ar,at=at) 
