%% Add R to path if needed
addpath('/Users/juliankeil/Desktop/R_Matlab_Common/')
addpath('/R')

% to check:

system('R --version')

%quit()

%% Go to common Folder

cd ('/Users/juliankeil/Desktop/R_Matlab_Common/')

data = sum(rand(100), 1);
csvwrite('data.csv', data(:)); % Write as a column
system('R CMD BATCH calc.R outputForDebugging.txt');
testResults = csvread('testResults.csv');
testResultsStruct = struct('W_statistic', testResults(1), 'p_value', testResults(2))

%%

x = rand(1,20);
y = x + rand(1,20);

csvwrite('xydat.csv',[x; y]);
system('R CMD BATCH R_ttest.R debug_T.txt');
testResults = csvread('t_testResults.csv');
testResultsStruct = struct('T_statistic', testResults(1), 'p_value', testResults(2))

