import argparse
import sys
import re
import collections

parser = argparse.ArgumentParser()
parser.add_argument("-w", help="app.wat file path", required=True)
parser.add_argument("-i" ,help="inject.wat file path", required=True)
parser.add_argument("-f" ,help="index.html file path", required=True)
parser.add_argument("-o1" ,help="app.wat.patched file path", required=True)
parser.add_argument("-o2" ,help="index.html.patched file path", required=True)
# wasm2wat src/app.wasm -o /tmp/app.wat && cp /tmp/app.wat mitmoverride/app.wat && python3 scripts/generatePatchedAppWasm.py -w mitmoverride/app.wat -f mitmoverride/index.html -i inject/inject.wat -o1 mitmoverride/app.wat.patched -o2 mitmoverride/index.html.patched && wat2wasm mitmoverride/app.wat.patched --enable-multi-memory -o mitmoverride/app.wasm
args = parser.parse_args()

seperate_function_prefix = "_"
inject_func_prefix = "inject_"
export_function_prefix = "export_"


index_html_content = ""
with open(args.f) as f: index_html_content = f.read()

# not used rn ;-;
index_import_injects = [('import_js_debug', """(a)=>{
                         console.log("hi there?");
                         },\n"""),]

index_imports_code_mapping = {
    # 'import_e_t_get':'              (t) => e[t],',
    'import_e_t_get':'                let PARSE_NUM = 9999;',
    'import_e_t_call':'              (t) => e[t](),',
}

index_imports_name_index_mapping = {}

index_html_patched = []

started = False
index_html_import_counter = -1

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
    if started and line[:len("              (")] == "              (":
        index_html_import_counter = index_html_import_counter+1

    for (import_name, import_code) in index_imports_code_mapping.items():
        if line.startswith(import_code):
            index_imports_name_index_mapping[import_name] = str(index_html_import_counter)
            # print(line, index_html_import_counter)
    
    if line.startswith("            ["):
        started = True
    if started and line.startswith("            ],"):
        started = False
        index_html_patched.append(index_import_injects[0][1])

    
    index_html_patched.append(line)

print(f"{index_imports_code_mapping}, {index_imports_name_index_mapping}")
# exit()

if len(index_imports_code_mapping) != len(index_imports_name_index_mapping):
    print(f"didnt find all the import code mappings! {index_imports_code_mapping}, {index_imports_name_index_mapping}",file=sys.stderr)
    exit(1)

index_html_patched = "\n".join(index_html_patched)
with open(args.o2, "w") as f: f.write(index_html_patched)

# print(index_html_patched,index_html_import_counter)

# exit()

# class WatFunction:
#     def __init__(self):
#         self.func_num
#         self.param_type
#         self.instructions

class ImportThing:
    def __init__(self, name, type, num, full_string):
        self.name = name
        self.type = type
        self.num = num
        self.full_string = full_string

class TypeThing:
    def __init__(self, num, param_string, full_string):
        self.num = num
        self.param_string = param_string
        self.full_string = full_string

class FuncThing:
    def __init__(self, num, header_line, param, body):
        self.num = num
        self.param = param
        self.header_line = header_line
        self.body = body

class WatStuff:
    def getFuncByNum(self, num):
        for thing in self.funcs:
            if thing.num == num: return thing
        return None
    
    def getImportByNum(self, num):
        for thing in self.imports:
            if thing.num == num: return thing
        return None
    
    def getTypeByNum(self, num):
        for thing in self.types:
            if thing.num == num: return thing
        return None

    def __init__(self, wat_content, debug=True):
        self.imports = []
        self.exports = {}
        self.types = []
        self.funcs = []
        self.memories = []
        self.start_func_num = None

        in_func_body = False
        func_current_name = ""
        func_body = []
        func_param = None
        func_header_line = None
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
                        # self.func_bodies[int(func_current_name)] = "\n".join(func_body)
                        self.funcs.append(FuncThing(int(func_current_name), func_header_line, func_param, "\n".join(func_body)))

                        in_func_body = False
                        func_param = None
                        func_body = []
                        continue
                    else:
                        continue
                else:
                    continue
            if "  (start " in line:
                self.start_func_num = int(line[9:-1])
                # print("start is",self.start_func_num)
                # exit()
            if "  (import " in line:
                #  (import "env" "js_debug" (func (;0;) (type 0)))
                #  (import "0" "168" (func (;7;) (type 19)))
                num_semicolon_str = line[line.find('(;')+2:line.find(";)")]
                import_func_num = int(num_semicolon_str)
                import_func_name = line[line.find("\" \"")+3:line.find("\" (")]
                import_type = line[line.find("(type ")+6:line.find(")))")]
                self.imports.append(ImportThing(import_func_name, int(import_type), import_func_num, line))
                # self.import_strings[import_func_name] = line
                # self.import_types[import_func_name] = int(import_type)
                if debug: print("import",import_func_name, import_func_num,line,import_type)
                continue

            if "  (memory (;" in line:
                self.memories.append(line)

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
                # self.types[type_num] = type_param_str
                self.types.append(TypeThing(type_num, type_param_str, line))
                if debug: print("type",type_param_str, type_num)
                continue

            if "  (func (;" in line:#  (func (;4;) (type 2) (param i32 i32 i32)
                func_current_name = line[line.find('(;')+2:line.find(";)")]
                func_body = []
                func_param = re.search(r"\(type ([0-9]*)\)",line).group(1)
                if debug: print(func_current_name,func_param)
                # self.func_param_types[func_current_name] = func_param

                if line.endswith("))"):
                    func_body = "\n"
                    func_header_line = line[:-1] # remove the last ) cus yea, we dont liek that
                    if debug: print("added func", func_current_name, len(func_body))
                    self.funcs.append(FuncThing(int(func_current_name), func_header_line, func_param, "\n".join(func_body)))

                    func_param = None
                    func_body = []
                    in_func_body = False
                else:
                    func_header_line = line
                    func_body = []
                    in_func_body = True

                continue

