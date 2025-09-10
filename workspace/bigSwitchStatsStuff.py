import argparse

# print(sys.argv)
# if len(sys.argv) != 2:
#     print("USAGE: python this.py fileToParse.log")
#     exit()

parser = argparse.ArgumentParser()

group1 = parser.add_mutually_exclusive_group(required=True)
group1.add_argument("-k", help="sort by key",
                    action="store_true")
group1.add_argument("-v", help="sort by value",
                    action="store_true")

group2 = parser.add_mutually_exclusive_group(required=True)
group2.add_argument("-d", help="sort descending",
                    action="store_true")
group2.add_argument("-a", help="sort ascending",
                    action="store_true")



parser.add_argument("filePath")

args = parser.parse_args()

# filePath = sys.argv[1]
file = open(args.filePath)
contents = file.read()
# print("contents: ",contents)
file.close()

total = 0
freq = {}
for line in contents.split("\n"):
    if not line.isnumeric(): continue
    num = int(line)

    if not freq.__contains__(num): freq[num] = 0
    freq[num] = freq[num]+1
    total = total + 1

#sort by value
if args.v:
    #ascneding
    if args.a:
        freq = {k: v for k, v in sorted(freq.items(), key=lambda item: item[1])}
    #desceneding
    elif args.d:
        freq = {k: v for k, v in sorted(freq.items(), key=lambda item: item[1], reverse=True)}
        # print("descernding")
elif args.k:# sort by key
    #ascneding
    if args.a:
        freq = {k: v for k, v in sorted(freq.items(), key=lambda item: item[0])}
    #desceneding
    elif args.d:
        freq = {k: v for k, v in sorted(freq.items(), key=lambda item: item[0], reverse=True)}


# print(f"total={total}")
for key in freq.keys():
    print(f"{key},{freq[key]},{freq[key]/total}")