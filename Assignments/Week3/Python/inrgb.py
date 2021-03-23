import numpy as np
from cv2 import cv2 

img = cv2.imread('160929914_244169167435575_598802174988431323_n.jpg')

f1 = open('Red.txt','w')
f2 = open('Green.txt','w')
f3 = open('Blue.txt','w')
f4 = open('Gray.txt','w')

def int2ft(n):
    if n.startswith('1',0)==1:
        n = n[:0] + n[(0+1):]
        k = 134
        
        
    elif n.startswith('1',1)==1:
        n = n[:0] + n[(0+1):]
        n = n[:0] + n[(0+1):]
        k = 133
        
            
    elif n.startswith('1',2)==1:
        n = n[:0] + n[(0+1):]
        n = n[:0] + n[(0+1):]
        n = n[:0] + n[(0+1):]
        k = 132

    elif n.startswith('1',3)==1:
        n = n[:0] + n[(0+1):]
        n = n[:0] + n[(0+1):]
        n = n[:0] + n[(0+1):]
        n = n[:0] + n[(0+1):]
        k = 131

    elif n.startswith('1',4)==1:
        n = n[:0] + n[(0+1):]
        n = n[:0] + n[(0+1):]
        n = n[:0] + n[(0+1):]
        n = n[:0] + n[(0+1):]
        n = n[:0] + n[(0+1):]
        k = 130
        
    elif n.startswith('1',5)==1:
        n = n[:0] + n[(0+1):]
        n = n[:0] + n[(0+1):]
        n = n[:0] + n[(0+1):]
        n = n[:0] + n[(0+1):]
        n = n[:0] + n[(0+1):]
        n = n[:0] + n[(0+1):]
        k = 129
            
    elif n.startswith('1',6)==1:
        n = n[:0] + n[(0+1):]
        n = n[:0] + n[(0+1):]
        n = n[:0] + n[(0+1):]
        n = n[:0] + n[(0+1):]
        n = n[:0] + n[(0+1):]
        n = n[:0] + n[(0+1):]
        n = n[:0] + n[(0+1):]
        k = 128
        
    elif n.startswith('1',7)==1:
        n = n[:0] + n[(0+1):]
        n = n[:0] + n[(0+1):]
        n = n[:0] + n[(0+1):]
        n = n[:0] + n[(0+1):]
        n = n[:0] + n[(0+1):]
        n = n[:0] + n[(0+1):]
        n = n[:0] + n[(0+1):]
        n = n[:0] + n[(0+1):]
        k = 127
    elif n.find('1') == -1:
        k = 0
    a = bin(k)[2:].zfill(8)
    b = n.ljust(23,'0')
    
    c = (a+b).zfill(32)
    return(c)

for i in range(0,img.shape[0]):
    for j in range(0,img.shape[1]):
        r = img[i,j][2]
        g = img[i,j][1]
        b = img[i,j][0] 

        gray = int(0.299*r + 0.587*g + 0.114*b)
        gray2 = str(gray)
        f4.write(gray2)
        f4.write("\n")

        a1 = bin(r)[2:].zfill(8)
        b1 = bin(g)[2:].zfill(8)
        c1 = bin(b)[2:].zfill(8)

        d = int2ft(a1)
        e = int2ft(b1)
        f = int2ft(c1)
        
        print(d,e,f)

        f1.write(d)
        f1.write("\n")

        f2.write(e)
        f2.write("\n")

        f3.write(f)
        f3.write("\n")
f1.close()
f2.close()
f3.close()
f4.close()
