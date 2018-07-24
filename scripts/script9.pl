#!/usr/bin/perl

if ($#ARGV + 1 != 1) {
  print "Prints the square of the integer given as an argument.\n";
  exit 1;
}

sub do_square {
  return $_[0] ** 2;
}

$result = do_square($ARGV[0]);
print "$result\n";
