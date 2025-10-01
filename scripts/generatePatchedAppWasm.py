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
# wasm2wat src/app.wasm -o /tmp/app.wat && python3 scripts/generatePatchedAppWasm.py -w /tmp/app.wat -f mitmoverride/index.html -i inject/inject.wat -o1 mitmoverride/app.wat.patched -o2 mitmoverride/index.html.patched && wat2wasm mitmoverride/app.wat.patched --enable-multi-memory -o mitmoverride/app.wasm
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

# print(f"{index_imports_code_mapping}, {index_imports_name_index_mapping}")
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
        # self.params = header_line
        # print(header_line)
        # exit()

class WatStuff:
    def getFuncByName(self, name):
        if not name in self.funcNameMap: return None
        funcNum = self.funcNameMap[name]
        return self.getFuncByNum(funcNum)

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

    def _calculate_largest_func(self):
        largestFunc = [-1,-1]
        for funcThing in self.funcs:
            if len(funcThing.body) > largestFunc[1]:
                largestFunc[0] = funcThing.num
                largestFunc[1] = len(funcThing.body)
        self.largestFuncNum = largestFunc[0]

    def __init__(self, wat_content, debug=False):
        self.imports = []
        self.exports = {}
        self.types = []
        self.funcs = []
        self.memories = []
        self.globals = []
        self.dataLines = []
        self.start_func_num = None

        self.funcNameMap = {}

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
                        # print(f"params: {func_param}")
                        # exit()

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

            if "  (data (;0;)" in line:
                if line.endswith("))"):
                    self.dataLines.append(line[:-1])
                else:
                    self.dataLines.append(line)
            
            if "  (global (" in line:
                self.globals.append(line)

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
        
        self._calculate_largest_func()

        for (export_name, export_num) in self.exports.items():
            self.funcNameMap[export_name] = export_num

        counts = {}
        for (export_name, export_num) in self.exports.items():
            if export_num in counts:
                counts[export_num] = counts[export_num] + 1
            else:
                counts[export_num] = 1

        for (func_num, count) in counts.items():
            if count > 1:
                print(f"WARNING: more than one export point to the same function {func_num}", file=sys.stderr)

inject_wat_content = ""
with open(args.i) as f: inject_wat_content = f.read()

inject_wat_stuff = WatStuff(inject_wat_content)
# print(f"{inject_wat_stuff.exports}\n{inject_wat_stuff.imports}\n{inject_wat_stuff.types}")

app_wat_content = ""
with open(args.w) as f: app_wat_content = f.read()

app_wat_stuff = WatStuff(app_wat_content, debug=False)
# print(f"{app_wat_stuff.exports}\n{app_wat_stuff.imports}\n{app_wat_stuff.types}")
# exit()

# print(f"largest func in appwat: {app_wat_stuff.largestFuncNum}")
# exit(1)

seperate_function_jobs = {}
seperate_func_mapping = {}
seperate_func_counter = 1

last_app_wat_func_num = app_wat_stuff.funcs[-1].num
for inject_func in inject_wat_stuff.funcs:
    for (export_name, export_func_num) in inject_wat_stuff.exports.items():
        if export_func_num == inject_func.num and (export_name.startswith(seperate_function_prefix) or export_name.startswith(export_function_prefix)):
            if inject_func.num in seperate_func_mapping:
                print(f"error: does not support multiple symbols pointing to the same func definition", file=sys.stderr)
                print(f"{inject_func.num} is the offending function", file=sys.stderr)
                exit(1)
                # print(f"wat da hiel {export_name},{inject_func.num},{seperate_func_mapping}")
            seperate_func_mapping[inject_func.num] = last_app_wat_func_num + seperate_func_counter
            seperate_func_counter = seperate_func_counter + 1


# print(f"{len(seperate_func_mapping)},{seperate_func_mapping}")
# inject_function_jobs[funcNum] = wat code to be injected in the beginning of the funcNum function.
inject_function_jobs = {}
export_function_jobs = {}
bigfunc_beforebranch_job = ""

