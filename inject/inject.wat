(module
  (type (;0;) (func))
  (type (;1;) (func (param i32)))
  (type (;2;) (func (param i32 i32)))
  (type (;3;) (func (param i32) (result i32)))
  (type (;4;) (func (param f32)))
  (type (;5;) (func (param f64)))
  (import "env" "import_e_t_get" (func (;0;) (type 3)))
  (import "env" "special_arras_memory_i32_load" (func (;1;) (type 3)))
  (import "env" "special_arras_memory_i32_store" (func (;2;) (type 2)))
  (func (;3;) (type 0))
  (func (;4;) (type 2) (param i32 i32)
    local.get 1
    i32.const 0
    i32.gt_s
    if  ;; label = @1
      loop  ;; label = @2
        local.get 0
        i32.load8_s
        i32.const 10000
        i32.add
        call 0
        drop
        local.get 0
        i32.const 1
        i32.add
        local.set 0
        local.get 1
        i32.const 1
        i32.sub
        local.tee 1
        br_if 0 (;@2;)
      end
    end)
  (func (;5;) (type 2) (param i32 i32)
    local.get 1
    i32.const 0
    i32.gt_s
    if  ;; label = @1
      loop  ;; label = @2
        local.get 0
        i32.load
        i32.const 10000
        i32.add
        call 0
        drop
        local.get 0
        i32.const 4
        i32.add
        local.set 0
        local.get 1
        i32.const 1
        i32.sub
        local.tee 1
        br_if 0 (;@2;)
      end
    end)
  (func (;6;) (type 0)
    i32.const 10000
    call 0
    drop)
  (func (;7;) (type 1) (param i32)
    local.get 0
    i32.const 10000
    i32.add
    call 0
    drop)
  (func (;8;) (type 4) (param f32)
    local.get 0
    i32.trunc_sat_f32_s
    i32.const 10000
    i32.add
    call 0
    drop)
  (func (;9;) (type 5) (param f64)
    local.get 0
    i32.trunc_sat_f64_s
    i32.const 10000
    i32.add
    call 0
    drop)
  (func (;10;) (type 0)
    i32.const 9999
    call 0
    drop)
  (func (;11;) (type 1) (param i32)
    (local i32 i32)
    i32.const 1024
    i32.const 123
    i32.load
    local.tee 0
    i32.store
    i32.const 1028
    i32.const 456
    i32.load
    local.tee 1
    i32.store
    i32.const 1032
    i32.const 789
    i32.load
    local.tee 2
    i32.store
    i32.const 123
    local.get 2
    local.get 0
    local.get 1
    i32.add
    i32.add
    i32.store
    i32.const 1024
    i32.const 123
    call 1
    i32.store
    i32.const 123
    i32.const 3
    call 2)
  (func (;12;) (type 1) (param i32)
    i32.const 10000
    call 0
    drop
    i32.const 10271
    call 0
    drop
    local.get 0
    i32.const 10000
    i32.add
    call 0
    drop
    i32.const 9999
    call 0
    drop)
  (func (;13;) (type 1) (param i32))
  (func (;14;) (type 0)
    (local i32)
    i32.const 1036
    i32.const 1036
    i32.load
    local.tee 0
    i32.eqz
    i32.store
    i32.const 10005
    i32.const 10004
    local.get 0
    select
    call 0
    drop
    i32.const 9999
    call 0
    drop)
  (func (;15;) (type 0)
    i32.const 10003
    call 0
    drop
    i32.const 10066
    call 0
    drop
    i32.const 10101
    call 0
    drop
    i32.const 10104
    call 0
    drop
    i32.const 10111
    call 0
    drop
    i32.const 10108
    call 0
    drop
    i32.const 10100
    call 0
    drop
    i32.const 10033
    call 0
    drop
    i32.const 10033
    call 0
    drop
    i32.const 10032
    call 0
    drop
    i32.const 10080
    call 0
    drop
    i32.const 10111
    call 0
    drop
    i32.const 10111
    call 0
    drop
    i32.const 10032
    call 0
    drop
    i32.const 10112
    call 0
    drop
    i32.const 10111
    call 0
    drop
    i32.const 10111
    call 0
    drop
    i32.const 10112
    call 0
    drop
    i32.const 10032
    call 0
    drop
    i32.const 10102
    call 0
    drop
    i32.const 10097
    call 0
    drop
    i32.const 10114
    call 0
    drop
    i32.const 10116
    call 0
    drop
    i32.const 10032
    call 0
    drop
    i32.const 10118
    call 0
    drop
    i32.const 10051
    call 0
    drop
    i32.const 10046
    call 0
    drop
    i32.const 10049
    call 0
    drop
    i32.const 10052
    call 0
    drop
    i32.const 10049
    call 0
    drop
    i32.const 10053
    call 0
    drop
    i32.const 10033
    call 0
    drop
    i32.const 10033
    call 0
    drop
    i32.const 10046
    call 0
    drop
    i32.const 10046
    call 0
    drop
    i32.const 10046
    call 0
    drop
    i32.const 9999
    call 0
    drop
    i32.const 1036
    i32.const 0
    i32.store
    i32.const 10005
    call 0
    drop
    i32.const 9999
    call 0
    drop)
  (func (;16;) (type 0)
    call 15)
  (memory (;0;) 5)
  (global (;0;) i32 (i32.const 1024))
  (global (;1;) i32 (i32.const 1036))
  (global (;2;) i32 (i32.const 1024))
  (global (;3;) i32 (i32.const 1040))
  (global (;4;) i32 (i32.const 1040))
  (global (;5;) i32 (i32.const 66576))
  (global (;6;) i32 (i32.const 1024))
  (global (;7;) i32 (i32.const 66576))
  (global (;8;) i32 (i32.const 327680))
  (global (;9;) i32 (i32.const 0))
  (global (;10;) i32 (i32.const 1))
  (global (;11;) i32 (i32.const 65536))
  (export "memory" (memory 0))
  (export "__wasm_call_ctors" (func 3))
  (export "_hxh_add_char_string_microcode" (func 4))
  (export "_hxh_add_int_string_microcode" (func 5))
  (export "_special_printargs_begin" (func 6))
  (export "_special_printargs_per_arg_i32" (func 7))
  (export "_special_printargs_per_arg_f32" (func 8))
  (export "_special_printargs_per_arg_f64" (func 9))
  (export "_special_printargs_end" (func 10))
  (export "_hithere" (func 11))
  (export "caca" (global 0))
  (export "inject_all" (func 3))
  (export "_hellnaw" (func 12))
  (export "inject_271" (func 13))
  (export "export_toggle_debug_mode" (func 14))
  (export "debug_state" (global 1))
  (export "_init_all_the_things" (func 15))
  (export "inject_start" (func 16))
  (export "__dso_handle" (global 2))
  (export "__data_end" (global 3))
  (export "__stack_low" (global 4))
  (export "__stack_high" (global 5))
  (export "__global_base" (global 6))
  (export "__heap_base" (global 7))
  (export "__heap_end" (global 8))
  (export "__memory_base" (global 9))
  (export "__table_base" (global 10))
  (export "__wasm_first_page_end" (global 11)))
