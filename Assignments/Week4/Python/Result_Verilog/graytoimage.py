import struct
import numpy as np
import cv2 as cv

hinhso = 10

a = 206
image2 = np.zeros((a, a, 3), np.uint8)


f2 = open('Gray%d.txt'%hinhso,'r')

pixelspython = []



for x2 in f2:
    pixelspython.append((x2))

i = 0
j = 0
k = 0

for i in range(a):
    for j in range(a):
        image2[i, j] = (pixelspython[k], pixelspython[k], pixelspython[k])
        k = k + 1



cv.imwrite('Frame%d.jpg'%hinhso, image2)
cv.waitKey()
cv.destroyAllWindows()
f2.close()