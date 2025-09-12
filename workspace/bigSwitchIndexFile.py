import argparse
import sys

# thisfile.py -i ./arras.io-1757563887084.log.2again -d ../src/app.decomp -c ../src/app.section.code

parser = argparse.ArgumentParser()
parser.add_argument("-i", help="big switch index file path", required=True)
parser.add_argument("-n" ,help="number of lines to grab from app.decomp", required=True)
parser.add_argument("-d", help="app.decomp file path", required=True)
parser.add_argument("-c" ,help="app.section.code file path", required=True)
# parser.add_argument("-l" ,help="loop label above branch locator")

args = parser.parse_args()


code_section_lines = ""
with open(args.c) as f: code_section_lines = f.read()
code_section_lines = code_section_lines.split("\n")

# get largest function from the app.section.code
max_size = -1
max_line = ""
for line in code_section_lines:
    line = line.strip()
    if "size=" in line:
        numeric_part = line.split("size=")[1]
        if numeric_part.isnumeric():
            size = int(numeric_part)
            if size >= max_size:
                max_size = size
                max_line = line

# print(max_line)

largest_func_name = max_line[max_line.find("[")+1:max_line.find("]")]

# print(largest_func_name)



# create index->branch mapping from app.decomp

# look for f"// func{largest_func_name}"
large_func_pos = -1
with open(args.d) as f:
    line = f.readline()
    while line:
        if f"// func{largest_func_name}" in line:
            large_func_pos = f.tell()# - len(line)
            break
        line = f.readline()


# find the end pos of the large_func.
# we find this by finding the matching opening curly brace.
large_func_end_pos = -1
with open(args.d) as f:
    counter = 1 # offset by 1 to mean that we consumed the beginning {
    f.seek(large_func_pos)
    line = f.readline()
    while line:
        for c in line:
            if c == "{": counter = counter + 1
            elif c == "}": counter = counter - 1
        if counter == 0:
            large_func_end_pos = f.tell()
            break
        line = f.readline()

line_counter = 0
MAX_LINES_NO_BRANCH = 500
index_branch_mapping = []
branch_table_pos = -1
with open(args.d) as f:
    f.seek(large_func_pos)
    line = f.readline()
    while line:
        line_counter = line_counter + 1
        if line_counter > MAX_LINES_NO_BRANCH:
            print(f"could not find branch table after {MAX_LINES_NO_BRANCH} lines.",
                file=sys.stderr)
            exit(1)

        line = line.strip()
        if line.startswith("br_table[") and line.endswith("](") and len(line) > 100:
            # found the branch table
            # br_table[B_cb, B_kh, B_... B_av, B_of, ..L_b](
            index_branch_mapping = line[line.find("[")+1:line.find("]")].replace("..","").split(",")

            branch_table_pos = f.tell()
            break

        line = f.readline()
# print(index_branch_mapping[0])

# loop L_b {
# label B_wea:

indexes = [747, 123, 0]
# TODO: grab this from args.i file



