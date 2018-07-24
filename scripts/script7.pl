#!/usr/bin/perl
$iter = @ARGV;
$i = 0;
while ($i < $iter) {
  $j = 0;
  while ($j < $#ARGV + 1) {
    print $ARGV[$j] . " ";
    $j++;
  }
  print "\n";
  shift @ARGV;
  $i++;
}
