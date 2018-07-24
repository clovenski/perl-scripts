#!/usr/bin/perl

# if no argument was given, print error message and quit
if ($#ARGV + 1 == 0) {
  print "Please provide a number from 0 to 100 as an argument.\n";
  exit 1;
}

$score = $ARGV[0];

# if score is not within [0-100], print error message and quit
if ($score < 0 || $score > 100) {
  print "Invalid score given.\n";
  exit 1;
}

if ($score >= 90) {
  print "you got A\n";
} elsif ($score >= 80) {
  print "you got B\n";
} elsif ($score >= 70) {
  print "you got C\n";
} elsif ($score >= 60) {
  print "you got D\n";
} else {
  print "you failed\n";
}
