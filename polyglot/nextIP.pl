# Note: Rejected solution
sub nextIP {
my ($mainIP, $usedIP) = @_;
#my %seen = map { $_ => 1 } @usedIP;
$mainIP=~/(\d+)\.(\d+)\.(\d+)\.(\d+)/;
my $c=$1;
my $d=$2;
my $e=$3;
my $f=$4;
while("$c.$d.$e.$f" ne "255.255.255.255"){
$f++;
if($f>255){$f=0;$e++;
if($e>255){$e=0;$d++;
if($d>255){$d=0;$c++;}}}
if("$c.$d.$e.$f"~~$usedIP) {}else{ return "$c.$d.$e.$f" }
}
return "-1";
}
