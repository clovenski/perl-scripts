#!/usr/bin/perl
while (1) {  
  print "Are you OK? ";
  $answer = <STDIN>;
  chomp $answer;

  if ($answer =~ m/^(y|Y)$/) {
    print "Glad to hear it\n";
    exit 0;
  } elsif ($answer =~ m/^(n|N)$/) {
    print "Sorry that you are not feeling good\n";
    exit 0;
  } else {
    print "incorrect choice\n";
  }
}
