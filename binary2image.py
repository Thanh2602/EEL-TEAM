import numpy as np
import cv2 as cv
import struct

def bin_to_float(binary):
    return struct.unpack('!f',struct.pack('!I', int(binary, 2)))[0]

a = 206
image1 = np.zeros((a, a, 3), np.uint8)

f = open('Gray.txt','r')

pixels = []

for x in f:
    pixels.append(x)

i = 0
j = 0
k = 0

for i in range(a):
    for j in range(a):
        #print(i,j, int(pixels[k]))
        image1[i, j] = (pixels[k], pixels[k], pixels[k])
        k = k + 1

# Write image
cv.imwrite('Verilog.jpg', image)
cv.imshow('Verilog',image)
cv.waitKey()
cv.destroyAllWindows()
f.close()
