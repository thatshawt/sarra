

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
        
def doDoubleStep(debug=False):
    global r
    r1 = None
    step(debug)
    r1 = r
    step(debug)
    r2 = r
    return (r1,r2)

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
            
# produces a y value that will result in the
# two r values given as input (sequence) before
# y goes to 1.
# example: 
# findSequenceFaster([628, 124]) -> 2842753.
# stepping forward from y=2842753 results in:
#   r=628, y=1749
#   r=124, y=1.
def findSequenceFaster(sequence):
    # maxY0 = (1625**2) * 2
    lowY0 = (1625**2)
    
    a = lowY0 + sequence[0]
    a = a + (1625*sequence[1])
    
    return a

desiredSequence = [628,124]
theY = findSequenceFaster(desiredSequence)
y = theY
print(y)
step(True)
step(True)

import itertools

fromOneTo811 = [i for i in range(811)]
# fromOneTo811.remove(0)

# fromOneTo811.extend(fromOneTo811)

i = 0
for (oneR, twoR) in itertools.permutations(fromOneTo811, r=2):
    # global y
    resultY = findSequenceFaster([oneR, twoR])
    y = resultY
    resultR = doDoubleStep()
    if resultR != (oneR,twoR):
        print(f"different, test({oneR},{twoR}), got{resultR}")
        break
    # print(oneR, twoR)
    
    i = i + 1
    # if i == 1000: break





    