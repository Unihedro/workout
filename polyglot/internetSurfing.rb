def internetSurfing(u, k, s)
c={s=>1}
h=Hash.new{|x,y|x[y]=[]}
u.each{|x,y|h[x]<< y
h[y]<<x}
k.times{d=Hash.new{|x,y|x[y]=0}
c.each{|x,y|h[x].each{|g|d[g]+=y}}
c=d}
c.to_a.sort{|x,y|y<=>x}.max_by{|x,y|y}[0]
end
