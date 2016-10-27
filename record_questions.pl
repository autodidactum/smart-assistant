# store my questions and tag them
use strict;
use warnings;
use Storable;
use Data::Dumper;

my ($listonly, $question);
if (@ARGV) {
    $listonly = ($ARGV[0] =~ /-listonly/)? 1: 0;
    }

my %qref;
my $q_file = 'questions';

if (!$listonly) {
    print "Enter your question:\n\t";
    chomp ($question = <STDIN>);
    }

if (-e $q_file) {
    my $qref = retrieve($q_file);
    %qref = %{ $qref };
    print "Number of questions recorded so far: ", scalar keys %qref,"\n";
    }
   
$qref{scalar localtime} = $question unless $listonly;

print Dumper \%qref;

store \%qref, $q_file;
