#!/usr/bin/perl

# argument checking

if ($#ARGV + 1 != 2) {
  print "Provide two positive integers as arguments to receive\n";
  print "their greatest common divisor and lowest common multiple.\n";
  exit 1;
}

if ($ARGV[0] <= 0 || $ARGV[1] <= 0) {
  print "Arguments need to be positive integers.\n";
  exit 1;
}

# two positive integers are given, start script

# subroutines
sub get_gcd {
  my $small = 0;
  my $large = 0;
  if ($_[0] < $_[1]) {
    $small = $_[0];
    $large = $_[1];
  } else {
    $small = $_[1];
    $large = $_[0];
  }

  my $result = $small;
  until ($small % $result + $large % $result == 0) {
    $result--;
    last if ($result == 0);
  }

  return $result;
}

sub get_lcm {
  my $small = 0;
  my $large = 0;
  if ($_[0] < $_[1]) {
    $small = $_[0];
    $large = $_[1];
  } else {
    $small = $_[1];
    $large = $_[0];
  }

  my $result = $large;
  until ($result % $small + $result % $large == 0) {
    $result++;
  }

  return $result;
}

# end of subroutines

$gcd = get_gcd($ARGV[0], $ARGV[1]);
$lcm = get_lcm($ARGV[0], $ARGV[1]);

printf "Greatest common divisor: %s\n", $gcd;
printf "Lowest common multiple: %s\n", $lcm;
