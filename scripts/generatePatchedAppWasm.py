import argparse
import sys
import re

parser = argparse.ArgumentParser()
parser.add_argument("-w", help="app.wat file path", required=True)
parser.add_argument("-i" ,help="inject.wat file path", required=True)
parser.add_argument("-f" ,help="index.html file path", required=True)
parser.add_argument("-o1" ,help="app.wat.patched file path", required=True)
parser.add_argument("-o2" ,help="index.html.patched file path", required=True)
# python3 scripts/generatePatchedAppWasm.py -w mitmoverride/app.wat -f mitmoverride/index.html -i inject/inject.wat -o1 mitmoverride/app.wat.patched -o2 mitmoverride/index.html.patched
args = parser.parse_args()

index_html_content = ""
with open(args.f) as f: index_html_content = f.read()

index_import_injects = [('import_js_debug', """(a)=>{
                         console.log("hi there?");
                         },\n"""),]

index_html_patched = []

started = False
index_html_import_counter = 0

def get_import_inject_index(importInjectCode):
    counter = 0 
    for item in index_import_injects:
        if item[0] == importInjectCode:
            return counter + index_html_import_counter
        counter = counter+1
    
    print("fix me", file=sys.stderr)
    exit(1)
    return None

for line in index_html_content.split("\n"):
    if line.startswith("            ["):
        started = True
    if started and line.startswith("            ],"):
        started = False
        index_html_patched.append(index_import_injects[0][1])

    if started and line[:len("              (")] == "              (":
        index_html_import_counter = index_html_import_counter+1
    
    index_html_patched.append(line)

index_html_patched = "\n".join(index_html_patched)
with open(args.o2, "w") as f: f.write(index_html_patched)

print(index_html_patched,index_html_import_counter)

# exit()

# class WatFunction:
#     def __init__(self):
#         self.func_num
#         self.param_type
#         self.instructions

class WatStuff:
    def __init__(self, wat_content, debug=True):
        self.imports = {}
        self.import_strings = {}
        self.exports = {}
        self.types = {}
        self.func_bodies = {}
        self.func_param_types = {}

        in_func_body = False
        func_current_name = ""
        func_body = []
        # func_locals = []

        for line in wat_content.split("\n"):
            if in_func_body:
                func_body.append(line)
                if line[-1] == ')':
                    lparens = 0
                    rparens = 0
                    for c in line:
                        if c == '(': lparens = lparens+1
                        if c == ')': rparens = rparens+1
                    if rparens == 1 + lparens: # we hit the closing parens from the func
                        func_body[-1] = func_body[-1][0:-1] + '\n' # remove closing parens
                        if debug: print("added func", func_current_name, len(func_body))
                        self.func_bodies[int(func_current_name)] = "\n".join(func_body)
                        in_func_body = False
                        func_body = []
                        continue
                    else:
                        continue
                else:
                    continue

            if "(import \"env\"" in line: #  (import "env" "js_debug" (func (;0;) (type 0)))
                num_semicolon_str = line[line.find('(;')+2:line.find(";)")]
                import_func_num = int(num_semicolon_str)
                import_func_name = line[line.find("import \"env\" \"")+14:line.find("\" (func")]
                self.imports[import_func_name] = import_func_num
                self.import_strings[import_func_name] = line
                if debug: print("import",import_func_name, import_func_num,line)
                continue

            if "  (export \"" in line and "func" in line:#  (export "inject_into_all_func_top_part" (func 2))
                func_name = line[line.find(' "')+2:line.find('" ')]
                func_num = int(line[line.find("(func ")+6:line.find("))")])
                self.exports[func_name] = func_num
                if debug: print("export",func_name, func_num)
                continue

            if "  (type (;" in line:#  (type (;2;) (func (param i32 i32 i32)))
                num_semicolon_str = line[line.find('(;')+2:line.find(";)")]
                type_num = int(num_semicolon_str)
                type_param_str = line[line.find(";) (")+3:len(line)-1]
                self.types[type_num] = type_param_str
                if debug: print("type",type_param_str, type_num)
                continue

            if "  (func (;" in line:#  (func (;4;) (type 2) (param i32 i32 i32)
                func_current_name = line[line.find('(;')+2:line.find(";)")]
                func_body = []
                func_param = re.search(r"\(type ([0-9]*)\)",line).group(1)
                if debug: print(func_current_name,func_param)
                self.func_param_types[func_current_name] = func_param

                if line.endswith("))"):
                    func_body = "\n"
                    self.func_bodies[int(func_current_name)] = func_body
                    if debug: print("added func", func_current_name, len(func_body))
                    in_func_body = False
                else:
                    func_body = []
                    in_func_body = True

                continue