inject_wat_content = ""
with open(args.i) as f: inject_wat_content = f.read()

inject_wat_stuff = WatStuff(inject_wat_content)
# print(f"{inject_wat_stuff.exports}\n{inject_wat_stuff.imports}\n{inject_wat_stuff.types}")

# exit()

app_wat_content = ""
with open(args.w) as f: app_wat_content = f.read()

app_wat_stuff = WatStuff(app_wat_content, debug=False)
# print(f"{app_wat_stuff.exports}\n{app_wat_stuff.imports}\n{app_wat_stuff.types}")
# exit()


seperate_function_jobs = {}
seperate_func_mapping = {}
seperate_func_counter = 1

last_app_wat_func_num = app_wat_stuff.funcs[-1].num
for inject_func in inject_wat_stuff.funcs:
    for (export_name, export_func_num) in inject_wat_stuff.exports.items():
        if export_func_num == inject_func.num and (export_name.startswith(seperate_function_prefix) or export_name.startswith(export_function_prefix)):
            seperate_func_mapping[inject_func.num] = last_app_wat_func_num + seperate_func_counter
            seperate_func_counter = seperate_func_counter + 1
    
# inject_function_jobs[funcNum] = wat code to be injected in the beginning of the funcNum function.
inject_function_jobs = {}
export_function_jobs = {}
for (export_name, export_func_num) in inject_wat_stuff.exports.items():
    def replace_instruction_with(inject_body, instruction, replacement):
        inject_body = inject_body.replace(f"{instruction} ",f"{replacement} ")
        inject_body = inject_body.replace(f"{instruction})",f"{replacement})")
        inject_body = inject_body.replace(f"{instruction}\n",f"{replacement}\n")
        return inject_body

    def fix_indexhtml_import_calls(inject_body):
        for inject_import in inject_wat_stuff.imports:
                import_name = inject_import.name
                inject_import_func_num = inject_import.num

                if import_name in index_imports_name_index_mapping:
                    import_type = inject_wat_stuff.getTypeByNum(inject_import.type).param_string
                    app_import_index = index_imports_name_index_mapping[import_name]

                    for app_import in app_wat_stuff.imports:
                        app_import_func_num = app_import.num
                        app_import_type = app_wat_stuff.getTypeByNum(app_import.type).param_string

                        if import_type == app_import_type and app_import.name == app_import_index:
                            print(f"replace 'call {inject_import_func_num}' with 'call {app_import_func_num}'")
                            inject_body = replace_instruction_with(inject_body, f"call {inject_import_func_num}", f"call {app_import_func_num}")
                    return inject_body
    def fix_seperate_func_calls(inject_body):
        for inject_func in inject_wat_stuff.funcs:
            if inject_func.num in seperate_func_mapping:
                # print(f"replace 'call {inject_func.num}' with 'call {seperate_func_mapping[inject_func.num]}'")
                inject_body = replace_instruction_with(inject_body, f"call {inject_func.num}", f"call {seperate_func_mapping[inject_func.num]}")
        return inject_body
    
    def fix_memory_instructions(inject_body):
        loads = "i32.load,i64.load,f32.load,f64.load,i32.load8_s,i32.load8_,i32.load16_s,i32.load16_u,i64.load8_s,i64.load8_u,i64.load16_s,i64.load16_u,i64.load32_s,i64.load32_u"
        for load_str in loads.split(","):
            inject_body = replace_instruction_with(inject_body, load_str, f"{load_str} (memory 1)")

        stores = "i32.store,i64.store,f32.store,f64.store,i32.store8,i32.store16,i64.store8,i64.store16,i64.store32"
        for store_str in stores.split(","):
            inject_body = replace_instruction_with(inject_body, store_str, f"{store_str} (memory 1)")

        inject_body = replace_instruction_with(inject_body,"memory.fill","memory.fill (memory 1)")
        inject_body = replace_instruction_with(inject_body,"memory.size","memory.size (memory 1)")
        inject_body = replace_instruction_with(inject_body,"memory.grow","memory.grow (memory 1)")
        inject_body = replace_instruction_with(inject_body,"memory.copy","memory.copy (memory 1)")

        return inject_body

    # has to be be after fix_memory_instructions()
    def fix_special_arras_calls(inject_body):
        for import_thing in inject_wat_stuff.imports:
            if import_thing.name.startswith("special_arras_memory_"):
                rightSection = import_thing.name.replace("special_arras_memory_","")
                rightSection = rightSection.replace("_", ".", 1)

                # print(f"replacing 'call {import_thing.num}' with '{rightSection}'")
                # inject_body = inject_body.replace(f"call {import_thing.num}", f"{rightSection}")
                inject_body = replace_instruction_with(inject_body,f"call {import_thing.num}", f"{rightSection}")

        return inject_body

    inject_body = inject_wat_stuff.getFuncByNum(export_func_num).body
    inject_body = fix_seperate_func_calls(inject_body)
    inject_body = fix_indexhtml_import_calls(inject_body)
    inject_body = fix_memory_instructions(inject_body)
    inject_body = fix_special_arras_calls(inject_body)

    if export_name.startswith(inject_func_prefix):
        target_func = export_name.replace(inject_func_prefix,"")
        if target_func == "all":
            inject_body = inject_body.replace("local.get 0", "FUNC_NUM_CONST_INSTR")
            for inject_func in app_wat_stuff.funcs:
                inject_function_jobs[inject_func.num] = inject_body
        elif target_func == "start":
            inject_function_jobs[app_wat_stuff.start_func_num] = inject_body
        else: # assume its a number :skull:
            inject_function_jobs[int(target_func)] = inject_body
    elif export_name.startswith(seperate_function_prefix):
        seperate_function_jobs[export_func_num] = inject_body
    elif export_name.startswith(export_function_prefix):
        mapped_func_num = seperate_func_mapping[export_func_num]
        export_function_jobs[mapped_func_num] = export_name
        seperate_function_jobs[export_func_num] = inject_body
        # print(f"added export_job {mapped_func_num}:{export_name}")
        # exit()

        