def replace_instruction_with(inject_body, instruction, replacement):
    inject_body = inject_body.replace(f"{instruction} ",f"{replacement} ")
    inject_body = inject_body.replace(f"{instruction})",f"{replacement})")
    inject_body = inject_body.replace(f"{instruction}\n",f"{replacement}\n")
    return inject_body

for (export_name, export_func_num) in inject_wat_stuff.exports.items():

    # dont call this on the same code twice :skull:
    def fix_globals(inject_body):
        for i in range(len(inject_wat_stuff.globals)-1,-1,-1):
            inject_body = replace_instruction_with(inject_body, f"global.get {i}", f"global.get {i+len(app_wat_stuff.globals)}")
            inject_body = replace_instruction_with(inject_body, f"global.set {i}", f"global.set {i+len(app_wat_stuff.globals)}")
            # print(f"replacing 'global.set {i}' with 'global.set {i+len(app_wat_stuff.globals)}'")

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
                            # print(f"replace 'call {inject_import_func_num}' with 'call {app_import_func_num}'")
                            inject_body = replace_instruction_with(inject_body, f"call {inject_import_func_num}", f"call {app_import_func_num}")
                    return inject_body
    
    def fix_seperate_func_calls(inject_body):
        for inject_func in inject_wat_stuff.funcs:
            if inject_func.num in seperate_func_mapping:
                # print(f"replace 'call {inject_func.num}' with 'call {seperate_func_mapping[inject_func.num]}'")
                inject_body = replace_instruction_with(inject_body, f"call {inject_func.num}", f"call {seperate_func_mapping[inject_func.num]}")
        return inject_body
    
    def fix_memory_instructions(inject_body):
        loads = "i32.load,i64.load,f32.load,f64.load,i32.load8_s,i32.load8_u,i32.load16_s,i32.load16_u,i64.load8_s,i64.load8_u,i64.load16_s,i64.load16_u,i64.load32_s,i64.load32_u"
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
            elif import_thing.name == "special_func_number":
                inject_body = replace_instruction_with(inject_body,f"call {import_thing.num}", f"FUNC_NUM_CONST_INSTR")
            elif import_thing.name == "special_printargs":
                inject_body = replace_instruction_with(inject_body,f"call {import_thing.num}", f"SPECIAL_PRINT_ARGS")
            elif import_thing.name == "special_clear_locals":
                inject_body = replace_instruction_with(inject_body,f"call {import_thing.num}", f"SPECIAL_CLEAR_LOCALS")
            elif import_thing.name == "special_start_func_number":
                inject_body = replace_instruction_with(inject_body,f"call {import_thing.num}", f"SPECIAL_START_FUNC_NUM")


        return inject_body

    inject_body = inject_wat_stuff.getFuncByNum(export_func_num).body
    inject_body = fix_globals(inject_body)
    inject_body = fix_seperate_func_calls(inject_body)
    inject_body = fix_indexhtml_import_calls(inject_body)
    inject_body = fix_memory_instructions(inject_body)
    inject_body = fix_special_arras_calls(inject_body)

    if export_name.startswith(inject_func_prefix):
        target_func = export_name.replace(inject_func_prefix,"")
        if target_func == "all":
            for inject_func in app_wat_stuff.funcs:
                inject_function_jobs[inject_func.num] = inject_body
        elif target_func == "start":
            inject_function_jobs[app_wat_stuff.start_func_num] = inject_body
            # print(f"added start func thing: '{inject_body}'")
        elif target_func == "bigfunc_beforebranch":
            bigfunc_beforebranch_job = inject_body
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

        

# print(inject_function_jobs[302])
# print(inject_function_jobs[572])
# exit()
app_wat_patched = ["",""]
on_func = -1
func_locals_line = None
seen_first_func = False
func_header_line = None

hit_large_branch_bigfunc = False
chacha_searching_for_xor_store8_pair = False
chacha_searching_for_br1 = False
chacha_br1_1_counter = 0
chacha_br1_2_counter = 0
chacha_xor_store8_pair1_counter = 0
chacha_xor_store8_pair2_counter = 0

