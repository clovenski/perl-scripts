#!/usr/bin/perl
print "Enter a number: ";
$num = <STDIN>;
chomp $num;
if ($num % 2 == 0) {
  print "$num is even.\n";
} else {
  print "$num is odd.\n";
}
