package main;
use strict;
use Test::More;
use MooseX::App::Simple;

#use_ok( TestApp, 'use TestApp');

my %args = ('quiet'  => 1);
my $app = MooseX::App::Simple->with('MooseX::App::Role::Log4perl')->new_with_options(%args);
#open my $out, "<", STDOUT;
ok (tostring($app->log->info("Testing info")) eq '', "executing quietly");


sub tostring (&) {
  my $s;
  open local *STDOUT, '>', \$s;
  shift->();
  $s
}

done_testing;

