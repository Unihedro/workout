[1518-11-01 00:00] Guard #10 begins shift
[1518-11-01 00:05] falls asleep
[1518-11-01 00:25] wakes up
[1518-11-01 00:30] falls asleep
[1518-11-01 00:55] wakes up
[1518-11-01 23:58] Guard #99 begins shift
[1518-11-02 00:40] falls asleep
[1518-11-02 00:50] wakes up
[1518-11-03 00:05] Guard #10 begins shift
[1518-11-03 00:24] falls asleep
[1518-11-03 00:29] wakes up
[1518-11-04 00:02] Guard #99 begins shift
[1518-11-04 00:36] falls asleep
[1518-11-04 00:46] wakes up
[1518-11-05 00:03] Guard #99 begins shift
[1518-11-05 00:45] falls asleep
[1518-11-05 00:55] wakes up

#!ruby


h={}
ll=0
sl={}
p (a=$<.sort).map{|x|m = x.chomp
m =~ /^\[1518-(\d{2})-(\d{2}) (\d{2}):(\d{2})\] (.+)$/
j,k,o,q,s=[$1, $2, $3, $4, $5]
j,k,o,q=b=[j,k,o,q].map(&:to_i)
#p b
s =~ /^(?:Guard #(\d+)|(falls)|(wakes))/
if $1
ll=$1.to_i
elsif $2
sl[ll]=b
elsif $3
u,i,l,n=sl[ll]
kk=h[ll] ? h[ll] : h[ll]=0
kk +=  (o*60+q)- (l*60+n)
h[ll] = kk
end
}
guard = h.max_by{|x,y|y}.first
p guard

# part 1

sl=0
qqq=Hash.new 0
a.map{|x|m = x.chomp
m =~ /^\[1518-(\d{2})-(\d{2}) (\d{2}):(\d{2})\] (.+)$/
j,k,o,q,s=[$1, $2, $3, $4, $5]
j,k,o,q=b=[j,k,o,q].map(&:to_i)
#p b
s =~ /^(?:Guard #(\d+)|(falls)|(wakes))/
if $1
ll=$1.to_i
elsif $2
(sl=q) if ll == guard
elsif $3
(n=sl
(qqq[n]+=1

n+=1
n=0 if n==60)while n!=q) if ll == guard
end
}
p qqq.max_by{|x,y|y}.first*guard

# part 2
qqqt=Hash.new{Hash.new 0}
qsl={}
a.map{|x|m = x.chomp
m =~ /^\[1518-(\d{2})-(\d{2}) (\d{2}):(\d{2})\] (.+)$/
j,k,o,q,s=[$1, $2, $3, $4, $5]
j,k,o,q=b=[j,k,o,q].map(&:to_i)
#p b
s =~ /^(?:Guard #(\d+)|(falls)|(wakes))/
if $1
ll=$1.to_i
elsif $2
(qsl[ll]=q) #if ll == guard
elsif $3
(n=qsl[ll]
qqq=qqqt.has_key?(ll) ? qqqt[ll] : (qqqt[ll]=qqqt[ll])
(qqq[n]+=1

n+=1
n=0 if n==60)while n!=q) #if ll == guard
end
}
p qqqt
a,b= qqqt.max_by{|x,y|y.max_by{|x,y|y}.last}
p a*b.max_by{|x,y|y}.first
p b.max_by{|x,y|y}.last
