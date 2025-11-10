

"""
if (y == 1) {
        r = n[0] + fa;
        n = n + 4;
        y = r / 1625 + 2640625;
        r = r % 1625;
    } else {
        r = y % 1625;
        y = y / 1625;
    }
"""
y = 0
r = 0
def step(debug=False):
    global y,r
    if y == 1:
        print("hit y==1")
    else:
        r = y % 1625
        y = y // 1625
        if debug: print(f"r={r}, y={y}")
        

def findYThatResultsInDesiredSequence(desiredSeq):
    global y,r
    maxY0 = (1625**2) * 2
    lowY0 = (1625**2)
    maxY1 = (1625) * 2
    lowY1 = (1625)
    currentY = maxY0
    # for i in range(len(desiredSequence)):
    bestY = -1
    foundFirstROptimize = False
    while True:
        if foundFirstROptimize:
            # changing y by multiples of 1625 will
            # only change the second r
            currentY = currentY - 1625
        else:
            currentY = currentY - 1
        y = currentY
        step()
        firstR = r
        step()
        secondR = r
        if firstR == desiredSequence[0]:
            foundFirstROptimize = True
            # print(firstR,secondR)
        else:
            # print(firstR)
            # currentY = currentY - (abs(firstR - desiredSequence[0])) + 10
            pass
        
        print(firstR,secondR)
        
        if firstR == desiredSequence[0] and secondR == desiredSequence[1]:
            # print("found first one")
            return currentY
        if currentY < lowY0:
            # print("didnt find first one?")
            return -1
            
def findSequenceFaster(sequence):
    maxY0 = (1625**2) * 2
    lowY0 = (1625**2)
    
    maxY0 = lowY0 + sequence[0]
    maxY0 = maxY0 + (1625*sequence[1])
    
    return maxY0

desiredSequence = [628,124]
theY = findSequenceFaster(desiredSequence)
y = theY
print(y)
step(True)
step(True)
    
    