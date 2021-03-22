import struct
import numpy as np
import cv2 as cv



a = 206
image1 = np.zeros((a, a, 3), np.uint8)
image2 = np.zeros((a, a, 3), np.uint8)

def bin_to_float(binary):
    return struct.unpack('!f', struct.pack('!I', int(binary, 2)))[0]

f1 = open('Verilog.txt', 'r')
f2 = open('Gray.txt','r')
Compare = open('Compare.txt','w')

pixelsverilog = []
pixelspython = []
max = 0

for x1 in f1:
    pixelsverilog.append(int(bin_to_float(x1)))
for x2 in f2:
    pixelspython.append(int(x2))

i = 0
j = 0
k = 0

for i in range(a):
    for j in range(a):
        image1[i, j] = (pixelsverilog[k], pixelsverilog[k], pixelsverilog[k])
        image2[i, j] = (pixelspython[k], pixelspython[k], pixelspython[k])
        Compare.write(str(abs(pixelsverilog[k]-pixelspython[k])))
        Compare.write("\n")
        if ((abs(pixelsverilog[k]-pixelspython[k]) > max )):
            max = abs(pixelsverilog[k]-pixelspython[k])
        k = k + 1



print('Sai so lon nhat la:',max)
cv.imwrite('Verilog.jpg', image1)
cv.imshow('Verilog',image1)
cv.imwrite('Python.jpg', image2)
cv.imshow('Python',image2)
cv.waitKey()
cv.destroyAllWindows()
f1.close()
f2.close()