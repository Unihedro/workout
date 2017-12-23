function columnTitle($n) {
$s='';
while($n!=0){
$v='ZABCDEFGHIJKLMNOPQRSTUVWXY'[$n%26];
$s=$v.$s;
if(($n%26)>0){
$n=floor($n/26);
}else{
    $n=floor($n/26)-1;}
}
return $s;
}
