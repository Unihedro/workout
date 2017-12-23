sub higherVersion2 {
my ($a, $b) = @_;
@c=$a=~/[^.]+/g;
@d=$b=~/[^.]+/g;
foreach $e(0..15){
return 1 if (0|@c[$e])>(0|@d[$e]);
return -1 if (0|@c[$e])<(0|@d[$e]);
}
return 0;
}
