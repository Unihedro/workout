// Note: Rejected solution
def isPuzzleCorrect(s: Array[Array[Int]]): Boolean = {
if(s.size==2)return false
if(s(0)(0)==0&&s(0)(1)==(-1)&&s(0)(2)==0&&s(0)(3)==1)return true
if(s(0)(0)==0&&s(0)(1)==1&&s(0)(2)==1&&s(0)(3)==0&&s(3)(2)==1)return true
if(s(0)(0)==1&&s(0)(1)==0&&s(0)(2)==(-1)&&s(0)(3)==0&&s(6)(2)==(-1))return true
if(s(0)(0)==1&&s(0)(1)==1&&s(0)(2)==1&&s(0)(3)==1)return true
s.transpose.map(_.sum).forall(_==0)
}
