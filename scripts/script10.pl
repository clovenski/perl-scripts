#!/usr/bin/perl

if ($#ARGV + 1 != 2) {
  print "Provides a menu to perform basic arithmetic on\n";
  print "two integers given as arguments.\n";
  exit 1;
}

sub print_menu1 {
  print "Add the numbers (enter a or A)\n";
  print "Subtract the numbers (enter s or S)\n";
  print "Multiply the numbers (enter m or M)\n";
  print "Divide the numbers (enter d or D)\n";
  print "Exit (select e or E)\n";
}

sub add_numbers {
  my $result = $first + $second;
  return "$first + $second = " . $result;
}

sub sub_numbers {
  my $result = $first - $second;
  return "$first - $second = " . $result;
}

sub mul_numbers {
  my $result = $first * $second;
  return "$first * $second = " . $result;
}

sub div_numbers {
  my $result = $first / $second;
  return "$first / $second = " . $result;
}

sub print_menu2 {
  print "Perform another operation on same integers (enter s or S)\n";
  print "Perform an operation on two different integers (enter d or D)\n";
  print "Exit (select e or E)\n";
}

sub get_integers {
  print "Enter first integer: ";
  $first = <STDIN>;
  chomp $first;
  print "Enter second integer: ";
  $second = <STDIN>;
  chomp $second;
}

$first = $ARGV[0];
$second = $ARGV[1];

while (1) {
  print_menu1();
  print "Enter choice: ";
  $choice = <STDIN>;
  chomp $choice;

  if ($choice =~ m/^[aA]$/) {
    print add_numbers() . "\n\n";
  } elsif ($choice =~ m/^[sS]$/) {
    print sub_numbers() . "\n\n";
  } elsif ($choice =~ m/^[mM]$/) {
    print mul_numbers() . "\n\n";
  } elsif ($choice =~ m/^[dD]$/) {
    print div_numbers() . "\n\n";
  } elsif ($choice =~ m/^[eE]$/) {
    exit 0;
  } else {
    print "$choice is not a valid choice.\n\n";
    next;
  }

  print_menu2();
  print "Enter choice: ";
  $choice = <STDIN>;
  chomp $choice;
  
  while (1) {
    if ($choice =~ m/^[sS]$/) {
      print "\n";
      last;
    } elsif ($choice =~ m/^[dD]$/) {
      print "\n";
      get_integers();
      print "\n";
      last;
    } elsif ($choice =~ m/^[eE]$/) {
      exit 0;
    } else {
      print "$choice is not a valid choice.\n";
    }
  }
}
