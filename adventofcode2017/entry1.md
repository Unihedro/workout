#Note: This log contains snippets / code which solves Advent of Code 2017's problems. It is extremely difficult to unsee a solution after you have seen it.

# Please do not ignore this notice; you will be doing yourself a massive disservice by skipping out on this wonderful curated list of challenges to get you into shape. It is a good exercise for those who are capable, and a good trail to follow to those who needs directions on what to learn.

Hiya, Uni here! After the last two years of making not much progress on Advent of code I've decided to debut in the competitive programming scene and bring home the bacon. This series details my endeavour of this months' Adventofcode adventure. Will my hidden potential awake itself and strike me a streak of staying on the leaderboards long enough for at least one person to remember? Let's find out!

Day 0: Lack of planning

Having done quite a few speed coding rounds on CodinGame's Clash of Code and CodeFight's tournament games, I'm fond of ruby by how easy it is to type in a rush. Also, I've been quite fond of code golfing and ruby has a lot of handy data types ready to go in a short time. It's unfortunate that I'm allergic to Python so I don't have a good option to pick, anyway.

Staring at my computer with twenty hours left until the start of day 1, I was at a lack of motivation to do anything. Maybe I should check that ruby is actually installed on my machine... I've always used online interpreters to run my code.

Turns out it's pre-installed. Good enough.

I made a day1 file, an input file (empty and ready to paste in), and prepared "ruby day1 input" in the terminal. I took a nap right before it started, and the alarm woke me with a minute to spare. I had enough time to blast a music playlist so I don't have to hear the noise around me, there's been construction noises around this time. (Aoc starts 1 pm for me)

Footnote: https://www.codingame.com/multiplayer/clashofcode https://codefights.com/tournaments

Day 1: Lack of preparation

The wall of text effect is strong. Gold text is blinding.

I scrolled down to locate where the halfway point of the text is. This is something I do in the speed coding games to not get carried away trying to find the statement from pure randomness, because I am not a good random value generator. By doing a binary search, I cut the text into half, process a few words to decide which direction the example cases are, and repeat the binary cutting.

First blunder: I forgot to "chomp" the string. (This is a process that removes the trailing newline out of the string returned by "gets", similar to "chomp" from perl.) This took 12 seconds to locate and fix, and it was causing the back-to-front check to fail because the last char happened to new "\n", not the one we need.

Second blunder: I had not updated Ruby and was on an ancient (<2.0) version. It does not have "array.sum", which was added later and I depended on it not knowing that. It was easy to locate because of the error message and I had learned prior of the .sum trick being added to Ruby really recently so chances are it was missing before.

Third blunder: I implemented a really short-sighted algorithm by using a regex hack to scan all "digit + repeat digit" pairs, which is a bad idea both in hindsight and during when I was coding it. I had not even tried to predict Part 2 as I started probably because I wasn't awake enough, but when I had landed on the last line to print the result it struck me. Oh damn... I'm going to have to rewrite this.

The answer was correct. Let's move on!

g=gets.chomp
h=[]
scan(/(\d)(?=\1)/){|x|h<<$1.to_i}
h<<$1.to_i if g[/^(.).+\1$/]
p h.inject(:+)

Notes: /(\d)(?=\1)/ - Regex of two consecutive characters (in group $1)
/^(.).+\1$/ - First and last characters
inject(:+) - Because .sum was not in my version

I was panicking. The task was trivial but the pressure struck me because I'm fairly sure committing any mistake will be fatal to my chances ot making it to the top 100 (mark for scoring points, experience from 2016 Aoc) since I'm already taking too much time. I accidentally deleted the "print output" line as well. In the end I coded it just fine but in hindsight I put way too many whitespace characters and had to retype the print line.

g=gets.chomp
h=[]
s= ~/$/
g=g.chars.map &:to_i
g.zip(g[s/2,9999]+g[0,s/2]){|x,y|
h << x if x==y}
p h.inject(:+)

Notes: ~/$/ - shorthand for $_=~/$/
.chars - needed for have an Enumerable

      -------Part 1--------   -------Part 2--------
