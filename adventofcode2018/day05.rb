#!ruby




g=' '
a=$<.read
a.chars{|x|g[-1].downcase==x.downcase && g[-1] != x ? (g[-1]='') : g<<x}
p g.strip.size

a=g.strip
p a.downcase.chars.uniq.map{|x|g=' '
a.chars.reject{|y|y.downcase==x}.each{|x|g[-1].downcase==x.downcase && g[-1] != x ? (g[-1]='') : g<<x}
g.strip.size
}.min
