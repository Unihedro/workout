# part 1
a=$<.map(&:chars).map{|x|x.group_by &:itself}
b=a.count{|x|x.any?{|x,y|y.count == 2}}
c=a.count{|x|x.any?{|x,y|y.count == 3}}
p b*c
#!ruby

# part 2
a=$<.map(&:chars)
a.map{|x|a.map{|y|
d=x.zip(y).count{|x,y|x!=y}
(p x,y,x.join,y.join
1/0)if d==1
}}
