#!/usr/bin/perl
@date = split(' ', qx{date});
for($i = 0; $i <= $#date; $i++) {
  print $date[$i] . "\n";
}
