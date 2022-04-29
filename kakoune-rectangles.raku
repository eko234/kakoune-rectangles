sub MAIN($mode, $coords) {
  my ($start, $end) = $coords.split(",");
  my ($start_row, $start_col) = $start.split(".");
  my ($end_row, $end_col) = $end.split(".");
  my $command = "C";
  my $_row = @[$start_row.Int, $end_row.Int].min;
  my $colmin = @[$start_col.Int, $end_col.Int].min;
  my $colmax = @[$start_col.Int, $end_col.Int].max;
  my $count = ($start_row.Int - $end_row.Int).abs;
  say qq:to/:::/;
  select $_row.$colmin,$_row.$colmax
  execute-keys $count$command
  :::
}
