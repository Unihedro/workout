require 'optparse'

seed = nil
OptionParser.new{|opts|
  opts.banner = "Usage: luckydraw.rb [OPTIONS]... [FILE]..."
  opts.on("-h", "--help", "Display help"){
    puts opts
    exit
  }
  opts.on("--seed MANDATORY", "Set seed to be used by random"){|v| seed = v.to_i }
}.parse!
ARGV[0] || puts("If nothing happens, make sure you're feeding in input (see --help)")
names = []
$delay = 0.002
def pe a
a.chomp!
a += $\ || "\n"
a.chars.map{|x|
  $><< x
  sleep $delay
}
end
while gets
names << $_.chomp
pe $_
#puts $_
end
pe "=== #{names.size} users loaded ==="

random = nil
nrand = nil
if seed
  pe "seed == #{seed}"
  random = Random.new seed
  nrand = Random.new seed
else
  random = Random.new
  nrand = Random.new random.seed
  pe "seed == #{seed = random.seed}"
end
require 'io/console'
console = IO.console
times = 10
pe "... Shuffling #{times} times"
times.times{|time|
pe ">>> Shuffling#{".".* 1.+ (time - 1) % 3 if time > 0}"
# this value is genrand'd -> https://github.com/ruby/ruby/blob/e5c441a4a2885da61df9894ac17b69cb3c5811f2/array.c#L5378
pe "#{names.size.times.map{|i| nrand.rand(names.size - 1) }.inspect}"[0,console.winsize[1]]
pe "#{names.shuffle!(random: random).inspect}"[0,console.winsize[1]]
}
pe "... Shuffled #{times} times"

pe "=== Drawing board with #{size = names.size} users... ==="
names_per_side = (names.size / 2.0).ceil
pe "names_per_side == #{names_per_side}"
world_height = names_per_side * 2 + 1
pe "world_height == #{world_height}"
left  = names.shift names_per_side
right = names
max = [left, right].map{|x| x.map(&:size).max }
pe "world_width == console.winsize[1] - #{max[0]} - #{max[1]} - 2"
def csi(code) "\e[" + code end
def cursor(x=nil,y=nil) csi("#{x};#{y}H") end
def cursor_save() print csi(?s) end
def cursor_restore() print csi(?u) end

pe "===================================="
pe "=                                  ="
pe "=  Maximize your terminal window!  ="
pe "=                                  ="
pe "===================================="
print csi(?F) * 2
print csi(?C) * 17
3.downto(1){|t|
  print t
  print csi ?D
  sleep 1
}
winsize = console.winsize
world_width = winsize[1] - max[0] - max[1] - 2
p winsize[1]
print csi '2J'
print csi ?H

parallel = left.size == right.size
$delay = 0.001
$\ = ''
world = {}
minx = 1
miny = max[0] + 2
maxx = world_height
maxy = world_width + miny - 1
chars = [*0..9, *?a..?z, *?A..?Z].join.chars
world_height.times{|x|
if parallel
  (pe left[x / 2].rjust(max[0]) + cursor(x + 1, winsize[1] - max[1] + 1) + right[x / 2]
  world[[x + 1, miny]] = chars.shift
  world[[x + 1, maxy]] = chars.shift) if x.odd?
  puts
else
  if x.odd?
    pe left[x / 2].rjust(max[0])
  world[[x + 1, miny]] = chars.shift
  elsif x > 0 && x < world_height - 1
    pe cursor(x + 1, winsize[1] - max[1] + 1) + right[x / 2 - 1]
    world[[x + 1, maxy]] = chars.shift
    puts
  else
    puts
  end
end
}
(minx .. maxx).each{|x|
world[[x, miny]] || world[[x, miny]] = '#'
world[[x, maxy]] || world[[x, maxy]] = '#'
}
(miny .. maxy).each{|y|
(world[[minx, y]] || world[[minx, y]] = '#'
world[[maxx, y]] || world[[maxx, y]] = '#') if (y - miny).odd?
}
youx = (minx + maxx) / 2
youy = (miny + maxy) / 2
adj_exit = -> x, y {[world[[x, y - 1]], world[[x, y + 1]]].any? {|x| /\w/ =~ x }}
(minx .. maxx).each{|x|
print cursor(x, miny)
(miny .. maxy).each{|y|
print world[[x,y]] || ([x, y] == [youx, youy] ? '?' : (!adj_exit[x, y] && random.rand < 0.2 ? world[[x,y]] = '#' : ' '))
}
}
dir = [[0, -1], [0, 1], [-1, 0], [1, 0]]
$delay = 0.0002
until adj_exit[youx, youy]
dest = dir.map{|x,y| to = [(x += youx
x < minx ? maxx : x > maxx ? minx : x), (y += youy
y < miny ? maxy : y > maxy ? miny : y)]
!world[to] && to} - [false]
#world[[youx, youy]] = '.'
print csi(?D) + '.'
#dest.empty? ? ( # ghost mode ("!")
#youx = (minx + maxx) / 2
#youy = (miny + maxy) / 2
#while world[[youx, youy]]
#dest = dir.map{|x,y| to = [(x += youx
#x < minx ? maxx : x > maxx ? minx : x), (y += youy
#y < miny ? maxy : y > maxy ? miny : y)]
#x.between?(minx + 1 , maxx + 1) && y.between?(miny + 1 , maxy + 1) && to} - [false]
#world.delete [youx, youy]
#print cursor(youx, youy)
#pe " "
#youx, youy = dest[random.rand(4)]
#print cursor(youx, youy)
#pe "!"
#end
#youx = (minx + maxx) / 2
#youy = (miny + maxy) / 2
#) : (
youx, youy = dest[random.rand(dest.size)]#)
print cursor(youx, youy)
pe '?'
end
if /\w/ =~ world[[youx, youy - 1]]
# left
name = left[youx / 2 - 1]
print (cursor(youx, miny - 1 - name.size)) + csi('41m') + csi('32m') + left[youx / 2 - 1]
else
# right
print (csi(?C) * 2) + csi('41m') + csi('32m') + right[youx / 2 - 1]
end
puts cursor(maxx + 1) + csi('0m') + csi('40m') + "size == #{size} && world_width == #{world_width} && seed == #{seed}"
