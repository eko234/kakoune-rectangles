enum Mode <CLASSIC INCLUSIVE>;

role Rectangle {
  method getCoords(Str $s){
    my ($start, $end) = $s.split(",");
    my ($start_row, $start_col) = $start.split(".");
    my ($end_row, $end_col) = $end.split(".");
    %(
      start => %(
        row => $start_row ,
        col => $start_col ,
      ),
      end => %(
        row => $end_row ,
        col => $end_col ,
      )
    )
  }

  sub getCommandClassicImpl(%coords){
    my $command = "C";
    my $_row = @[%coords.<start>.<row>, %coords.<end>.<row>].min;
    my $colmin = @[%coords.<start>.<col>, %coords.<end>.<col>].min;
    my $colmax = @[%coords.<start>.<col>, %coords.<end>.<col>].max;
    my $count = (%coords.<start>.<row> - %coords.<end>.<row>).abs;

    qq:to/:::/;
    select $_row.$colmin,$_row.$colmax
    execute-keys $count$command
    :::
  }

  sub getCommandInclusiveImpl(%coords){ ... }

  method getCommand(Mode $mode, %coords){
    given $mode {
      when CLASSIC {
        getCommandClassicImpl(%coords)
      }
    }
  } 
}

sub MAIN($mode, $coords) {
  my $parsed_mode = do given $mode {
    when <CLASSIC> { CLASSIC }
    when <INCLUSIVE> { INCLUSIVE }
    default { die "invalid mode" }
  }

  my $parsed_coords = Rectangle.getCoords($coords);
  my $commands = Rectangle.getCommand($parsed_mode, $parsed_coords);
  print $commands;
}
