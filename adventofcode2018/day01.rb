#!ruby
# part 1
p$<.sum(&:to_i)
# part 2
s={}
g=0
a=$<.map &:to_i
loop{a.map{|x|m=x
s[g]=1
g+=m.to_i
(p g
exit) if s[g]
} }
