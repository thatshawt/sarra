(module
  (type (;0;) (func))
  (type (;1;) (func (param i32) (result i32)))
  (type (;2;) (func (param i32)))
  (type (;3;) (func (param i32 i32 i32)))
  (import "env" "import_e_t_get" (func (;0;) (type 1)))
  (func (;1;) (type 0))
  (func (;2;) (type 2) (param i32)
    (local i32 i32 i32 i32 i32)
    loop  ;; label = @1
      i32.const 0
      local.set 2
      loop  ;; label = @2
        i32.const 0
        local.set 3
        loop  ;; label = @3
          i32.const 0
          local.set 4
          loop  ;; label = @4
            i32.const 0
            local.set 5
            loop  ;; label = @5
              local.get 0
              call 0
              drop
              local.get 5
              call 0
              drop
              local.get 5
              i32.const 1
              i32.add
              local.tee 5
              i32.const 100
              i32.ne
              br_if 0 (;@5;)
            end
            local.get 4
            call 0
            drop
            local.get 4
            i32.const 1
            i32.add
            local.tee 4
            i32.const 100
            i32.ne
            br_if 0 (;@4;)
          end
          local.get 3
          call 0
          drop
          local.get 3
          i32.const 1
          i32.add
          local.tee 3
          i32.const 100
          i32.ne
          br_if 0 (;@3;)
        end
        local.get 2
        call 0
        drop
        local.get 2
        i32.const 1
        i32.add
        local.tee 2
        i32.const 100
        i32.ne
        br_if 0 (;@2;)
      end
      local.get 1
      call 0
      drop
      local.get 1
      i32.const 1
      i32.add
      local.tee 1
      i32.const 100
      i32.ne
      br_if 0 (;@1;)
    end)
  (func (;3;) (type 3) (param i32 i32 i32))
  (func (;4;) (type 0)
    (local i32)
    i32.const 10001
    call 0
    drop
    i32.const 10000
    call 0
    drop
    i32.const 9999
    call 0
    local.set 0
    i32.const 10002
    call 0
    drop
    i32.const 10000
    call 0
    drop
    local.get 0
    i32.const 10314
    i32.add
    call 0
    drop
    i32.const 9999
    call 0
    drop
    i32.const 10000
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
  (func (;5;) (type 0)
    call 4)
  (memory (;0;) 2)
  (global (;0;) i32 (i32.const 1024))
  (global (;1;) i32 (i32.const 1024))
  (global (;2;) i32 (i32.const 1024))
  (global (;3;) i32 (i32.const 66560))
  (global (;4;) i32 (i32.const 1024))
  (global (;5;) i32 (i32.const 66560))
  (global (;6;) i32 (i32.const 131072))
  (global (;7;) i32 (i32.const 0))
  (global (;8;) i32 (i32.const 1))
  (global (;9;) i32 (i32.const 65536))
  (export "memory" (memory 0))
  (export "__wasm_call_ctors" (func 1))
  (export "seperate_func_hithere" (func 2))
  (export "inject_func_all" (func 3))
  (export "seperate_func_hellnaw" (func 4))
  (export "inject_func_486" (func 5))
  (export "__dso_handle" (global 0))
  (export "__data_end" (global 1))
  (export "__stack_low" (global 2))
  (export "__stack_high" (global 3))
  (export "__global_base" (global 4))
  (export "__heap_base" (global 5))
  (export "__heap_end" (global 6))
  (export "__memory_base" (global 7))
  (export "__table_base" (global 8))
  (export "__wasm_first_page_end" (global 9)))
