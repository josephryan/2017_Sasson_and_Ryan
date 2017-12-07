# 2017_Sasson_and_Ryan
written by Joseph F. Ryan in April, 2017

## all_data.txt 
Tab-delimited data from experiments with permeable divider.
Data used to determine number of samples per simulation.

## 11.txt
Tab-delimited data from experiments with two size-matched individuals 
in two separate aquaria. Experiments were performed within two weeks
of each other.

## 14.txt
Tab-delimited data from experiments with two size-matched individuals 
in two separate aquaria. This set includes all of the data in 11.txt plus
three pairs where experiments were performed more than two weeks apart.

## mc_percent.pl
Script used to generate null distribution. 
By default it prints out 10,000 sorted values using alldata.txt. 
It can be called with a different data file:
```perl mc_percent.pl > all_data.out
perl mc_percent.pl 11.txt > 11.out
perl mc_percent.pl 14.txt > 14.out```

There are a few global variables declared with "our" in all caps that can be adjusted.
```
$PRINT_DIST = 1;         # set to 0 if you want other info about the distribution
$SKIP_LT25 = 0;          # set to 1 if you want to skip data from all_data.txt where values are less than 25
$SEED = 42;              # set to a different number to generate a different random distribution
$REPS = 10000;           # set to a different number if you want a different number of reps
$FILE = './alldata.txt'; # set to a different file name if you want to use different experimental data```
