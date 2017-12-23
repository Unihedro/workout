int alarmClock(char * setTime, char * timeToSet) {
int i = (setTime[0]-'0')*10+(setTime[1]-'0');
int j = (setTime[3]-'0')*10+(setTime[4]-'0');
int k = (timeToSet[0]-'0')*10+(timeToSet[1]-'0');
int l = (timeToSet[3]-'0')*10+(timeToSet[4]-'0');
int m = i-k;
if(m<0)m=-m;
int n = (24-i)+k;
if(n<0)n=-n;
if(n<m)m=n;
int o = j-l;
if(o<0)o=-o;
n = (60-j)+l;
if(n<0)n=-n;
if(n<o)o=n;
return m+o;
}
