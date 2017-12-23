fun isTreeSymmetric(t: Tree<Int>?): Boolean {
if(t==null)return true;
if(t.left==null&&t.right==null)return true;
if(t.left==null||t.right==null)return false;
var l = listOf(t);
while(l.size>0) {
val p = mutableListOf<Tree<Int>?>();
l.forEach{v->
    if(v!=null){
        p.add(v.left);
        p.add(v.right);
    }
};
val q = mutableListOf<Int>();
val u = mutableListOf<Tree<Int>>();
p.forEach{v->
    if(v != null){
        q.add(v.value);
        u.add(v);
    } else {
        q.add(2000)
    }
};
if (u.size % 2 == 1)
    return false;
if (q.reversed() != q)
    return false;
l = u;
}
return true;
}
