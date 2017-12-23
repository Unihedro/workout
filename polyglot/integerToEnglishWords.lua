local dtou={[1]="One",[2]="Two",[3]="Three",[4]="Four",[5]="Five",[6]="Six",[7]="Seven",[8]="Eight",[9]="Nine"}
local stuq={[10]="Ten",[11]="Eleven",[12]="Twelve",[13]="Thirteen",[14]="Fourteen",[15]="Fifteen",[16]="Sixteen",[17]="Seventeen",[18]="Eighteen",[19]="Nineteen"}
local dtot={[2]="Twenty",[3]="Thirty",[4]="Forty",[5]="Fifty",[6]="Sixty",[7]="Seventy",[8]="Eighty",[9]="Ninety"}
local alen={[1]="Thousand",[2]="Million",[3]="Billion"}
function fa(x)
  local s=" "
  if x>99 then s=" "..dtou[math.floor(x/100)].." Hundred "end
  x=x%100
  if stuq[x]then return s..stuq[x].." "
  elseif x>9 then s=s..dtot[math.floor(x/10)].." "
  end
  x=x%10
  if x>0 then s=s..dtou[x].." "end
  return s
end
function integerToEnglishWords(x)
  if x==0 then return"Zero"end
  local s=""
  local i=0
  while x>0 do
    v=fa(x%1000)
    if(not (v==" "))and(i>0)then v=v..alen[i].." "end
    i=i+1
    s=v..s
    x=math.floor(x/1000)
  end
  return string.gsub(string.gsub(s,"%s+"," "),"^%s*(.-)%s*$","%1")
end
