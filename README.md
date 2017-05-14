# 2017_Sasson_and_Ryan
written by Joseph F. Ryan in April, 2017

## all_data.txt 
Tabbed delimited data from experiments with permeable divider.
Data used to determine number of samples per simulation.

## mc_percent.pl
Script used to generate null distribution. 
By default it prints out 10,000 sorted values. 
There are a few global variables declared with "our" in all caps that can be adjusted.
```
$PRINT_DIST = 1;         # set to 0 if you want other info about the distribution
$SKIP_LT25 = 0;          # set to 1 if you want to skip data from all_data.txt where values are less than 25
$SEED = 42;              # set to a different number to generate a different random distribution
$REPS = 10000;           # set to a different number if you want a different number of reps
$FILE = './alldata.txt'; # set to a different file name if you want to use different experimental data```
