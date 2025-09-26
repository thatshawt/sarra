(module
  (type (;0;) (func (param i32 i32)))
  (type (;1;) (func (param i32)))
  (type (;2;) (func (param i32) (result i32)))
  (type (;3;) (func))
  (type (;4;) (func (param i32 i32 i32)))
  (import "env" "import_e_t_get" (func (;0;) (type 2)))
  (import "env" "special_arras_memory_i32_load" (func (;1;) (type 2)))
  (import "env" "special_arras_memory_i32_store" (func (;2;) (type 0)))
  (func (;3;) (type 3))
  (func (;4;) (type 0) (param i32 i32)
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
  (func (;5;) (type 0) (param i32 i32)
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
  (func (;6;) (type 1) (param i32)
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
  (func (;7;) (type 4) (param i32 i32 i32))
  (func (;8;) (type 1) (param i32)
    (local i32)
    i32.const 10003
    call 0
    drop
    local.get 0
    call 1
    local.tee 1
    i32.const 255
    i32.and
    i32.const 10000
    i32.add
    call 0
    drop
    local.get 1
    i32.const 65280
    i32.and
    i32.const 8
    i32.shl
    i32.const 16
    i32.shr_u
    i32.const 10000
    i32.add
    call 0
    drop
    local.get 1
    i32.const 8
    i32.shr_u
    i32.const 65280
    i32.and
    i32.const 8
    i32.shr_u
    i32.const 10000
    i32.add
    call 0
    drop
    local.get 1
    i32.const 24
    i32.shr_u
    i32.const 10000
    i32.add
    call 0
    drop
    local.get 0
    i32.const 4
    i32.add
    call 1
    local.tee 1
    i32.const 255
    i32.and
    i32.const 10000
    i32.add
    call 0
    drop
    local.get 1
    i32.const 65280
    i32.and
    i32.const 8
    i32.shl
    i32.const 16
    i32.shr_u
    i32.const 10000
    i32.add
    call 0
    drop
    local.get 1
    i32.const 8
    i32.shr_u
    i32.const 65280
    i32.and
    i32.const 8
    i32.shr_u
    i32.const 10000
    i32.add
    call 0
    drop
    local.get 1
    i32.const 24
    i32.shr_u
    i32.const 10000
    i32.add
    call 0
    drop
    local.get 0
    i32.const 8
    i32.add
    call 1
    local.tee 1
    i32.const 255
    i32.and
    i32.const 10000
    i32.add
    call 0
    drop
    local.get 1
    i32.const 65280
    i32.and
    i32.const 8
    i32.shl
    i32.const 16
    i32.shr_u
    i32.const 10000
    i32.add
    call 0
    drop
    local.get 1
    i32.const 8
    i32.shr_u
    i32.const 65280
    i32.and
    i32.const 8
    i32.shr_u
    i32.const 10000
    i32.add
    call 0
    drop
    local.get 1
    i32.const 24
    i32.shr_u
    i32.const 10000
    i32.add
    call 0
    drop
    local.get 0
    i32.const 12
    i32.add
    call 1
    local.tee 0
    i32.const 255
    i32.and
    i32.const 10000
    i32.add
    call 0
    drop
    local.get 0
    i32.const 65280
    i32.and
    i32.const 8
    i32.shl
    i32.const 16
    i32.shr_u
    i32.const 10000
    i32.add
    call 0
    drop
    local.get 0
    i32.const 8
    i32.shr_u
    i32.const 65280
    i32.and
    i32.const 8
    i32.shr_u
    i32.const 10000
    i32.add
    call 0
    drop
    local.get 0
    i32.const 24
    i32.shr_u
    i32.const 10000
    i32.add
    call 0
    drop
    i32.const 9999
    call 0
    drop)
  (func (;9;) (type 1) (param i32)
    local.get 0
    call 8)
  (memory (;0;) 5)
  (global (;0;) i32 (i32.const 1024))
  (global (;1;) i32 (i32.const 1024))
  (global (;2;) i32 (i32.const 1036))
  (global (;3;) i32 (i32.const 1040))
  (global (;4;) i32 (i32.const 66576))
  (global (;5;) i32 (i32.const 1024))
  (global (;6;) i32 (i32.const 66576))
  (global (;7;) i32 (i32.const 327680))
  (global (;8;) i32 (i32.const 0))
  (global (;9;) i32 (i32.const 1))
  (global (;10;) i32 (i32.const 65536))
  (export "memory" (memory 0))
  (export "__wasm_call_ctors" (func 3))
  (export "_hxh_add_char_string_microcode" (func 4))
  (export "_hxh_add_int_string_microcode" (func 5))
  (export "_hithere" (func 6))
  (export "caca" (global 0))
  (export "inject_func_all" (func 7))
  (export "_hellnaw" (func 8))
  (export "inject_func_271" (func 9))
  (export "__dso_handle" (global 1))
  (export "__data_end" (global 2))
  (export "__stack_low" (global 3))
  (export "__stack_high" (global 4))
  (export "__global_base" (global 5))
  (export "__heap_base" (global 6))
  (export "__heap_end" (global 7))
  (export "__memory_base" (global 8))
  (export "__table_base" (global 9))
  (export "__wasm_first_page_end" (global 10)))
