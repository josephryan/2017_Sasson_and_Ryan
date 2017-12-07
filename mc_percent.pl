#!/usr/bin/perl

# this script generateds the null distribution used in Ryan & Sasson, 2017
# script was written by Joseph Ryan in April, 2017
# it could be adapted for other purposes, but its main goal is to 
# show how the null distribution was geneerated in this paper.
# the program requires no options

# LICENCE
# mc_percent.pl
# Copyright (C) 2017, Joseph F. Ryan <joseph.ryan@whitney.ufl.edu>

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

use strict;
use warnings;
use Data::Dumper;

our $PRINT_DIST = 1;
our $SKIP_LT25 = 0; 

our $SEED = 42;
our $REPS = 10000;
our $FILE = './alldata.txt';
$FILE = $ARGV[0] if ($ARGV[0]);

MAIN: {
    srand($SEED);
    my ($test_sd,$sample_num) = get_sumdiff_from_real_data($FILE);
    print "\$test_sd = $test_sd\n" unless ($PRINT_DIST);
    print "\$sample_num = $sample_num\n" unless ($PRINT_DIST);

    my @sd = ();
    my $tot = 0;
    for (my $i = 0; $i < $REPS; $i++) {
        my $sum_diffs = get_sum_diffs($sample_num);
        $tot += $sum_diffs;
        push @sd, $sum_diffs;
    }
    my $avg = $tot / $REPS;
    print "\$avg = $avg\n" unless ($PRINT_DIST);
    my $seen = 0;
    foreach my $s (sort {$a <=> $b} @sd) {
        print "$s\n" if ($PRINT_DIST);
        $seen++ if ($s > $test_sd);
    }
    print "\$seen = $seen\n" unless ($PRINT_DIST);
    my $pval = $seen / $REPS;
    print "\$pval = $pval\n" unless ($PRINT_DIST);
}

sub get_sumdiff_from_real_data {
    my $file= shift;
    open IN, $file or die "cannot open $file:$!";
    my $sumdiff = 0;
    my $sample_num = 0;
    while (my $line = <IN>) {
        chomp $line;
        my @f = split /\s+/, $line;
        next if ($f[1] == 0);
        next if ($f[1] < 25 && $SKIP_LT25);
        my $sum = $f[1] + $f[2];
        my $diff = ($f[1] / $sum) - ($f[2] / $sum);
        $sumdiff += $diff;   
        $sample_num++;
    }
    return ($sumdiff,$sample_num);
}

sub get_sum_diffs {
    my $sample_num = shift;
    my @vals = (0..100);
    my $sumdiff = 0;
    for (my $i = 0; $i < $sample_num; $i++) {
        my $rand = rand(@vals);
        my $partner = 100 - $rand;
        my $diff = $partner - $rand;
        $diff *= -1 if ($diff < 0);
        $diff /= 100;
        $sumdiff += $diff;
    }
    return $sumdiff;
}


