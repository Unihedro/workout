a=$<.map(&:chars).map{|x|x.group_by &:itself}
b=a.count{|x|x.any?{|x,y|y.count == 2}}
c=a.count{|x|x.any?{|x,y|y.count == 3}}
p b*c
a=$<.map(&:chars)
a.map{|x|a.map{|y|
d=x.zip(y).count{|x,y|x!=y}
(p x.join,y.join
1/0)if d==1
}}

q={}
p a=$<.map{|x|m = x.chomp
m =~ /^#(\d+) @ (\d+),(\d+): (\d+)x(\d+)$/
b=[$1,$2,$3,$4,$5].map &:to_i
h=$2.to_i
j=$3.to_i
(0...$4.to_i).each{|x|(0...$5.to_i).each{|y|
k=[h+x,j+y]
q[k]=(q[k]||0)+1
}}

b}
p (0..1000).sum{|x|(0..1000).count{|y|
(p a.find{|a,b,c,d,e|b<=x && x<=(b+d) && c<=y && y<=(c+e)}
1/0)if q[[x,y]] && q[[x,y]]==1
}}
#1 @ 1,3: 4x4
#2 @ 3,1: 4x4
#3 @ 5,5: 2x2
#!ruby

q={}
 a=$<.map{|x|m = x.chomp
m =~ /^#(\d+) @ (\d+),(\d+): (\d+)x(\d+)$/
b=[$1,$2,$3,$4,$5].map &:to_i
h=$2.to_i
j=$3.to_i
(0...$4.to_i).each{|x|(0...$5.to_i).each{|y|
k=[h+x,j+y]
q[k]=(q[k]||0)+1
}}

b}
p a.find{|a,b,c,d,e|
h=true
(0...d).all?{|x|(0...e).all?{|y|
k=[b+x,c+y]
next h=false if q[k]>1
1
}}
h
}
