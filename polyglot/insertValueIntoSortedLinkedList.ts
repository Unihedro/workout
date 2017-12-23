function insertValueIntoSortedLinkedList(l: ListNode<number>, v: number): ListNode<number> {
if(!l){return new ListNode(v)}
if(v<l.value){
    var a=new ListNode(v)
    a.next=l;
    return a
}
var f=l
var a:ListNode<number>
var b=l
while(b.next){
a=b
b=b.next
if(v<=b.value){
a.next=new ListNode(v)
a.next.next=b
return f
}
}
b.next=new ListNode(v)
return f
}
