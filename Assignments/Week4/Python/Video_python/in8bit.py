import numpy as np
from cv2 import cv2 

hinhso = 10

img_bandau = cv2.imread('frame%d.jpg'%hinhso)

f1 = open('Red%d.txt'%hinhso ,'w')
f2 = open('Green%d.txt'%hinhso,'w')
f3 = open('Blue%d.txt'%hinhso,'w')
f4 = open('Gray%d.txt'%hinhso,'w')

new_width = 206
new_height = 206

img = cv2.resize(img_bandau, (new_width,new_height))

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

      
        
        print(a1,b1,c1)

        f1.write(a1)
        f1.write("\n")

        f2.write(b1)
        f2.write("\n")

        f3.write(c1)
        f3.write("\n")
f1.close()
f2.close()
f3.close()
f4.close()
