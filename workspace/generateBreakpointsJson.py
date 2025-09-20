import argparse
import sys
import re

# python3 generateBreakpointsJson.py -v ../src/app.watv -c ../src/app.section.code

parser = argparse.ArgumentParser()
parser.add_argument("-v", help="app.watv file path", required=True)
parser.add_argument("-c" ,help="app.section.code file path", required=True)

args = parser.parse_args()

code_section_lines = ""
with open(args.c) as f: code_section_lines = f.read()
code_section_lines = code_section_lines.split("\n")

func_offset_number = 0
# get the first function so i can get that juicy offset number
for line in code_section_lines:
    #  - func[
    if " - func[" in line:
        func_offset_number = int(line[line.find('[')+1:line.find(']')])
        break

breakpoints = {}
with open(args.v) as f:
    line = f.readline()
    while line:
        if "; function body" in line:
            # print(line)
            func_num = int(line.strip().split(' ')[-1]) + func_offset_number
            #breakpoints[func_num] = "hi there"
            f.readline()
            line = f.readline()
            if "local decl count" not in line:
                print(line)
                print("fix me?, local decl count",file=sys.stderr)
                exit(1)
            line = line.replace("; local decl count", "").strip()
            num_skip_thing = line.split(" ")[1]
            if len(num_skip_thing) != 2:
                print(line)
                print("fix me, len(num_skip_thing) != 2:",file=sys.stderr)
                exit(1)
            num_skip_thing = int(num_skip_thing, 16)*2
            for _ in range(num_skip_thing):
                line = f.readline()
                # print(f"skipped {line}")


            count = 0
            # line = f.readline()
            memory = [('',''),('',''),('','')]
            while True:
                line = f.readline()

                memory_loc = int(line.split(":")[0], 16)
                comment_code = line.strip().split(";")[-1].strip()
                memory.append((memory_loc, comment_code))
                # print(memory_loc,comment_code)

                has_these_keywords = "^((br_if)|(end)|(call)|(call_indirect)|(br)|(drop)|(select))$"
                has_a_dot_not_on_the_ends = r"^.+\..+$"
                if re.search(has_these_keywords ,comment_code) != None or re.search(has_a_dot_not_on_the_ends, memory[-2][1]) != None:
                    # print(f"did it {func_num}={memory_loc}")
                    breakpoints[func_num] = memory_loc
                    break

                if re.search("^((block)|(void)|(local index)|(load offset)|(i.. literal)|(alignment)|(break depth)|(i32)|(i64)|(f32)|(f64)|(store offset)|(if)|(loop))$",comment_code) != None:
                    # print("skipped", comment_code)
                    continue

                # print(f"{count},'{line}','{comment_code}'")
                if count > 4:
                    print(line)
                    print("woops",file=sys.stderr)
                    exit(1)
                count = count+1
            # break

        line = f.readline()

print(breakpoints)