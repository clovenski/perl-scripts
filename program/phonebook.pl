#!/usr/bin/perl

# subroutines

sub print_menu {
  print "(1) Print list in alphabetical order\n";
  print "(2) Print list in reverse alphabetical order\n";
  print "(3) Search for a record by last name\n";
  print "(4) Search for a record by birthday\n";
  print "(5) Exit\n";
}

sub list_alph_order {
  open(FILE, "datafile");
  my @data;
  while (1) {
    print "Enter 1 to list by first name, or\n";
    print "enter 2 to list by last name: ";
    my $input = <STDIN>;
    chomp $input;
    if ($input == 1) {
      print "\n";
      # for every line in file, push onto @data the ones with 6 fields,
      # separator being ":"
      while (<FILE>) {
        next unless (split(/:/) == 6);
	push @data, $_;
      }
      print sort @data;
      print "\n";
      last;
    } elsif ($input == 2) {
      print "\n";
      # for every line in file, push onto @data the ones with 6 fields,
      # separator being ":"
      while (<FILE>) {
        next unless (split(/:/) == 6);
	push @data, $_;
      }
      # sort @data by second field (last name)
      print sort { $a->[1] cmp $b->[1] } @data;
      print "\n";
      last;
    } else {
      print "Invalid choice given.\n";
    }
  }
  close(FILE);
}

sub list_rev_alph_order {
  open(FILE, "datafile");
  my @data;
  while (1) {
    print "Enter 1 to list by first name, or\n";
    print "enter 2 to list by last name: ";
    my $input = <STDIN>;
    chomp $input;
    if ($input == 1) {
      print "\n";
      # for every line in file, push onto @data the ones with 6 fields,
      # separator being ":"
      while (<FILE>) {
        next unless (split(/:/) == 6);
	push @data, $_;
      }
      print reverse sort @data;
      print "\n";
      last;
    } elsif ($input == 2) {
      print "\n";
      # for every line in file, push onto @data the ones with 6 fields,
      # separator being ":"
      while (<FILE>) {
        next unless (split(/:/) == 6);
	push @data, $_;
      }
      # sort @data by second field (last name)
      print reverse sort { $a->[1] cmp $b->[1] } @data;
      print "\n";
      last;
    } else {
      print "Invalid choice given.\n";
    }
  }
  close(FILE);
}

sub search_by_last_name {
  print "Enter the last name to search: ";
  my $lname = <STDIN>;
  chomp $lname;
  print "\n";
  open(FILE, "datafile");
  my @data;
  # for every line in file, push onto @data the ones with 6 fields,
  # separator being ":", AND match the last name specified by user
  while (<FILE>) {
    next unless (split(/:/) == 6 && $_ =~ m/^[A-Z][a-z]* $lname/);
    push @data, $_;
  }
  print @data;
  print "\n";
  close(FILE);
}

sub search_by_birthday {
  open(FILE, "datafile");
  my @data;
  while (1) {
    print "Enter 1 to search by year, or\n";
    print "enter 2 to search by month: ";
    my $input = <STDIN>;
    chomp $input;
    if ($input == 1) {
      print "Year: ";
      my $year = <STDIN>;
      chomp $year;
      print "\n";
      # for every line in file, push onto @data the ones with 6 fields,
      # separator being ":", AND match specified year in birthday by user (5th field)
      while (<FILE>) {
        next unless (split(/:/) == 6 && (split(/:/))[4] =~ m%/$year$%);
	push @data, $_;
      }
      print @data;
      print "\n";
      last;
    } elsif ($input == 2) {
      print "Month: ";
      my $month = <STDIN>;
      chomp $month;
      print "\n";
      # for every line in file, push onto @data the ones with 6 fields,
      # separator being ":", AND match specified month in birthday by user (5th field)
      while (<FILE>) {
        next unless (split(/:/) == 6 && (split(/:/))[4] =~ m%^$month/%);
	push @data, $_;
      }
      print @data;
      print "\n";
      last;
    } else {
      print "Invalid choice given.\n";
    }
  }
  close(FILE);
}

# end of subroutines

# if sample data file exists,
# then start program

$file = "datafile";
if (-e $file) {
  while (1) {
    print_menu();
    print "Enter choice: ";
    my $choice = <STDIN>;
    chomp $choice;

    if ($choice == 1) {
      list_alph_order();
    } elsif ($choice == 2) {
      list_rev_alph_order();
    } elsif ($choice == 3) {
      search_by_last_name();
    } elsif ($choice == 4) {
      search_by_birthday();
    } elsif ($choice == 5) {
      exit 0;
    } else {
      print "Invalid choice given.\n";
    }
  }
} else { # print error message and exit
  print "Data file to be used for this program could not be found.\n";
  print "Exiting program . . .\n";
  exit 1;
}