for line in app_wat_content.split("\n"):
    before0_is_local = line.startswith("    (local ")
    before0_is_import = "import" in line

    before1_is_module = app_wat_patched[-1].startswith("(module")
    before1_is_local = app_wat_patched[-1].startswith("    (local ")
    before1_is_func = app_wat_patched[-1].startswith("  (func (;")
    before1_is_import = "import" in app_wat_patched[-1]

    before2_is_func = app_wat_patched[-2].startswith("  (func (;")

    def do_final_changes(injecting_code):
        global func_header_line
        global func_locals_line
        global on_func
        injecting_code = injecting_code.replace("FUNC_NUM_CONST_INSTR", f"i32.const {on_func}")
        injecting_code = injecting_code.replace("SPECIAL_START_FUNC_NUM", f"i32.const {app_wat_stuff.start_func_num}")

        # if len(locals_list) > 0:
        #     print(f"{injecting_code},{locals_list}")
        #     exit(1)

        #  (func (;264;) (type 4) (param i32 i32 i32) (result i32)
        #  (func (;262;) (type 30) (param i32 f64 f64 f64 f64 f64 i32 f32 f32 i32 i32)
        #  (func (;264;) (type 4) (result i32)
        #  (func (;287;) (type 12)
        param_list = []
        if "param" in func_header_line:
            temp = func_header_line[func_header_line.find("(param ")+7:]
            temp = temp[:temp.find(")")]
            temp = temp.split(" ")
            param_list = temp

        poop_mapping = {
            "i32": "_special_printargs_per_arg_i32",
            "i64": "_special_printargs_per_arg_i64",
            "f32": "_special_printargs_per_arg_f32",
            "f64": "_special_printargs_per_arg_f64",
        }
        print_args_code = []

        for i in range(len(param_list)):
            param = param_list[i]
            poop_map_number = inject_wat_stuff.exports[poop_mapping[param]]
            special_call_number = seperate_func_mapping[poop_map_number]
            print_args_code.append(f"    local.get {i}\ncall {special_call_number}")


        locals_list = []
        #    (local i32 i32)
        found_local_def = -1
        while True:
            new_local_def = func_locals_line.find("(local ", found_local_def+1)
            if new_local_def == -1:
                break
            temp = func_locals_line[new_local_def+7:]
            temp = temp[:temp.find(")")]
            temp = temp.split(" ")
            # locals_list = temp
            locals_list.extend(temp)

            found_local_def = new_local_def

        # if on_func == 556:
        #     print(f"locals_list:{locals_list}")
        #     exit(1)

        # just in case brodie you feel me
        while "" in locals_list:
            locals_list.remove("")

        clear_locals_code = []
        for i in range(len(locals_list)):
            the_local = locals_list[i]
            if the_local == "i32":
                clear_locals_code.append(f"    i32.const 0")
            if the_local == "i64":
                clear_locals_code.append(f"    i64.const 0")
            if the_local == "f32":
                clear_locals_code.append(f"    f32.const 0x0p+0")
            if the_local == "f64":
                clear_locals_code.append(f"    f64.const 0x0p+0")

            clear_locals_code.append(f"    local.set {i+len(param_list)}")

        # print(f"before SPECIAL_PRINT_ARGS replacement... '{func_header_line}'")
        # print(f"right before checking spcieal print args '{inject}'")
        if "SPECIAL_PRINT_ARGS" in injecting_code:
            injecting_code = injecting_code.replace("SPECIAL_PRINT_ARGS", "\n" + "\n".join(print_args_code) + "\n")
            # print(f"replacing the SPECIAL_PRINT_ARGS '{func_header_line}','{param_list}','{special_inject_code}'",)
            # exit(1)

        if "SPECIAL_CLEAR_LOCALS" in injecting_code:
            injecting_code = injecting_code.replace("SPECIAL_CLEAR_LOCALS", "\n" + "\n".join(clear_locals_code) + "\n")


        # for inject_import in inject_wat_stuff.imports:
        #     inject_func_name = inject_import.name
        #     inject_func_num = inject_import.num
        #     if inject_func_name.startswith("import"):
        #         pass
        #     elif inject_func_name == "special_func_number":
        #         pass
        return injecting_code

    def do_local_offsetting_stuff(inject_code):
        global func_locals_line
        global on_func
        global bigfunc_beforebranch_job

        start_local_index = func_locals_line.find("    (local ")
        end_local_index = func_locals_line.find(")", start_local_index+10)
        app_locals_list = func_locals_line[start_local_index+11:end_local_index].split(" ")
        if func_locals_line == "":
            app_locals_list = []
    

        inject_locals_list = []
        if "    (local " in inject_code:
            start_local_index = inject_code.find("    (local ")
            end_local_index = inject_code.find(")", start_local_index+10)
            inject_locals_list = inject_code[start_local_index+11:end_local_index].split(" ")
            
            #remove local instruction from injecting code
            inject_code = inject_code[:start_local_index] + inject_code[end_local_index+1:]
        
        bigfunc_beforebranch_code_locals_list = []
        if on_func == app_wat_stuff.largestFuncNum and bigfunc_beforebranch_job != "":
            if "    (local " in bigfunc_beforebranch_job:
                start_local_index = bigfunc_beforebranch_job.find("    (local ")
                end_local_index = bigfunc_beforebranch_job.find(")", start_local_index+10)
                bigfunc_beforebranch_code_locals_list = bigfunc_beforebranch_job[start_local_index+11:end_local_index].split(" ")
                
                #remove local instruction from injecting code
                bigfunc_beforebranch_job = bigfunc_beforebranch_job[:start_local_index] + bigfunc_beforebranch_job[end_local_index+1:]

        # print(f"onfunc: {on_func},inject locals:'{inject_locals_list}', app locals:'{app_locals_list}'")
        #merge into app local instruction
        # line = f"    (local {" ".join(app_locals_list)} {" ".join(inject_locals_list)})"
        func_locals_line = f"    (local {" ".join(app_locals_list)} {" ".join(inject_locals_list)})"
        if on_func == app_wat_stuff.largestFuncNum and bigfunc_beforebranch_job != "":
            func_locals_line = f"    (local {" ".join(app_locals_list)} {" ".join(inject_locals_list)} {" ".join(bigfunc_beforebranch_code_locals_list)})"
        # func_locals_line = line

        param_list = []
        if "param" in func_header_line:
            temp = func_header_line[func_header_line.find("(param ")+7:]
            temp = temp[:temp.find(")")]
            temp = temp.split(" ")
            param_list = temp

        #offset the inject locals set/get instructions
        for i in range(len(inject_locals_list)):
            inject_code = replace_instruction_with(inject_code, f"local.get {i}", f"local.get {i+len(app_locals_list)+len(param_list)}")
            inject_code = replace_instruction_with(inject_code, f"local.set {i}", f"local.set {i+len(app_locals_list)+len(param_list)}")
            inject_code = replace_instruction_with(inject_code, f"local.tee {i}", f"local.tee {i+len(app_locals_list)+len(param_list)}")

        #update the new inject code for when we inject it, in the next line i think
        inject_function_jobs[on_func] = inject_code

        if on_func == app_wat_stuff.largestFuncNum and bigfunc_beforebranch_job != "":
            for i in range(len(bigfunc_beforebranch_code_locals_list)):
                bigfunc_beforebranch_job = replace_instruction_with(bigfunc_beforebranch_job, f"local.get {i+1}", f"local.get {i+len(app_locals_list)+len(param_list)+len(inject_locals_list)}")
                bigfunc_beforebranch_job = replace_instruction_with(bigfunc_beforebranch_job, f"local.set {i+1}", f"local.set {i+len(app_locals_list)+len(param_list)+len(inject_locals_list)}")
                bigfunc_beforebranch_job = replace_instruction_with(bigfunc_beforebranch_job, f"local.tee {i+1}", f"local.tee {i+len(app_locals_list)+len(param_list)+len(inject_locals_list)}")

    if line.startswith("  (memory (;"):
        app_wat_patched.append(line)
        app_wat_patched.append(inject_wat_stuff.memories[0])
        continue
    elif line.startswith("  (global ("):
        app_wat_patched.append(line)
        for i in range(len(inject_wat_stuff.globals)):
            global_line = inject_wat_stuff.globals[i]
            app_wat_patched.append(global_line)
        continue
    elif line.startswith("  (func (;"):
        on_func = int(line[line.find('(;')+2:line.find(";)")])
        func_header_line = line
        func_locals_line = ""
        # seen_first_func = True
    elif line.startswith("  (start "):
        print("found (start")
        # for inject_func in seperate_function_jobs:
        for inject_func in inject_wat_stuff.funcs:
            # APPENDING SEPERATE FUNCTIONS CODE HERE
            if inject_func.num in seperate_func_mapping:
                # print(f"injecting: {inject_func.num}, {inject_func.header_line}")
                """
                    (func (;5;) (type 0) (param i32)
                turns into
                    (func (;5;)  (param i32)
                seperate_funcs.append(FuncThing())
                """
                func_header_line = inject_func.header_line
                pattern = r"(\(type [0-9]*\))"
                result = re.search(pattern, func_header_line)
                # print(result)
                left = func_header_line[:result.start(1)]
                right = func_header_line[result.end(1):]
                # print(func_header_line, left + right)
                app_wat_patched.append(left+right + "\n")

                on_func = seperate_func_mapping[inject_func.num]
                inject_body = seperate_function_jobs[inject_func.num]

                # inject_body = inject_body.replace("FUNC_NUM_CONST_INSTR", f"i32.const {on_func}")
                if inject_func.num == 572:
                    print(f"inject_body:'{inject_body}'")
                inject_body = do_final_changes(inject_body)

                app_wat_patched.append(inject_body + ")\n")

                # print(on_func, left+right)
                # exit()
            else:
                # print(f"not in seperate func mapping: {inject_func.num}, {inject_func.header_line}")
                pass
            
            # for (inject_func_name, inject_func_num) in inject_wat_stuff.imports.items():
            #     if inject_func_name.startswith("import"):
            #         import_string = inject_wat_stuff.import_strings[inject_func_name]
            #         import_string = import_string.replace("\"env\" \"import_js_debug\"", f"\"0\" \"{get_import_inject_index(inject_func_name)}\"")
            #         import_string = import_string.replace(f"(func (;{inject_func_num};)", f"(func ${inject_func_name}")
            #         app_wat_patched.append(import_string)
        
        for (export_job_func_num, export_job_func_name) in export_function_jobs.items():
            app_wat_patched.append(f"  (export \"{export_job_func_name}\" (func {export_job_func_num}))")

        for dataline in inject_wat_stuff.dataLines:
            app_wat_patched.append(dataline.replace("(;0;)","1"))

    elif before0_is_local:
        # merge locals with inject code
        func_locals_line = line
        continue
        # if on_func in inject_function_jobs:
        #     inject_code = inject_function_jobs[on_func]
        #     if "    (local " in inject_code:
        #         do_local_offsetting_stuff(inject_code)

    elif (before1_is_local and before2_is_func) or (not before0_is_local and before1_is_func):
        # APPENDING "inject_" CODE HERE
        if on_func in inject_function_jobs: #and on_func==513:
            # if len(func_locals_line) == 0:
                
            inject_code = inject_function_jobs[on_func]
            # if on_func==572:
            #     print(f"'inject_code:{inject_code}', func_locals_line:'{func_locals_line}'")
            do_local_offsetting_stuff(inject_code)
            inject_code = inject_function_jobs[on_func]
            # if on_func==572:
            #    print(f"'inject_code:{inject_code}', func_locals_line:'{func_locals_line}'")
            inject_code = do_final_changes(inject_code)
            # if on_func==572:
            #     print(f"'inject_code:{inject_code}', func_locals_line:'{func_locals_line}'")
            app_wat_patched.append(func_locals_line)
            app_wat_patched.append(inject_code)
            # print(app_wat_patched)

    elif on_func == app_wat_stuff.largestFuncNum:
        if len(line) > 6000 and "br_table" in line and hit_large_branch_bigfunc == False:
            hit_large_branch_bigfunc = True
            if bigfunc_beforebranch_job != "":
                # inject the stuff
                local_before_branch_line = app_wat_patched[-1]
                local_before_branch = re.search(r"local.get ([0-9]*)", local_before_branch_line).group(1)
                # print(f"{local_before_branch}")
                # exit(1)
                bigfunc_beforebranch_job = replace_instruction_with(bigfunc_beforebranch_job, f"local.get 0", f"local.get {local_before_branch}")
                app_wat_patched.append(f"drop\n{bigfunc_beforebranch_job}")
        elif "3684054920433006693" in line:
            if chacha_xor_store8_pair2_counter < 2:
                print("started looking for pairs o.O")
                chacha_searching_for_xor_store8_pair = True
        elif chacha_searching_for_xor_store8_pair and "i32.xor" in app_wat_patched[-1] and "i32.store8" in line:
            if chacha_xor_store8_pair1_counter < 2:
                chacha_xor_store8_pair1_counter = chacha_xor_store8_pair1_counter + 1
                chacha_func = inject_wat_stuff.getFuncByName("_special_bigfunc_chachabyte_1")
                if chacha_func != None:
                    print("did chacah1")
                    app_wat_patched.append(f"i32.const 255\ni32.and\ncall {seperate_func_mapping[chacha_func.num]}")

                if chacha_xor_store8_pair1_counter == 2:
                    chacha_searching_for_xor_store8_pair = False
                    chacha_searching_for_br1 = True
            elif chacha_xor_store8_pair2_counter < 2:
                chacha_xor_store8_pair2_counter = chacha_xor_store8_pair2_counter + 1
                chacha_func = inject_wat_stuff.getFuncByName("_special_bigfunc_chachabyte_2")
                if chacha_func != None:
                    print("did chacah2")
                    app_wat_patched.append(f"i32.const 255\ni32.and\ncall {seperate_func_mapping[chacha_func.num]}")

                if chacha_xor_store8_pair2_counter == 2:
                    chacha_searching_for_xor_store8_pair = False
                    chacha_searching_for_br1 = True
        elif chacha_searching_for_br1 and "(;@1;)" in line and "br " in line:
            if chacha_br1_1_counter < 2:
                chacha_br1_1_counter = chacha_br1_1_counter + 1
                chacha_func = inject_wat_stuff.getFuncByName("_special_bigfunc_chachafinish_1")
                if chacha_func != None:
                    print("did chacah1 end")
                    app_wat_patched.append(f"call {seperate_func_mapping[chacha_func.num]}")

                if chacha_br1_1_counter == 2:
                    chacha_searching_for_br1 = False
            elif chacha_br1_2_counter < 2:
                chacha_br1_2_counter = chacha_br1_2_counter + 1
                chacha_func = inject_wat_stuff.getFuncByName("_special_bigfunc_chachafinish_2")
                if chacha_func != None:
                    print("did chacah2 end")
                    app_wat_patched.append(f"call {seperate_func_mapping[chacha_func.num]}")

                if chacha_br1_2_counter == 2:
                    chacha_searching_for_br1 = False





    if before0_is_import:
        last_is_import = True

    app_wat_patched.append(line)
# print(f"{len(seperate_func_mapping)},{seperate_func_mapping}")
# print(f"{len(inject_function_jobs)},{inject_function_jobs}")
# print(f"{len(export_function_jobs)},{export_function_jobs}")

app_wat_patched = "\n".join(app_wat_patched)
with open(args.o1, "w") as f: f.write(app_wat_patched)

print("done")