function oneToAnother(s, t) {
if(t.includes(s))return 0
l=0
r=0
while(s[l]==t[l])l++
while(s[s.length-r-1]==t[t.length-r-1])r++
return (s.length-r-1)-l+1
}
