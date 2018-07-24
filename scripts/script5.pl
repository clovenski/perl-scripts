#!/usr/bin/perl
print "Enter a color: ";
$color = <STDIN>;
chomp $color;
if ($color =~ m/^[bB]l/) {
  print "The sky color is $color.\n";
} elsif ($color =~ m/^(red|yellow)$/) {
  print "The sun is sometimes this color.\n";
} else {
  print "that color does not fit any category\n";
}
