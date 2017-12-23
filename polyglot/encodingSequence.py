def encodingSequence(n, x):
    o=[]
    for i in range(n):
        o.append([3*(i+1),format(hex(3*(i+1))[2:], '>5')[::-1]])
    o = sorted(o, key=lambda x: x[1], reverse=True)
    o = map(lambda x: x[0], o)
    return o.index(x)
