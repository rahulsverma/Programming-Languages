my $filename = "input.txt";

open( my $filename, "<", "input.txt" )
  or die "Could not open file $!";
$line_no = 0;
while (<$filename>) {
    push( @lines, $_ );
    $line_no++;
}
print("\n\n");

for my $word (@lines) {
    chomp($word);

    if ( $word =~ m/hi/ ) {
        print "Word [$word] contains \"hi\"\n";
    }

    # string that contains exactly one vowel characters
    if ( $word =~ m/^[^aeiou]*[aeiou]{1}[^aeiou]*$/ ) {
        print "Word [$word] contains exactly one vowel characters.\n";
    }

    my $counter = 0;
    foreach $char ( split //, $word ) {
        if ( $char eq 'l' ) {
            $counter++;
        }
    }
    if ( $counter >= 2 ) {
        print "Word [$word] contains two or more \'l\'\n";
    }

    # string that begin with letter "h" and end with "t"
    if ( $word =~ /^h/ && $word =~ /t$/ ) {
        print "Word [$word] begin with letter \'h\' and ends with \'t\'\n";
    }
}
