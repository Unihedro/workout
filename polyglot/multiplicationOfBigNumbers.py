def multiplicationOfBigNumbers(b, x, y):
    a=c=0
    for i in x:
        a=a*b+i
    for i in y:
        c=c*b+i
    return [a,c]
    a*=c
    v=[]
    while a>0:
        v.append(a%b)
        a=a//b
    return v[::-1];
