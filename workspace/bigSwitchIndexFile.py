import argparse


# thisfile.py -i ./arras.io-1757563887084.log.2again -d ../src/app.decomp -b  -l L_b

parser = argparse.ArgumentParser()
parser.add_argument("-i", help="big switch index file")
parser.add_argument("-d", help="app.decomp file path")
parser.add_argument("-b" ,help="branch statement locator")
parser.add_argument("-l" ,help="loop label above branch locator")

args = parser.parse_args()

