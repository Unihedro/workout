T checkBlanagrams( a,  b) {
  T c=a.grep().sort()
  T d=b.grep()
  for(int i=0;i<c.size();i++)
   d.removeElement(c[i])
 d.size()==1
}
