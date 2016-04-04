#!/usr/bin/env perl

#-------------------------------------------------------------------------------
# Galaxy wrapper for SnpEff
#
#																Pablo Cingolani
#-------------------------------------------------------------------------------

# Debug mode?
$debug = 0;

# Get command's dir (full path provided by Galaxy)
#$dir = `dirname $0`;
#$dir =~ tr/\r\n//d;
$dir="/usr/src/myapp";

# Basic SnpEff command
$command = $ARGV[0];	# Which snpEff's command do we want to execute?
@snpEffCmd = ("java", "-Xmx4g", "-jar", "$dir/snpEff.jar", "$command", "-c", "$dir/snpEff.config");
print "$snpEffCmd[0] $snpEffCmd[1] $snpEffCmd[2] $snpEffCmd[3] $snpEffCmd[4] $snpEffCmd[5] $snpEffCmd[6]\n";


# Add all command line options
for( $i=1 ; $i <= $#ARGV ; $i++ ) {
	$snpEffCmd[$#snpEffCmd + 1] = $ARGV[$i];
	print "$ARGV[$i] ";
}

# Execute
#print STDERR "Command to execute: " . join(" ", @snpEffCmd) . "\n\n" if $debug;
exec @snpEffCmd;
