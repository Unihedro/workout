function bottlesOfSoda($n, $m, $k) {
$m=$m+$n;
while($m>=$k){
$q=floor($m/$k);
$m-=$q*$k;
$n+=$q;
$m+=$q;
}
return $n;
}