inject_wat_content = ""
with open(args.i) as f: inject_wat_content = f.read()

inject_wat_stuff = WatStuff(inject_wat_content)
print(f"{inject_wat_stuff.exports}\n{inject_wat_stuff.imports}\n{inject_wat_stuff.import_strings}\n{inject_wat_stuff.types}\n{inject_wat_stuff.func_bodies}")

# exit()

app_wat_content = ""
with open(args.w) as f: app_wat_content = f.read()

app_wat_stuff = WatStuff(app_wat_content, debug=False)
# print(f"{app_wat_stuff.exports}{app_wat_stuff.imports}{app_wat_stuff.types}")

inject_function_jobs = {}
for (export_name, func_num) in inject_wat_stuff.exports.items():
    if export_name == "inject_func_all":
        inject_body = inject_wat_stuff.func_bodies[func_num]
        inject_body = inject_body.replace("local.get 0", "FUNC_NUM_CONST_INSTR")
        for func_num in app_wat_stuff.func_bodies.keys():
            inject_function_jobs[func_num] = inject_body

# print(inject_function_jobs[196])
app_wat_patched = ["",""]
on_func = -1
seen_first_func = False
for line in app_wat_content.split("\n"):
    before0_is_local = line.startswith("    (local ")
    before0_is_import = "import" in line

    before1_is_module = app_wat_patched[-1].startswith("(module")
    before1_is_local = app_wat_patched[-1].startswith("    (local ")
    before1_is_func = app_wat_patched[-1].startswith("  (func (;")
    before1_is_import = "import" in app_wat_patched[-1]

    before2_is_func = app_wat_patched[-2].startswith("  (func (;")

    if line.startswith("  (func (;"):
        on_func = int(line[line.find('(;')+2:line.find(";)")])
        # seen_first_func = True
    elif line.startswith("  (start "):
        print("WAT")
        # inject imports here
        for (inject_func_name, inject_func_num) in inject_wat_stuff.imports.items():
            if inject_func_name.startswith("import"):
                import_string = inject_wat_stuff.import_strings[inject_func_name]
                import_string = import_string.replace("\"env\" \"import_js_debug\"", f"\"0\" \"{get_import_inject_index(inject_func_name)}\"")
                import_string = import_string.replace(f"(func (;{inject_func_num};)", f"(func ${inject_func_name}")
                app_wat_patched.append(import_string)
    elif (before1_is_local and before2_is_func) or (not before0_is_local and before1_is_func):
        if on_func in inject_function_jobs and on_func==196:
            inject_code = inject_function_jobs[on_func]
            inject_code = inject_code.replace("FUNC_NUM_CONST_INSTR", f"i32.const {on_func}")
            for (inject_func_name, inject_func_num) in inject_wat_stuff.imports.items():
                if inject_func_name.startswith("import"):
                    inject_code = inject_code.replace(f"call {inject_func_num} ", f"call ${inject_func_name} ")
                    inject_code = inject_code.replace(f"call {inject_func_num})", f"call ${inject_func_name})")
                    inject_code = inject_code.replace(f"call {inject_func_num}\n", f"call ${inject_func_name}\n")
                elif inject_func_name == "special_clear_locals":
                    pass #TODO inject code that clears all the locals...
            app_wat_patched.append(inject_code)
            # print(app_wat_patched)

    if before0_is_import:
        last_is_import = True

    app_wat_patched.append(line)

app_wat_patched = "\n".join(app_wat_patched)
with open(args.o1, "w") as f: f.write(app_wat_patched)