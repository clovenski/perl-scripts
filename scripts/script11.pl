#!/usr/bin/perl

sub get_sum {
  my $result = 0;
  for($i = 1; $i <= $num; $i++) {
    $result += $i;
  }
  return $result;
}

sub get_fact {
  my $result = 1;
  for($i = 1; $i <= $num; $i++) {
    $result *= $i;
  }
  return $result;
}

while (1) {
  print "Enter an integer from 1 to 10: ";
  $num = <STDIN>;
  chomp $num;
  if ($num < 1 || $num > 10) {
    print "invalid integer given\n";
    next;
  }
  print get_sum() . "\n";
  print get_fact() . "\n";
  last;
}