Day       Time  Rank  Score       Time  Rank  Score
  1   00:03:12    64     37   00:06:25   110      0
-- Advent of Code day 1: #87

Missed my spot for part 2... Ah, whatever. Let's fix some of those problems I was having. Wait, I need a ruby package manager to install ruby?

After updating ruby and spending some time practicing simple problems (like finding max / min elements from a list, sorting elements except those with a value of -1, etc) it was about time for day 2 to start. I spammed the second row of the grid as the timer dropped to zero.

Day 2: Lack of awareness

OwO What's This? Max and min values? Thank me later.

p$<.map{|x|v=x.split.map &:to_i
v.max-v.min}.sum

Thanks me. Part 2 is not so hot though. Strategy was straightforward but implementing it was not. Operator presedence for % is weird and stuff like that. There's also no quick method for checking if a number is a factor of another (damn, if only there are shorthand functions for that like "gcd" but for "gcd_self"). Got it done. Incorrect answer. Wait, what?

This is what I had:

Every row of ints
Descend sort match with asc sort
Find the first matched pair

Oh, I have no idea. Let's try flipping stuff around. Let's try assigning different things. Let's print everything and figure out where we're stuck. I figured out where I was stuck but I had no idea why.

After brutally debugging for 15 minutes, it was because I was dividing a number by itself, so it was throwing out 1 for most of the rows. This is the result of that battlefield (key: x!=y):

p$<.map{|x|l=x.split.map &:to_i
l.sort!
p l
v=0
m=l.reverse.find{|x|l.any?{|y|#next if
v=y
 x!=y &&(y%x<1)}}
v/m
}.sum

      -------Part 1--------   -------Part 2--------
Day       Time  Rank  Score       Time  Rank  Score
  2   00:01:04     7     94   00:18:12   571      0
  1   00:03:12    64     37   00:06:25   110      0
-- Advent of Code day 2: #57

As I finished, I wonder... How do the tournament leaders get their submission so fast (sub-10!! seconds it seems!)? Maybe they have automated the process for downloading the input unlike me who copy-pastes it. I started reading r/AdventOfCode for ideas and participated in a few discussions.

Pack leader (the top guy who had a clean perfect score streak) wrote on the subreddit about his strategy. His analysis was on-point as perfect: Write simple-to-implement algorithms, and make sure to write correct (eliminate debugging by perfection) code. Also, he had prepared some of his code ahead of time. This was inspiring.

Unfortunately I don't have the experience to say I could make use of that advice, just that it was a fun idea to think about. I made a bash script to download the input file just in time. I even got a bit of spare time to test the script. It works, yay! I even added a feature to retry after 1 second until the response is not 404, so I can run it ~3 seconds before the gate opens and not worry about it. I'm not positive however, that I'll be able to match up any further.

It's not easy to fight against prepared fighters with nothing. Battle plan: 1. Try to strike part 1 with my typing speed. 2. Try to keep my head clear for part 2 because I've not had much luck with the first two days just due to the lack of awareness and experience. Minutes are costly and there's only one test case unlike the format I'm used to, where you can compare expected results with a lot of test cases after every failure.

I got my setup set up and took a shower just before day 3 opened.

Day 3: Lack of any maths knowledge

Maths, my biggest nemesis! How dare you get into my way! Oh well, let's go step by step, probably most people would be stuck as well so let's no stress! Wait, are those square numbers?

i=gets.to_i
h=u=1
h=(u+=1)**2 while h<i
p h,u

Ok, what do we do now?

I actually haven't any clue.

Hey, let's try finding the grid relative to the border.

l=v=h-i

Wait, these squares are of odd numbers only.

h=(u+=2)**2 while h<i

So how far are we from the center again?

l=v=h-i

No that's not it. What are the four corners?

p h-i,h-i-(u+1),h-i-(u+1)*2,h-i-(u+1)*3
p h,h-(u+1),h-(u+1)*2,h-(u+1)*3

