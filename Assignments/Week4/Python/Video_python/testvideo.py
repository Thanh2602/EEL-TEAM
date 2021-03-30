import cv2 

vidcap = cv2.VideoCapture('youtube.mp4')
success , image = vidcap.read()
count = 0
success = True
sec = 0
frameRate = 0.5 # Change this number to 1 for each 1 second

def getFrame(sec):
        vidcap.set(cv2.CAP_PROP_POS_MSEC,sec*1000)
        hasFrames,image = vidcap.read()
        if hasFrames:
            cv2.imwrite("frame%d.jpg" % count,image) # Save frame as JPG file
        return hasFrames
    
    
success = getFrame(sec)
while success:
    count = count + 1
    sec = sec + frameRate
    sec = round(sec, 2)
    success = getFrame(sec)


#while success:
 #   cv2.imwrite("frame%d.jpg" % count,image)
 #   success,image = vidcap.read()
  #  print ('Read a new frame : " ',success)
   # count += 1