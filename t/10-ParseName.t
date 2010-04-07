#!/usr/bin/perl 
use strict;
use warnings;

use Test::More tests => 8;
use lib qw( lib );
use Lingua::EN::NameParse::Simple;

my $test_cases = get_test_cases();

foreach my $test_case (keys %{$test_cases}){

  my %name = Lingua::EN::NameParse::Simple::ParseName($test_case);
  foreach my $key (keys %name){
    is($test_cases->{$test_case}->{$key},$name{$key},"NameParse returned correct $key for $test_case");
  }
}

sub get_test_cases {
  my %test_cases = ();

  $test_cases{'Hugh R Esco, III'} = {
         TITLE => '', 
         FIRST => 'Hugh', 
        MIDDLE => 'R', 
          LAST => 'Esco', 
        SUFFIX => 'III'
    };

  $test_cases{'Mr. James P. Jones'} = {
         TITLE => 'Mr.', 
         FIRST => 'James', 
        MIDDLE => 'P', 
          LAST => 'Jones', 
        SUFFIX => ''
    };

  return \%test_cases;
}

1;

