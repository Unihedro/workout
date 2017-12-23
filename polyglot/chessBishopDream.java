// from stack overflow
int[] chessBishopDream(int[] s, int[] xy, int[] dir, int k) {
int k1;
for (int i = 0; i< 2; i++) {        
    if (dir[i] > 0)
        k1 = k - 2*s[i] + xy[i];
    else 
        k1 = k - (xy[i] + 1);
    k1 = k1 % (2*s[i]);
    xy[i] = k1 % s[i];
    System.out.println(xy[i]);
    System.out.println(k1);
    if (k1 >= s[i])
        xy[i] = k1 - 2 * xy[i] - 1;
    xy[i] %= s[i];
}
return xy;
}