After 7!!! invalid guesses (most of which have a penalty of 5 minutes wait time) and more invalid code (yes, the factorial sign is there to amplify the minutes which felt like forever and next to no clue on what the maths are (I had drawn out a real picture, on a newspaper, in real, it looks so horrible someone in the room might yell "THE PYRAMIDS ARE COLLAPSING FROM THE PRESENCE OF THIS EVIL CHARM" and everyone would actually believe it and attempt to strangle me to death, if anyone was around.)

I wrote code to generate the spiral. It's been long after the leaderboard was filled. I chat with my friends, who seemed to have tackled the problem just fine. He talked about some stuff like complex numbers which I don't know about. There's no way I'd had known that, I don't know maths. I read the solution megathread, people apparently looked up the sequence on OEIS. I hate OEIS with a passion before this already, now I hate them even more.

Part 2 was expanding how I fill the numbers in the spiral. I did not know what I was doing at the start, during, and after I finished my code, but I divided the problem for exactly the stage I worked on:

If we're filling to the right, look at last value downwards + right-most values of the 3 rows we care about, ignore out-of-range
If we're filling to the top, look at 3 values of the first row that we care about, ignore out-of-range oh and also consider the last value to the right
etc.

It was fun. You can find my code here. https://github.com/Unihedro/workout/blob/master/adventofcode2017

      -------Part 1--------   -------Part 2--------
Day       Time  Rank  Score       Time  Rank  Score
  3   00:44:45   781      0   01:49:55   883      0
  2   00:01:04     7     94   00:18:12   571      0
  1   00:03:12    64     37   00:06:25   110      0
-- Advent of Code day 3: #83

Oh, I didn't quite get punished for that, since I'm still on the leaderboards. I deserved to get kicked out honestly, that was very bad performance!

I think I'll try to film myself tomorrow. I find the camera our family used to use which was buried in a dusty bag - and, conveniently for the plot, was just next to the charger so I don't have to worry about getting it on - and I check the docs for my computer's recording software.

terminal 1 ready: bash getinput.sh
terminal 2 ready: ruby day3 input
terminal 3 active: kazam recording
terminal 4 ready: text editor open to write day3 code (not vim this time to make it easy to switch to a "debug input" file)

Day 4: Lack of... stakes?

Well, this was easy. The hardest part was believing that it was easy! I copy-pasted the relevant line of instructions into my code and read it while I was coding because I thought I might have made a mistake and there was a catch that I wasn't seeing. Thankfully I've read the line just in time as I finished my code. I also made a typo near the end (unqi) from stress but it was not bad enough to get me in trouble. Here it is: (Note, to run code that has lines to be truncated above the shebang like this snippet, run with ruby -x)

To ensure security, a valid passphrase must contain no duplicate words.

#!ruby
p $<.count{|x|v=x.split
v.uniq==v}

Through the gates, here we are at part 2! Oh, what? FINISH HIM!

To ensure security, a valid passphrase must contain no duplicate words.

For added security, yet another system policy has been put in place. Now, a valid passphrase must contain no two words that are anagrams of each other - that is, a passphrase is invalid if any words letters can be rearranged to form any other word in the passphrase.

For example:

abcde fghij is a valid passphrase.
abcde xyz ecdab is not valid - the letters from the third word can be rearranged to form the first word.
a ab abc abd abf abj is a valid passphrase, because all letters need to be used when forming another word.
iiii oiii ooii oooi oooo is valid.
oiii ioii iioi iiio is not valid - any of these words can be rearranged to form any other word.

#!ruby
p $<.count{|x|v=x.split
v=v.map!{|x|x.chars.sort*''}
v.uniq==v}

Notes: map! is a destructive operation, so it modifies the original array. There's no reason to, then, still use v=; if you're writing some code like this, PLEASE use either v=[v.map] or v.map!

This one was so easy it feels like quite a joke. I'll take it!

      -------Part 1--------   -------Part 2--------
Day       Time  Rank  Score       Time  Rank  Score
  4   00:00:51     8     93   00:01:29     4     97
  3   00:44:45   781      0   01:49:55   883      0
  2   00:01:04     7     94   00:18:12   571      0
-- Advent of Code day 4: 32