print(inject_function_jobs[302])
# exit()
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


    if line.startswith("  (memory (;"):
        app_wat_patched.append(line)
        app_wat_patched.append(inject_wat_stuff.memories[0])
        continue
    elif line.startswith("  (func (;"):
        on_func = int(line[line.find('(;')+2:line.find(";)")])
        # seen_first_func = True
    elif line.startswith("  (start "):
        print("found (start")
        # for inject_func in seperate_function_jobs:
        for inject_func in inject_wat_stuff.funcs:
            if inject_func.num in seperate_func_mapping:
                """
                    (func (;5;) (type 0) (param i32)
                turns into
                    (func (;5;)  (param i32)
                seperate_funcs.append(FuncThing())
                """
                func_header = inject_func.header_line
                pattern = r"(\(type [0-9]*\))"
                result = re.search(pattern, func_header)
                print(result)
                left = func_header[:result.start(1)]
                right = func_header[result.end(1):]
                # print(func_header, left + right)
                app_wat_patched.append(left+right + "\n")
                app_wat_patched.append(seperate_function_jobs[inject_func.num] + ")\n")
            
            # for (inject_func_name, inject_func_num) in inject_wat_stuff.imports.items():
            #     if inject_func_name.startswith("import"):
            #         import_string = inject_wat_stuff.import_strings[inject_func_name]
            #         import_string = import_string.replace("\"env\" \"import_js_debug\"", f"\"0\" \"{get_import_inject_index(inject_func_name)}\"")
            #         import_string = import_string.replace(f"(func (;{inject_func_num};)", f"(func ${inject_func_name}")
            #         app_wat_patched.append(import_string)
        for (export_job_func_num, export_job_func_name) in export_function_jobs.items():
            app_wat_patched.append(f"  (export \"{export_job_func_name}\" (func {export_job_func_num}))")

    elif (before1_is_local and before2_is_func) or (not before0_is_local and before1_is_func):
        if on_func in inject_function_jobs: #and on_func==513:
            inject_code = inject_function_jobs[on_func]
            def code(injecting_code):
                injecting_code = injecting_code.replace("FUNC_NUM_CONST_INSTR", f"i32.const {on_func}")
                for inject_import in inject_wat_stuff.imports:
                    inject_func_name = inject_import.name
                    inject_func_num = inject_import.num
                    if inject_func_name.startswith("import"):
                        pass
                        # injecting_code = injecting_code.replace(f"call {inject_func_num} ", f"call ${inject_func_name} ")
                        # injecting_code = injecting_code.replace(f"call {inject_func_num})", f"call ${inject_func_name})")
                        # injecting_code = injecting_code.replace(f"call {inject_func_num}\n", f"call ${inject_func_name}\n")
                    elif inject_func_name == "special_clear_locals":
                        pass #TODO inject code that clears all the locals...
                return injecting_code

            inject_code = code(inject_code)

            app_wat_patched.append(inject_code)
            # print(app_wat_patched)

    if before0_is_import:
        last_is_import = True

    app_wat_patched.append(line)

app_wat_patched = "\n".join(app_wat_patched)
with open(args.o1, "w") as f: f.write(app_wat_patched)