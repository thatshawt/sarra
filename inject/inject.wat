(module
  (type (;0;) (func))
  (type (;1;) (func (param i32 i32)))
  (type (;2;) (func (param i32) (result i32)))
  (type (;3;) (func (param i32)))
  (type (;4;) (func (result i32)))
  (type (;5;) (func (param i32 i32) (result i32)))
  (type (;6;) (func (param i32 i32 i32)))
  (type (;7;) (func (param i64)))
  (type (;8;) (func (param f32)))
  (type (;9;) (func (param f64)))
  (import "env" "special_arras_memory_i32_load" (func (;0;) (type 2)))
  (import "env" "import_e_t_get" (func (;1;) (type 2)))
  (import "env" "special_arras_memory_i32_store" (func (;2;) (type 1)))
  (import "env" "special_arras_memory_i32_store8" (func (;3;) (type 1)))
  (import "env" "special_func_number" (func (;4;) (type 4)))
  (import "env" "special_start_func_number" (func (;5;) (type 4)))
  (import "env" "special_printargs" (func (;6;) (type 0)))
  (import "env" "special_clear_locals" (func (;7;) (type 0)))
  (func (;8;) (type 0))
  (func (;9;) (type 5) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 0
    local.get 1
    i32.gt_s
    select)
  (func (;10;) (type 5) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 0
    local.get 1
    i32.lt_s
    select)
  (func (;11;) (type 6) (param i32 i32 i32)
    (local i32 i32 i32)
    block  ;; label = @1
      local.get 1
      i32.const 0
      i32.le_s
      br_if 0 (;@1;)
      local.get 1
      i32.const 7
      i32.and
      local.set 4
      local.get 1
      i32.const 8
      i32.ge_u
      if  ;; label = @2
        local.get 1
        i32.const 2147483640
        i32.and
        local.set 5
        local.get 0
        local.set 1
        loop  ;; label = @3
          local.get 1
          local.get 2
          i32.store
          local.get 1
          i32.const 28
          i32.add
          local.get 2
          i32.store
          local.get 1
          i32.const 24
          i32.add
          local.get 2
          i32.store
          local.get 1
          i32.const 20
          i32.add
          local.get 2
          i32.store
          local.get 1
          i32.const 16
          i32.add
          local.get 2
          i32.store
          local.get 1
          i32.const 12
          i32.add
          local.get 2
          i32.store
          local.get 1
          i32.const 8
          i32.add
          local.get 2
          i32.store
          local.get 1
          i32.const 4
          i32.add
          local.get 2
          i32.store
          local.get 1
          i32.const 32
          i32.add
          local.set 1
          local.get 5
          local.get 3
          i32.const 8
          i32.add
          local.tee 3
          i32.ne
          br_if 0 (;@3;)
        end
      end
      local.get 4
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      local.get 3
      i32.const 2
      i32.shl
      i32.add
      local.set 1
      loop  ;; label = @2
        local.get 1
        local.get 2
        i32.store
        local.get 1
        i32.const 4
        i32.add
        local.set 1
        local.get 4
        i32.const 1
        i32.sub
        local.tee 4
        br_if 0 (;@2;)
      end
    end)
  (func (;12;) (type 6) (param i32 i32 i32)
    block  ;; label = @1
      local.get 1
      i32.const 0
      i32.le_s
      br_if 0 (;@1;)
      local.get 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      local.get 2
      local.get 1
      memory.fill
    end)
  (func (;13;) (type 3) (param i32)
    i32.const 1036
    i32.const 123456
    call 0
    local.get 0
    i32.add
    i32.const 1036
    i32.load
    i32.add
    i32.store)
  (func (;14;) (type 1) (param i32 i32)
    local.get 1
    i32.const 0
    i32.gt_s
    if  ;; label = @1
      loop  ;; label = @2
        local.get 0
        i32.load8_s
        i32.const 10000
        i32.add
        call 1
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
  (func (;15;) (type 1) (param i32 i32)
    local.get 1
    i32.const 0
    i32.gt_s
    if  ;; label = @1
      loop  ;; label = @2
        local.get 0
        i32.load
        i32.const 10000
        i32.add
        call 1
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
  (func (;16;) (type 0)
    i32.const 10006
    call 1
    drop
    i32.const 9999
    call 1
    drop)
  (func (;17;) (type 0)
    i32.const 10000
    call 1
    drop)
  (func (;18;) (type 3) (param i32)
    local.get 0
    i32.const 10000
    i32.add
    call 1
    drop)
  (func (;19;) (type 7) (param i64)
    i32.const 799789
    call 1
    drop
    local.get 0
    i32.wrap_i64
    i32.const 10000
    i32.add
    call 1
    drop)
  (func (;20;) (type 8) (param f32)
    i32.const 133123
    call 1
    drop
    local.get 0
    i32.trunc_sat_f32_s
    i32.const 10000
    i32.add
    call 1
    drop)
  (func (;21;) (type 9) (param f64)
    i32.const 466456
    call 1
    drop
    local.get 0
    i32.trunc_sat_f64_s
    i32.const 10000
    i32.add
    call 1
    drop)
  (func (;22;) (type 0)
    i32.const 9999
    call 1
    drop)
  (func (;23;) (type 3) (param i32)
    (local i32 i32)
    i32.const 1040
    i32.const 123
    i32.load
    local.tee 0
    i32.store
    i32.const 1044
    i32.const 456
    i32.load
    local.tee 1
    i32.store
    i32.const 1048
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
    i32.const 1040
    i32.const 123
    call 0
    i32.store
    i32.const 123
    i32.const 3
    call 2)
  (func (;24;) (type 0)
    i32.const 3308
    i32.const 5000
    i32.store
    i32.const 3300
    i64.const 0
    i64.store align=4
    i32.const 3312
    i32.const 0
    i32.const 2404
    memory.fill)
  (func (;25;) (type 0)
    i32.const 1052
    i32.const 0
    i32.store
    i32.const 1064
    i32.const 0
    i32.const 200
    memory.fill
    i32.const 1056
    i64.const 2147483648000
    i64.store align=4)
  (func (;26;) (type 0)
    i32.const 1272
    i32.const 2000
    i32.store
    i32.const 1264
    i64.const 0
    i64.store align=4)
  (func (;27;) (type 0)
    i32.const 1284
    i32.const 30
    i32.store
    i32.const 1276
    i64.const 0
    i64.store align=4
    i32.const 1288
    i32.const 0
    i32.const 2012
    memory.fill)
  (func (;28;) (type 0)
    i32.const 10003
    call 1
    drop
    i32.const 10066
    call 1
    drop
    i32.const 10097
    call 1
    drop
    i32.const 10110
    call 1
    drop
    i32.const 10110
    call 1
    drop
    i32.const 10097
    call 1
    drop
    i32.const 10032
    call 1
    drop
    i32.const 10084
    call 1
    drop
    i32.const 10117
    call 1
    drop
    i32.const 10114
    call 1
    drop
    i32.const 10100
    call 1
    drop
    i32.const 10032
    call 1
    drop
    i32.const 10076
    call 1
    drop
    i32.const 10097
    call 1
    drop
    i32.const 10098
    call 1
    drop
    i32.const 10115
    call 1
    drop
    i32.const 9999
    call 1
    drop
    i32.const 1052
    i32.const 0
    i32.store
    i32.const 1064
    i32.const 0
    i32.const 200
    memory.fill
    i32.const 3308
    i32.const 5000
    i32.store
    i32.const 1056
    i64.const 2147483648000
    i64.store align=4
    i32.const 3300
    i64.const 0
    i64.store align=4
    i32.const 3312
    i32.const 0
    i32.const 2404
    memory.fill
    i32.const 1272
    i32.const 2000
    i32.store
    i32.const 1264
    i64.const 0
    i64.store align=4
    i32.const 1284
    i32.const 30
    i32.store
    i32.const 1276
    i64.const 0
    i64.store align=4
    i32.const 1288
    i32.const 0
    i32.const 2012
    memory.fill
    i32.const 10005
    call 1
    drop
    i32.const 9999
    call 1
    drop)
  (func (;29;) (type 0)
    i32.const 3304
    i64.const 21474836480000
    i64.store align=4
    i32.const 3312
    i32.const 0
    i32.const 2404
    memory.fill
    i32.const 3300
    i32.const 1
    i32.store)
  (func (;30;) (type 0)
    i32.const 1280
    i64.const 128849018880
    i64.store align=4
    i32.const 1288
    i32.const 0
    i32.const 2012
    memory.fill
    i32.const 1276
    i32.const 1
    i32.store)
  (func (;31;) (type 0)
    i32.const 1064
    i32.const 0
    i32.const 200
    memory.fill
    i32.const 1060
    i32.const 500
    i32.store
    i32.const 1052
    i64.const 1
    i64.store align=4)
  (func (;32;) (type 0)
    i32.const 1268
    i64.const 8589934592000
    i64.store align=4
    i32.const 1056
    i32.const 0
    i32.store
    i32.const 1064
    i32.const 0
    i32.const 200
    memory.fill
    i32.const 1264
    i32.const 1
    i32.store
    i32.const 1060
    i32.const 500
    i32.store
    i32.const 1052
    i32.const 1
    i32.store)
  (func (;33;) (type 2) (param i32) (result i32)
    i32.const 1264
    i32.load
    if  ;; label = @1
      i32.const 1268
      i32.load
      i32.const 1272
      i32.load
      i32.ge_s
      if  ;; label = @2
        i32.const 1052
        i64.const 0
        i64.store align=4
        i32.const 1268
        i64.const 8589934592000
        i64.store align=4
        i32.const 1064
        i32.const 0
        i32.const 204
        memory.fill
        i32.const 1060
        i32.const 500
        i32.store
        local.get 0
        return
      end
      i32.const 10000
      call 1
      drop
      i32.const 1268
      i32.load
      i32.const 10000
      i32.add
      call 1
      drop
      local.get 0
      i32.const 10000
      i32.add
      call 1
      drop
      i32.const 9999
      call 1
      drop
      i32.const 1268
      i32.const 1268
      i32.load
      i32.const 1
      i32.add
      i32.store
    end
    local.get 0)
  (func (;34;) (type 2) (param i32) (result i32)
    (local i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 1
    global.set 0
    local.get 1
    local.get 0
    i32.store offset=12
    i32.const 153
    call 13
    local.get 1
    i32.load offset=12
    call 33
    local.get 1
    i32.const 16
    i32.add
    global.set 0)
  (func (;35;) (type 1) (param i32 i32)
    i32.const 158
    call 13
    local.get 0
    local.get 1
    call 3)
  (func (;36;) (type 1) (param i32 i32)
    (local i32)
    i32.const 164
    call 13
    i32.const 1276
    i32.load
    if  ;; label = @1
      i32.const 3296
      i32.load
      i32.eqz
      if  ;; label = @2
        i32.const 3292
        local.get 1
        i32.store
        i32.const 10000
        call 1
        drop
      end
      local.get 1
      i32.const 10000
      i32.add
      call 1
      drop
      i32.const 3296
      i32.const 3296
      i32.load
      local.tee 2
      i32.const 1
      i32.add
      i32.store
      local.get 2
      i32.const 2000
      i32.rem_s
      i32.const 1288
      i32.add
      local.get 1
      i32.store8
    end
    local.get 0
    local.get 1
    call 3)
  (func (;37;) (type 0)
    i32.const 181
    call 13)
  (func (;38;) (type 0)
    (local i32 i32 i32 i32)
    i32.const 193
    call 13
    i32.const 1276
    i32.load
    if  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          i32.const 3296
          i32.load
          local.tee 3
          i32.const 0
          i32.le_s
          br_if 0 (;@3;)
          i32.const 1288
          local.set 0
          loop  ;; label = @4
            local.get 1
            i32.const 1
            i32.add
            i32.const 0
            local.get 0
            local.get 2
            i32.const 2000
            i32.div_u
            i32.const -2000
            i32.mul
            i32.add
            i32.load8_u
            local.get 1
            i32.const 1024
            i32.add
            i32.load8_u
            i32.eq
            select
            local.tee 1
            i32.const 9
            i32.ne
            if  ;; label = @5
              local.get 0
              i32.const 1
              i32.add
              local.set 0
              local.get 2
              i32.const 1
              i32.add
              local.set 2
              local.get 3
              i32.const 1
              i32.sub
              local.tee 3
              br_if 1 (;@4;)
              br 2 (;@3;)
            end
          end
          i32.const 9999
          call 1
          drop
          i32.const 10003
          call 1
          drop
          i32.const 10099
          call 1
          drop
          i32.const 10104
          call 1
          drop
          i32.const 10097
          call 1
          drop
          i32.const 10116
          call 1
          drop
          i32.const 10109
          call 1
          drop
          i32.const 10101
          call 1
          drop
          i32.const 10115
          call 1
          drop
          i32.const 10115
          call 1
          drop
          i32.const 10097
          call 1
          drop
          i32.const 10103
          call 1
          drop
          i32.const 10101
          call 1
          drop
          i32.const 9999
          call 1
          drop
          i32.const 3292
          i64.const 0
          i64.store align=4
          i32.const 1280
          i32.const 1280
          i32.load
          local.tee 0
          i32.const 1
          i32.add
          i32.store
          local.get 0
          i32.const 1284
          i32.load
          i32.lt_s
          br_if 1 (;@2;)
          i32.const 1284
          i32.const 30
          i32.store
          i32.const 1276
          i64.const 0
          i64.store align=4
          i32.const 1288
          i32.const 0
          i32.const 2012
          memory.fill
          br 1 (;@2;)
        end
        i32.const 3292
        i64.const 0
        i64.store align=4
      end
      i32.const 9998
      call 1
      drop
      i32.const 1288
      i32.const 0
      i32.const 2000
      memory.fill
    end)
  (func (;39;) (type 0)
    (local i32 i32 i32)
    call 4
    local.tee 1
    call 5
    i32.eq
    if  ;; label = @1
      call 28
    end
    i32.const 1052
    i32.load
    local.set 0
    block  ;; label = @1
      local.get 1
      i32.const 271
      i32.ne
      br_if 0 (;@1;)
      local.get 0
      i32.eqz
      br_if 0 (;@1;)
      i32.const 10006
      call 1
      drop
      i32.const 9999
      call 1
      drop
      i32.const 1052
      i32.load
      local.set 0
    end
    block  ;; label = @1
      local.get 0
      i32.eqz
      br_if 0 (;@1;)
      i32.const 1056
      i32.load
      i32.const 1060
      i32.load
      i32.ge_s
      if  ;; label = @2
        i32.const 1052
        i32.const 0
        i32.store
        i32.const 1064
        i32.const 0
        i32.const 200
        memory.fill
        i32.const 1056
        i64.const 2147483648000
        i64.store align=4
        i32.const 10005
        call 1
        drop
        i32.const 9999
        call 1
        drop
        br 1 (;@1;)
      end
      i32.const 10000
      call 1
      drop
      i32.const 1056
      i32.load
      i32.const 10000
      i32.add
      call 1
      drop
      local.get 1
      i32.const 10000
      i32.add
      call 1
      drop
      call 6
      i32.const 9999
      call 1
      drop
      i32.const 1056
      i32.const 1056
      i32.load
      i32.const 1
      i32.add
      i32.store
    end
    block  ;; label = @1
      i32.const 3300
      i32.load
      i32.eqz
      br_if 0 (;@1;)
      i32.const 3304
      i32.load
      i32.const 3308
      i32.load
      i32.ge_s
      if  ;; label = @2
        i32.const 3300
        i32.const 0
        i32.store
        i32.const 10003
        call 1
        drop
        i32.const 10084
        call 1
        drop
        i32.const 10104
        call 1
        drop
        i32.const 10101
        call 1
        drop
        i32.const 10032
        call 1
        drop
        i32.const 10116
        call 1
        drop
        i32.const 10111
        call 1
        drop
        i32.const 10116
        call 1
        drop
        i32.const 10097
        call 1
        drop
        i32.const 10108
        call 1
        drop
        i32.const 10032
        call 1
        drop
        i32.const 10105
        call 1
        drop
        i32.const 10115
        call 1
        drop
        i32.const 10046
        call 1
        drop
        i32.const 10046
        call 1
        drop
        i32.const 10046
        call 1
        drop
        i32.const 9999
        call 1
        drop
        i32.const 10000
        call 1
        drop
        i32.const 3304
        i32.load
        i32.const 10000
        i32.add
        call 1
        drop
        i32.const 9999
        call 1
        drop
        i32.const 3316
        local.set 1
        i32.const 10000
        local.set 0
        loop  ;; label = @3
          local.get 1
          i32.load
          local.tee 2
          i32.const 0
          i32.gt_s
          if  ;; label = @4
            i32.const 10000
            call 1
            drop
            local.get 0
            call 1
            drop
            local.get 2
            i32.const 10000
            i32.add
            call 1
            drop
            i32.const 9999
            call 1
            drop
          end
          local.get 1
          i32.const 4
          i32.add
          local.set 1
          local.get 0
          i32.const 1
          i32.add
          local.tee 0
          i32.const 10600
          i32.ne
          br_if 0 (;@3;)
        end
        br 1 (;@1;)
      end
      local.get 1
      i32.const 2
      i32.shl
      i32.const 3316
      i32.add
      local.tee 0
      local.get 0
      i32.load
      i32.const 1
      i32.add
      i32.store
      i32.const 3304
      i32.const 3304
      i32.load
      i32.const 1
      i32.add
      i32.store
      i32.const 3312
      i32.const 3312
      i32.load
      local.tee 0
      local.get 1
      local.get 0
      local.get 1
      i32.gt_s
      select
      i32.store
    end
    call 7)
  (memory (;0;) 5)
  (global (;0;) (mut i32) (i32.const 71264))
  (global (;1;) i32 (i32.const 1036))
  (global (;2;) i32 (i32.const 1040))
  (global (;3;) i32 (i32.const 1052))
  (global (;4;) i32 (i32.const 1024))
  (global (;5;) i32 (i32.const 5716))
  (global (;6;) i32 (i32.const 5728))
  (global (;7;) i32 (i32.const 71264))
  (global (;8;) i32 (i32.const 1024))
  (global (;9;) i32 (i32.const 71264))
  (global (;10;) i32 (i32.const 327680))
  (global (;11;) i32 (i32.const 0))
  (global (;12;) i32 (i32.const 1))
  (global (;13;) i32 (i32.const 65536))
  (export "memory" (memory 0))
  (export "__wasm_call_ctors" (func 8))
  (export "_max_i32" (func 9))
  (export "_min_i32" (func 10))
  (export "_memset_i32" (func 11))
  (export "_memset_i8" (func 12))
  (export "export_nothing" (func 13))
  (export "nothing_state" (global 1))
  (export "_hxh_add_char_string_microcode" (func 14))
  (export "_hxh_add_int_string_microcode" (func 15))
  (export "_hxh_breakpoint" (func 16))
  (export "_special_printargs_begin" (func 17))
  (export "_special_printargs_per_arg_i32" (func 18))
  (export "_special_printargs_per_arg_i64" (func 19))
  (export "_special_printargs_per_arg_f32" (func 20))
  (export "_special_printargs_per_arg_f64" (func 21))
  (export "_special_printargs_end" (func 22))
  (export "_hithere" (func 23))
  (export "caca" (global 2))
  (export "_reset_stats" (func 24))
  (export "poopState" (global 3))
  (export "_reset_debug" (func 25))
  (export "_reset_bigfunc_trace" (func 26))
  (export "_reset_chacha" (func 27))
  (export "_init_all_the_things" (func 28))
  (export "export_enable_stats" (func 29))
  (export "export_chacha_enable" (func 30))
  (export "export_enable_debug" (func 31))
  (export "export_enable_bigfunc_trace" (func 32))
  (export "_do_bigfunc_stuff" (func 33))
  (export "inject_bigfunc_beforebranch" (func 34))
  (export "_special_bigfunc_chachabyte_1" (func 35))
  (export "_special_bigfunc_chachabyte_2" (func 36))
  (export "_special_bigfunc_chachafinish_1" (func 37))
  (export "_special_bigfunc_chachafinish_2" (func 38))
  (export "inject_all" (func 39))
  (export "__dso_handle" (global 4))
  (export "__data_end" (global 5))
  (export "__stack_low" (global 6))
  (export "__stack_high" (global 7))
  (export "__global_base" (global 8))
  (export "__heap_base" (global 9))
  (export "__heap_end" (global 10))
  (export "__memory_base" (global 11))
  (export "__table_base" (global 12))
  (export "__wasm_first_page_end" (global 13))
  (data (;0;) (i32.const 1024) "123123123"))
