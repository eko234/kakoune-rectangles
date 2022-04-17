use strict;
use warnings;
my ($selection_desc) = @ARGV;
print "the desc\n";
print $selection_desc;
print "the desc\n";
my ($start, $end) = split(",", $selection_desc);
my ($start_row, $start_col) =  split(".", $start);
my ($end_row, $end_col) =    split(".", $end);
my $command = "C";
my $_row = $end_row >= $start_row ? $end_row : $start_row;
my $colmin = $start_col >= $end_col ? $end_col : $start_col;
my $colmax = $end_row >= $start_row ? $end_row : $start_row;
my $count = abs($start_row - $end_row);
print "FUCKO\n";
print $_row;
print $colmin;
print $colmax;
print "FUCKO\n";
print "FUCK?";
print 2 > 1 ? 2 : 1;
print $count;
print $colmax;
print "FUCK?";
my $result = <<"END";
select $_row.$colmin,$_row.$colmax
execute-keys $count$command
END
print $result;
