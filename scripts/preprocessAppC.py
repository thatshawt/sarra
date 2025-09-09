appc = open("app.c")
contents = appc.read()
# print("contents: ",contents)
appc.close()

comment = False
contents = contents.split("\n")
for i in range(len(contents)):
    line = contents[i]
    if "wrap_w2c_app" in line:
        comment = True
    if comment:
        line = "//" + line
    if line.strip().endswith("}"):
        comment = False

    contents[i] = line

for a in contents:
    print(a)