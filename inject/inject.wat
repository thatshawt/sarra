(module
  (type (;0;) (func))
  (type (;1;) (func (param i32 i32) (result i32)))
  (type (;2;) (func (param i32 i32)))
  (type (;3;) (func (param i32 i32 i32) (result i32)))
  (type (;4;) (func (param i32) (result i32)))
  (type (;5;) (func (param i32)))
  (type (;6;) (func (result i32)))
  (type (;7;) (func (param i32 i32 i32)))
  (type (;8;) (func (param i64)))
  (type (;9;) (func (param f32)))
  (type (;10;) (func (param f64)))
  (import "env" "import_e_t_get" (func (;0;) (type 4)))
  (import "env" "special_arras_memory_i32_store8" (func (;1;) (type 2)))
  (import "env" "special_func_number" (func (;2;) (type 6)))
  (import "env" "special_start_func_number" (func (;3;) (type 6)))
  (import "env" "special_printargs" (func (;4;) (type 0)))
  (import "env" "special_clear_locals" (func (;5;) (type 0)))
  (import "env" "special_arras_memory_i32_load" (func (;6;) (type 4)))
  (import "env" "special_arras_memory_i32_store" (func (;7;) (type 2)))
  (func (;8;) (type 0))
  (func (;9;) (type 0)
    i32.const 3344
    i32.const 5000
    i32.store
    i32.const 3336
    i32.const 0
    i32.store
    i32.const 3352
    i32.const 600
    i32.const 0
    call 43
    i32.const 3348
    i32.const 0
    i32.store
    i32.const 3340
    i32.const 0
    i32.store)
  (func (;10;) (type 0)
    i32.const 1076
    i32.const 0
    i32.store
    i32.const 1088
    i32.const 50
    i32.const 0
    call 43
    i32.const 1080
    i64.const 2147483648000
    i64.store align=4)
  (func (;11;) (type 0)
    i32.const 1296
    i32.const 500
    i32.store
    i32.const 1288
    i64.const 0
    i64.store align=4)
  (func (;12;) (type 0)
    i32.const 1308
    i32.const 1
    i32.store
    i32.const 1300
    i64.const 0
    i64.store align=4
    i32.const 3312
    i32.const 0
    i32.store
    i32.const 1312
    i32.const 0
    i32.const 2000
    memory.fill
    i32.const 3328
    i64.const 0
    i64.store align=4
    i32.const 3316
    i32.const 0
    i32.store)
  (func (;13;) (type 0)
    (local i32)
    global.get 0
    i32.const 48
    i32.sub
    local.tee 0
    global.set 0
    local.get 0
    i32.const 32
    i32.add
    i32.const 1056
    i32.load8_u
    i32.store8
    local.get 0
    i32.const 24
    i32.add
    i32.const 1048
    i64.load
    i64.store
    local.get 0
    i32.const 16
    i32.add
    i32.const 1040
    i64.load
    i64.store
    local.get 0
    i32.const 1032
    i64.load
    i64.store offset=8
    local.get 0
    i32.const 1024
    i64.load
    i64.store
    i32.const 10003
    call 0
    drop
    local.get 0
    local.get 0
    call 28
    call 46
    i32.const 9999
    call 0
    drop
    i32.const 1076
    i32.const 0
    i32.store
    i32.const 1088
    i32.const 50
    i32.const 0
    call 43
    i32.const 3344
    i32.const 5000
    i32.store
    i32.const 1080
    i64.const 2147483648000
    i64.store align=4
    i32.const 3336
    i32.const 0
    i32.store
    i32.const 3352
    i32.const 600
    i32.const 0
    call 43
    i32.const 1296
    i32.const 500
    i32.store
    i32.const 1308
    i32.const 1
    i32.store
    i32.const 1300
    i64.const 0
    i64.store align=4
    i32.const 1288
    i64.const 0
    i64.store align=4
    i32.const 3348
    i32.const 0
    i32.store
    i32.const 3340
    i32.const 0
    i32.store
    i32.const 3312
    i32.const 0
    i32.store
    i32.const 1312
    i32.const 0
    i32.const 2000
    memory.fill
    i32.const 3328
    i64.const 0
    i64.store align=4
    i32.const 3316
    i32.const 0
    i32.store
    i32.const 10005
    call 0
    drop
    i32.const 9999
    call 0
    drop
    local.get 0
    i32.const 48
    i32.add
    global.set 0)
  (func (;14;) (type 0)
    i32.const 3344
    i32.const 5000
    i32.store
    i32.const 3336
    i32.const 0
    i32.store
    i32.const 3352
    i32.const 600
    i32.const 0
    call 43
    i32.const 3336
    i64.const 1
    i64.store align=4
    i32.const 3348
    i32.const 0
    i32.store)
  (func (;15;) (type 5) (param i32)
    i32.const 1308
    i32.const 1
    i32.store
    i32.const 1300
    i64.const 0
    i64.store align=4
    i32.const 3312
    i32.const 0
    i32.store
    i32.const 1312
    i32.const 0
    i32.const 2000
    memory.fill
    i32.const 3332
    local.get 0
    i32.store
    i32.const 1300
    i32.const 1
    i32.store
    i32.const 3316
    i32.const 0
    i32.store
    i32.const 3328
    i32.const 0
    i32.store
    i32.const 10000
    call 0
    drop
    i32.const 3332
    i32.load
    i32.const 10000
    i32.add
    call 0
    drop
    i32.const 9999
    call 0
    drop)
  (func (;16;) (type 0)
    i32.const 1076
    i32.const 0
    i32.store
    i32.const 1088
    i32.const 50
    i32.const 0
    call 43
    i32.const 1084
    i32.const 500
    i32.store
    i32.const 1076
    i64.const 1
    i64.store align=4)
  (func (;17;) (type 0)
    i32.const 1296
    i32.const 500
    i32.store
    i32.const 1288
    i64.const 0
    i64.store align=4
    i32.const 1076
    i32.const 0
    i32.store
    i32.const 1088
    i32.const 50
    i32.const 0
    call 43
    i32.const 1288
    i32.const 1
    i32.store
    i32.const 1084
    i32.const 500
    i32.store
    i32.const 1076
    i64.const 1
    i64.store align=4)
  (func (;18;) (type 4) (param i32) (result i32)
    i32.const 119
    call 49
    block  ;; label = @1
      i32.const 1288
      i32.load
      i32.eqz
      br_if 0 (;@1;)
      i32.const 1292
      i32.load
      i32.const 1296
      i32.load
      i32.ge_s
      if  ;; label = @2
        i32.const 1296
        i32.const 500
        i32.store
        i32.const 1288
        i64.const 0
        i64.store align=4
        i32.const 1076
        i32.const 0
        i32.store
        i32.const 1088
        i32.const 50
        i32.const 0
        call 43
        i32.const 1080
        i64.const 2147483648000
        i64.store align=4
        local.get 0
        return
      end
      i32.const 10000
      call 0
      drop
      i32.const 1292
      i32.load
      i32.const 10000
      i32.add
      call 0
      drop
      local.get 0
      i32.const 10000
      i32.add
      call 0
      drop
      i32.const 9999
      call 0
      drop
      i32.const 1292
      i32.const 1292
      i32.load
      i32.const 1
      i32.add
      i32.store
      local.get 0
      i32.const 391
      i32.ne
      br_if 0 (;@1;)
      call 48
    end
    local.get 0)
  (func (;19;) (type 2) (param i32 i32)
    i32.const 149
    call 49
    local.get 0
    local.get 1
    call 1)
  (func (;20;) (type 2) (param i32 i32)
    (local i32)
    i32.const 155
    call 49
    i32.const 1300
    i32.load
    i32.const 1
    i32.eq
    if  ;; label = @1
      i32.const 3328
      i32.load
      i32.eqz
      if  ;; label = @2
        i32.const 9998
        call 0
        drop
        i32.const 3320
        local.get 0
        i32.store
        i32.const 3316
        local.get 1
        i32.store
        i32.const 10000
        call 0
        drop
      end
      local.get 1
      i32.const 10000
      i32.add
      call 0
      drop
      i32.const 3324
      local.get 0
      i32.store
      i32.const 3328
      i32.const 3328
      i32.load
      local.tee 2
      i32.const 1
      i32.add
      i32.store
      local.get 2
      i32.const 2000
      i32.rem_s
      i32.const 1312
      i32.add
      local.get 1
      i32.store8
    end
    local.get 0
    local.get 1
    call 1)
  (func (;21;) (type 0)
    i32.const 175
    call 49
    i32.const 3316
    i32.const 0
    i32.store
    i32.const 3328
    i32.const 0
    i32.store
    i32.const 9998
    call 0
    drop
    i32.const 1312
    i32.const 0
    i32.const 2000
    memory.fill)
  (func (;22;) (type 0)
    (local i32)
    i32.const 194
    call 49
    i32.const 1300
    i32.load
    if  ;; label = @1
      block  ;; label = @2
        i32.const 3316
        i32.load
        i32.const 3332
        i32.load
        i32.ne
        br_if 0 (;@2;)
        i32.const 3328
        i32.load
        i32.const 0
        i32.le_s
        br_if 0 (;@2;)
        i32.const 9999
        call 0
        drop
        i32.const 1076
        i32.const 0
        i32.store
        i32.const 1088
        i32.const 50
        i32.const 0
        call 43
        i32.const 1296
        i32.const 500
        i32.store
        i32.const 1084
        i32.const 500
        i32.store
        i32.const 1288
        i64.const 1
        i64.store align=4
        i32.const 1076
        i64.const 1
        i64.store align=4
        i32.const 1304
        i32.const 1304
        i32.load
        i32.const 1
        i32.add
        local.tee 0
        i32.store
        local.get 0
        i32.const 1308
        i32.load
        i32.lt_s
        br_if 0 (;@2;)
        i32.const 1308
        i32.const 1
        i32.store
        i32.const 1300
        i64.const 0
        i64.store align=4
        i32.const 3312
        i32.const 0
        i32.store
        i32.const 1312
        i32.const 0
        i32.const 2000
        memory.fill
        i32.const 3332
        i32.const 0
        i32.store
      end
      i32.const 3316
      i32.const 0
      i32.store
      i32.const 3328
      i32.const 0
      i32.store
      i32.const 9998
      call 0
      drop
      i32.const 1312
      i32.const 0
      i32.const 2000
      memory.fill
    end)
  (func (;23;) (type 0)
    (local i32 i32 i32)
    i32.const 229
    call 49
    call 2
    local.tee 0
    call 3
    i32.eq
    if  ;; label = @1
      call 13
    end
    block  ;; label = @1
      i32.const 1076
      i32.load
      i32.eqz
      br_if 0 (;@1;)
      i32.const 1080
      i32.load
      i32.const 1084
      i32.load
      i32.ge_s
      if  ;; label = @2
        i32.const 1076
        i32.const 0
        i32.store
        i32.const 1088
        i32.const 50
        i32.const 0
        call 43
        i32.const 1080
        i64.const 2147483648000
        i64.store align=4
        i32.const 10005
        call 0
        drop
        i32.const 9999
        call 0
        drop
        br 1 (;@1;)
      end
      i32.const 10000
      call 0
      drop
      i32.const 1080
      i32.load
      i32.const 10000
      i32.add
      call 0
      drop
      local.get 0
      i32.const 10000
      i32.add
      call 0
      drop
      call 4
      i32.const 9999
      call 0
      drop
      i32.const 1080
      i32.const 1080
      i32.load
      i32.const 1
      i32.add
      i32.store
    end
    block  ;; label = @1
      i32.const 3336
      i32.load
      i32.eqz
      br_if 0 (;@1;)
      i32.const 3340
      i32.load
      i32.const 3344
      i32.load
      i32.ge_s
      if  ;; label = @2
        i32.const 3336
        i32.const 0
        i32.store
        i32.const 10003
        call 0
        drop
        i32.const 1057
        i32.const 15
        call 46
        i32.const 9999
        call 0
        drop
        i32.const 10000
        call 0
        drop
        i32.const 3340
        i32.load
        i32.const 10000
        i32.add
        call 0
        drop
        i32.const 9999
        call 0
        drop
        i32.const 3352
        local.set 0
        i32.const 10000
        local.set 1
        loop  ;; label = @3
          local.get 0
          i32.load
          local.tee 2
          i32.const 0
          i32.gt_s
          if  ;; label = @4
            i32.const 10000
            call 0
            drop
            local.get 1
            call 0
            drop
            local.get 2
            i32.const 10000
            i32.add
            call 0
            drop
            i32.const 9999
            call 0
            drop
          end
          local.get 0
          i32.const 4
          i32.add
          local.set 0
          local.get 1
          i32.const 1
          i32.add
          local.tee 1
          i32.const 10600
          i32.ne
          br_if 0 (;@3;)
        end
        br 1 (;@1;)
      end
      local.get 0
      i32.const 2
      i32.shl
      i32.const 3352
      i32.add
      local.tee 1
      local.get 1
      i32.load
      i32.const 1
      i32.add
      i32.store
      i32.const 3340
      i32.const 3340
      i32.load
      i32.const 1
      i32.add
      i32.store
      i32.const 3348
      i32.const 3348
      i32.load
      local.tee 1
      local.get 0
      local.get 0
      local.get 1
      i32.lt_s
      select
      i32.store
    end
    call 5)
  (func (;24;) (type 3) (param i32 i32 i32) (result i32)
    (local i32 i32 i32)
    block  ;; label = @1
      local.get 2
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      i32.store8
      local.get 0
      local.get 2
      i32.add
      local.tee 3
      i32.const 1
      i32.sub
      local.get 1
      i32.store8
      local.get 2
      i32.const 3
      i32.lt_u
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      i32.store8 offset=2
      local.get 0
      local.get 1
      i32.store8 offset=1
      local.get 3
      i32.const 3
      i32.sub
      local.get 1
      i32.store8
      local.get 3
      i32.const 2
      i32.sub
      local.get 1
      i32.store8
      local.get 2
      i32.const 7
      i32.lt_u
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      i32.store8 offset=3
      local.get 3
      i32.const 4
      i32.sub
      local.get 1
      i32.store8
      local.get 2
      i32.const 9
      i32.lt_u
      br_if 0 (;@1;)
      local.get 0
      i32.const 0
      local.get 0
      i32.sub
      i32.const 3
      i32.and
      local.tee 4
      i32.add
      local.set 3
      local.get 2
      local.get 4
      i32.sub
      local.tee 4
      i32.const -4
      i32.and
      local.tee 2
      i32.const 1
      i32.sub
      local.get 4
      i32.const 4
      i32.and
      local.tee 4
      if  ;; label = @2
        local.get 2
        local.get 4
        i32.sub
        local.set 2
        loop  ;; label = @3
          local.get 3
          local.get 1
          i32.store8
          local.get 3
          i32.const 1
          i32.add
          local.set 3
          local.get 4
          i32.const 1
          i32.sub
          local.tee 4
          br_if 0 (;@3;)
        end
      end
      i32.const 7
      i32.lt_u
      br_if 0 (;@1;)
      loop  ;; label = @2
        local.get 3
        local.get 1
        i32.store8
        local.get 3
        i32.const 7
        i32.add
        local.get 1
        i32.store8
        local.get 3
        i32.const 6
        i32.add
        local.get 1
        i32.store8
        local.get 3
        i32.const 5
        i32.add
        local.get 1
        i32.store8
        local.get 3
        i32.const 4
        i32.add
        local.get 1
        i32.store8
        local.get 3
        i32.const 3
        i32.add
        local.get 1
        i32.store8
        local.get 3
        i32.const 2
        i32.add
        local.get 1
        i32.store8
        local.get 3
        i32.const 1
        i32.add
        local.get 1
        i32.store8
        local.get 3
        i32.const 8
        i32.add
        local.set 3
        local.get 2
        i32.const 8
        i32.sub
        local.tee 2
        br_if 0 (;@2;)
      end
    end
    local.get 0)
  (func (;25;) (type 3) (param i32 i32 i32) (result i32)
    (local i32 i32 i32)
    block  ;; label = @1
      local.get 2
      i32.eqz
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 2
        i32.const 7
        i32.and
        local.tee 5
        i32.eqz
        if  ;; label = @3
          local.get 0
          local.set 3
          local.get 2
          local.set 4
          br 1 (;@2;)
        end
        local.get 2
        i32.const -8
        i32.and
        local.set 4
        local.get 0
        local.set 3
        loop  ;; label = @3
          local.get 3
          local.get 1
          i32.load8_u
          i32.store8
          local.get 3
          i32.const 1
          i32.add
          local.set 3
          local.get 1
          i32.const 1
          i32.add
          local.set 1
          local.get 5
          i32.const 1
          i32.sub
          local.tee 5
          br_if 0 (;@3;)
        end
      end
      local.get 2
      i32.const 8
      i32.lt_u
      br_if 0 (;@1;)
      loop  ;; label = @2
        local.get 3
        local.get 1
        i64.load align=1
        i64.store align=1
        local.get 3
        i32.const 8
        i32.add
        local.set 3
        local.get 1
        i32.const 8
        i32.add
        local.set 1
        local.get 4
        i32.const 8
        i32.sub
        local.tee 4
        br_if 0 (;@2;)
      end
    end
    local.get 0)
  (func (;26;) (type 3) (param i32 i32 i32) (result i32)
    (local i32 i32 i32)
    block  ;; label = @1
      local.get 2
      i32.eqz
      br_if 0 (;@1;)
      loop  ;; label = @2
        local.get 0
        i32.load8_u
        local.tee 4
        local.get 1
        i32.load8_u
        local.tee 5
        i32.eq
        if  ;; label = @3
          local.get 1
          i32.const 1
          i32.add
          local.set 1
          local.get 0
          i32.const 1
          i32.add
          local.set 0
          local.get 2
          i32.const 1
          i32.sub
          local.tee 2
          br_if 1 (;@2;)
          br 2 (;@1;)
        end
      end
      local.get 4
      local.get 5
      i32.sub
      local.set 3
    end
    local.get 3)
  (func (;27;) (type 3) (param i32 i32 i32) (result i32)
    local.get 2
    if  ;; label = @1
      local.get 1
      i32.const 255
      i32.and
      local.set 1
      loop  ;; label = @2
        local.get 1
        local.get 0
        i32.load8_u
        i32.eq
        if  ;; label = @3
          local.get 0
          return
        end
        local.get 0
        i32.const 1
        i32.add
        local.set 0
        local.get 2
        i32.const 1
        i32.sub
        local.tee 2
        br_if 0 (;@2;)
      end
    end
    i32.const 0)
  (func (;28;) (type 4) (param i32) (result i32)
    (local i32 i32)
    loop  ;; label = @1
      local.get 0
      local.get 1
      i32.add
      local.get 1
      i32.const 1
      i32.add
      local.set 1
      i32.load8_u
      br_if 0 (;@1;)
    end
    local.get 1
    i32.const 1
    i32.sub)
  (func (;29;) (type 1) (param i32 i32) (result i32)
    (local i32)
    local.get 1
    i32.const 255
    i32.and
    local.tee 1
    i32.eqz
    if  ;; label = @1
      local.get 0
      call 28
      local.get 0
      i32.add
      return
    end
    local.get 0
    i32.const 1
    i32.sub
    local.set 0
    loop  ;; label = @1
      local.get 0
      i32.const 1
      i32.add
      local.tee 0
      i32.load8_u
      local.tee 2
      if  ;; label = @2
        local.get 1
        local.get 2
        i32.ne
        br_if 1 (;@1;)
      end
    end
    local.get 0)
  (func (;30;) (type 1) (param i32 i32) (result i32)
    (local i32 i32 i32 i32)
    global.get 0
    i32.const 32
    i32.sub
    local.tee 3
    global.set 0
    block (result i32)  ;; label = @1
      local.get 1
      i32.load8_u
      local.tee 2
      i32.eqz
      if  ;; label = @2
        local.get 0
        call 28
        br 1 (;@1;)
      end
      local.get 1
      i32.load8_u offset=1
      i32.eqz
      if  ;; label = @2
        i32.const 0
        local.set 1
        loop  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.const 1
            i32.add
            local.set 4
            local.get 0
            local.get 1
            i32.add
            i32.load8_u
            local.tee 5
            i32.eqz
            br_if 0 (;@4;)
            local.get 4
            local.set 1
            local.get 2
            local.get 5
            i32.ne
            br_if 1 (;@3;)
          end
        end
        local.get 4
        i32.const 1
        i32.sub
        br 1 (;@1;)
      end
      local.get 3
      i32.const 24
      i32.add
      i64.const 0
      i64.store
      local.get 3
      i32.const 16
      i32.add
      i64.const 0
      i64.store
      local.get 3
      i64.const 0
      i64.store offset=8
      local.get 3
      i64.const 0
      i64.store
      local.get 1
      i32.const 1
      i32.add
      local.set 1
      loop  ;; label = @2
        local.get 3
        local.get 2
        i32.const 3
        i32.shr_u
        i32.const 28
        i32.and
        i32.add
        local.tee 4
        local.get 4
        i32.load
        i32.const 1
        local.get 2
        i32.shl
        i32.or
        i32.store
        local.get 1
        i32.load8_u
        local.set 2
        local.get 1
        i32.const 1
        i32.add
        local.set 1
        local.get 2
        br_if 0 (;@2;)
      end
      block  ;; label = @2
        local.get 0
        local.tee 1
        i32.load8_u
        local.tee 2
        i32.eqz
        br_if 0 (;@2;)
        loop  ;; label = @3
          local.get 3
          local.get 2
          i32.const 3
          i32.shr_u
          i32.const 28
          i32.and
          i32.add
          i32.load
          local.get 2
          i32.shr_u
          i32.const 1
          i32.and
          br_if 1 (;@2;)
          local.get 1
          i32.const 1
          i32.add
          local.tee 1
          i32.load8_u
          local.tee 2
          br_if 0 (;@3;)
        end
      end
      local.get 1
      local.get 0
      i32.sub
    end
    local.get 3
    i32.const 32
    i32.add
    global.set 0)
  (func (;31;) (type 3) (param i32 i32 i32) (result i32)
    (local i32 i32)
    local.get 2
    i32.eqz
    if  ;; label = @1
      i32.const 0
      return
    end
    block  ;; label = @1
      local.get 0
      i32.load8_u
      local.tee 3
      i32.eqz
      if  ;; label = @2
        i32.const 0
        local.set 3
        br 1 (;@1;)
      end
      local.get 0
      i32.const 1
      i32.add
      local.set 0
      local.get 2
      i32.const 1
      i32.sub
      local.set 2
      block  ;; label = @2
        loop  ;; label = @3
          local.get 3
          local.get 1
          i32.load8_u
          local.tee 4
          i32.ne
          br_if 1 (;@2;)
          local.get 4
          i32.eqz
          br_if 1 (;@2;)
          local.get 2
          i32.eqz
          br_if 1 (;@2;)
          local.get 2
          i32.const 1
          i32.sub
          local.set 2
          local.get 1
          i32.const 1
          i32.add
          local.set 1
          local.get 0
          i32.load8_u
          local.set 3
          local.get 0
          i32.const 1
          i32.add
          local.set 0
          local.get 3
          br_if 0 (;@3;)
        end
        i32.const 0
        local.set 3
      end
    end
    local.get 3
    local.get 1
    i32.load8_u
    i32.sub)
  (func (;32;) (type 1) (param i32 i32) (result i32)
    (local i32 i32 i32 i32)
    global.get 0
    i32.const 32
    i32.sub
    local.tee 3
    global.set 0
    block (result i32)  ;; label = @1
      local.get 1
      i32.load8_u
      local.tee 2
      i32.eqz
      if  ;; label = @2
        local.get 0
        call 28
        br 1 (;@1;)
      end
      local.get 1
      i32.load8_u offset=1
      i32.eqz
      if  ;; label = @2
        i32.const 0
        local.set 1
        loop  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.const 1
            i32.add
            local.set 4
            local.get 0
            local.get 1
            i32.add
            i32.load8_u
            local.tee 5
            i32.eqz
            br_if 0 (;@4;)
            local.get 4
            local.set 1
            local.get 2
            local.get 5
            i32.ne
            br_if 1 (;@3;)
          end
        end
        local.get 4
        i32.const 1
        i32.sub
        br 1 (;@1;)
      end
      local.get 3
      i32.const 24
      i32.add
      i64.const 0
      i64.store
      local.get 3
      i32.const 16
      i32.add
      i64.const 0
      i64.store
      local.get 3
      i64.const 0
      i64.store offset=8
      local.get 3
      i64.const 0
      i64.store
      local.get 1
      i32.const 1
      i32.add
      local.set 1
      loop  ;; label = @2
        local.get 3
        local.get 2
        i32.const 3
        i32.shr_u
        i32.const 28
        i32.and
        i32.add
        local.tee 4
        local.get 4
        i32.load
        i32.const 1
        local.get 2
        i32.shl
        i32.or
        i32.store
        local.get 1
        i32.load8_u
        local.set 2
        local.get 1
        i32.const 1
        i32.add
        local.set 1
        local.get 2
        br_if 0 (;@2;)
      end
      block  ;; label = @2
        local.get 0
        local.tee 1
        i32.load8_u
        local.tee 2
        i32.eqz
        br_if 0 (;@2;)
        loop  ;; label = @3
          local.get 3
          local.get 2
          i32.const 3
          i32.shr_u
          i32.const 28
          i32.and
          i32.add
          i32.load
          local.get 2
          i32.shr_u
          i32.const 1
          i32.and
          br_if 1 (;@2;)
          local.get 1
          i32.const 1
          i32.add
          local.tee 1
          i32.load8_u
          local.tee 2
          br_if 0 (;@3;)
        end
      end
      local.get 1
      local.get 0
      i32.sub
    end
    local.get 0
    i32.add
    local.tee 0
    i32.load8_u
    local.set 1
    local.get 3
    i32.const 32
    i32.add
    global.set 0
    local.get 0
    i32.const 0
    local.get 1
    select)
  (func (;33;) (type 1) (param i32 i32) (result i32)
    (local i32 i32)
    block  ;; label = @1
      local.get 1
      i32.const 255
      i32.and
      local.tee 3
      i32.eqz
      if  ;; label = @2
        local.get 0
        call 28
        local.get 0
        i32.add
        local.tee 0
        i32.load8_u
        local.set 2
        i32.const 0
        local.set 1
        br 1 (;@1;)
      end
      local.get 0
      i32.const 1
      i32.sub
      local.set 0
      loop  ;; label = @2
        local.get 0
        i32.const 1
        i32.add
        local.tee 0
        i32.load8_u
        local.tee 2
        i32.eqz
        br_if 1 (;@1;)
        local.get 2
        local.get 3
        i32.ne
        br_if 0 (;@2;)
      end
    end
    local.get 0
    i32.const 0
    local.get 2
    local.get 1
    i32.const 255
    i32.and
    i32.eq
    select)
  (func (;34;) (type 1) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      local.get 1
      i32.load8_u
      local.tee 4
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.const 2
      i32.add
      local.set 0
      loop  ;; label = @2
        block  ;; label = @3
          local.get 0
          i32.const 1
          i32.add
          local.set 2
          local.get 0
          i32.const 2
          i32.sub
          i32.load8_u
          local.tee 3
          i32.eqz
          br_if 0 (;@3;)
          local.get 2
          local.set 0
          local.get 3
          local.get 4
          i32.ne
          br_if 1 (;@2;)
        end
      end
      i32.const 0
      local.set 0
      local.get 3
      local.get 4
      i32.ne
      br_if 0 (;@1;)
      local.get 2
      i32.const 3
      i32.sub
      local.set 3
      local.get 1
      i32.load8_u offset=1
      local.tee 7
      i32.eqz
      if  ;; label = @2
        local.get 3
        return
      end
      local.get 2
      i32.const 2
      i32.sub
      i32.load8_u
      local.tee 5
      i32.eqz
      br_if 0 (;@1;)
      local.get 1
      i32.load8_u offset=2
      local.tee 8
      i32.eqz
      if  ;; label = @2
        local.get 3
        local.set 0
        local.get 5
        local.get 7
        i32.eq
        br_if 1 (;@1;)
        local.get 2
        i32.const 1
        i32.sub
        local.set 0
        local.get 4
        i32.const 8
        i32.shl
        local.tee 1
        local.get 7
        i32.or
        local.set 2
        local.get 1
        local.get 5
        i32.or
        local.set 1
        loop  ;; label = @3
          block  ;; label = @4
            local.get 0
            i32.load8_u
            local.set 3
            local.get 0
            i32.const 1
            i32.add
            local.set 0
            local.get 3
            i32.eqz
            br_if 0 (;@4;)
            local.get 1
            i32.const 8
            i32.shl
            i32.const 65280
            i32.and
            local.get 3
            i32.or
            local.tee 1
            local.get 2
            i32.ne
            br_if 1 (;@3;)
          end
        end
        local.get 0
        i32.const 2
        i32.sub
        i32.const 0
        local.get 3
        select
        return
      end
      local.get 2
      i32.const 1
      i32.sub
      i32.load8_u
      local.tee 6
      i32.eqz
      br_if 0 (;@1;)
      local.get 1
      i32.load8_u offset=3
      i32.eqz
      if  ;; label = @2
        local.get 3
        local.set 0
        local.get 6
        i32.const 8
        i32.shl
        local.get 5
        i32.const 16
        i32.shl
        i32.or
        local.tee 1
        local.get 7
        i32.const 16
        i32.shl
        local.get 8
        i32.const 8
        i32.shl
        i32.or
        local.tee 3
        i32.eq
        br_if 1 (;@1;)
        local.get 3
        local.get 4
        i32.const 24
        i32.shl
        local.tee 0
        i32.or
        local.set 4
        local.get 0
        local.get 1
        i32.or
        local.set 1
        loop  ;; label = @3
          block  ;; label = @4
            local.get 2
            i32.const 1
            i32.add
            local.set 0
            local.get 2
            i32.load8_u
            local.tee 3
            i32.eqz
            br_if 0 (;@4;)
            local.get 0
            local.set 2
            local.get 1
            local.get 3
            i32.or
            i32.const 8
            i32.shl
            local.tee 1
            local.get 4
            i32.ne
            br_if 1 (;@3;)
          end
        end
        local.get 0
        i32.const 3
        i32.sub
        i32.const 0
        local.get 3
        select
        return
      end
      local.get 2
      i32.load8_u
      i32.eqz
      br_if 0 (;@1;)
      local.get 1
      i32.load8_u offset=4
      i32.eqz
      if  ;; label = @2
        local.get 3
        i32.const 3
        i32.add
        local.set 0
        local.get 3
        i32.load8_u offset=3
        local.tee 2
        i32.const 0
        i32.ne
        local.set 4
        block  ;; label = @3
          local.get 2
          i32.eqz
          br_if 0 (;@3;)
          local.get 3
          i32.load8_u offset=1
          i32.const 16
          i32.shl
          local.get 3
          i32.load8_u
          i32.const 24
          i32.shl
          i32.or
          local.get 3
          i32.load8_u offset=2
          i32.const 8
          i32.shl
          i32.or
          local.get 2
          i32.or
          local.tee 3
          local.get 1
          i32.load align=1
          local.tee 1
          i32.const 24
          i32.shl
          local.get 1
          i32.const 65280
          i32.and
          i32.const 8
          i32.shl
          i32.or
          local.get 1
          i32.const 8
          i32.shr_u
          i32.const 65280
          i32.and
          local.get 1
          i32.const 24
          i32.shr_u
          i32.or
          i32.or
          local.tee 2
          i32.eq
          br_if 0 (;@3;)
          loop  ;; label = @4
            local.get 0
            i32.const 1
            i32.add
            local.tee 0
            i32.load8_u
            local.tee 1
            i32.const 0
            i32.ne
            local.set 4
            local.get 1
            i32.eqz
            br_if 1 (;@3;)
            local.get 3
            i32.const 8
            i32.shl
            local.get 1
            i32.or
            local.tee 3
            local.get 2
            i32.ne
            br_if 0 (;@4;)
          end
        end
        local.get 0
        i32.const 3
        i32.sub
        i32.const 0
        local.get 4
        select
        return
      end
      i32.const 0
      local.set 4
      i32.const 0
      local.set 6
      global.get 0
      i32.const 1056
      i32.sub
      local.tee 10
      global.set 0
      local.get 10
      i32.const 1048
      i32.add
      i64.const 0
      i64.store
      local.get 10
      i32.const 1040
      i32.add
      i64.const 0
      i64.store
      local.get 10
      i64.const 0
      i64.store offset=1032
      local.get 10
      i64.const 0
      i64.store offset=1024
      i32.const -1
      local.set 5
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            local.tee 7
            i32.load8_u
            local.tee 1
            if  ;; label = @5
              local.get 7
              i32.const 1
              i32.add
              local.set 2
              loop  ;; label = @6
                local.get 0
                local.get 3
                i32.add
                i32.load8_u
                i32.eqz
                br_if 4 (;@2;)
                local.get 10
                local.get 1
                i32.const 255
                i32.and
                i32.const 2
                i32.shl
                i32.add
                local.get 0
                i32.const 1
                i32.add
                local.tee 6
                i32.store
                local.get 10
                i32.const 1024
                i32.add
                local.get 1
                i32.const 3
                i32.shr_u
                i32.const 28
                i32.and
                i32.add
                local.tee 8
                local.get 8
                i32.load
                i32.const 1
                local.get 1
                i32.shl
                i32.or
                i32.store
                local.get 0
                local.get 2
                i32.add
                local.get 6
                local.set 0
                i32.load8_u
                local.tee 1
                br_if 0 (;@6;)
              end
              local.get 0
              i32.const 2
              i32.ge_u
              br_if 1 (;@4;)
            end
            i32.const 1
            local.set 8
            i32.const -1
            local.set 4
            i32.const 1
            local.set 9
            br 1 (;@3;)
          end
          i32.const 0
          local.set 0
          i32.const 1
          local.set 2
          i32.const 1
          local.set 8
          i32.const 1
          local.set 1
          loop  ;; label = @4
            block (result i32)  ;; label = @5
              local.get 5
              local.get 7
              i32.add
              local.get 1
              i32.add
              i32.load8_u
              local.tee 4
              local.get 2
              local.get 7
              i32.add
              i32.load8_u
              local.tee 11
              i32.eq
              if  ;; label = @6
                local.get 1
                local.get 8
                i32.eq
                if  ;; label = @7
                  local.get 0
                  local.get 8
                  i32.add
                  local.set 0
                  i32.const 1
                  br 2 (;@5;)
                end
                local.get 1
                i32.const 1
                i32.add
                br 1 (;@5;)
              end
              local.get 4
              local.get 11
              i32.gt_u
              if  ;; label = @6
                local.get 2
                local.get 5
                i32.sub
                local.set 8
                local.get 2
                local.set 0
                i32.const 1
                br 1 (;@5;)
              end
              local.get 0
              local.tee 5
              i32.const 1
              i32.add
              local.set 0
              i32.const 1
              local.set 8
              i32.const 1
            end
            local.tee 1
            local.get 0
            i32.add
            local.tee 2
            local.get 6
            i32.lt_u
            br_if 0 (;@4;)
          end
          i32.const -1
          local.set 4
          i32.const 0
          local.set 0
          i32.const 1
          local.set 2
          i32.const 1
          local.set 9
          i32.const 1
          local.set 1
          loop  ;; label = @4
            block (result i32)  ;; label = @5
              local.get 4
              local.get 7
              i32.add
              local.get 1
              i32.add
              i32.load8_u
              local.tee 11
              local.get 2
              local.get 7
              i32.add
              i32.load8_u
              local.tee 12
              i32.eq
              if  ;; label = @6
                local.get 1
                local.get 9
                i32.eq
                if  ;; label = @7
                  local.get 0
                  local.get 9
                  i32.add
                  local.set 0
                  i32.const 1
                  br 2 (;@5;)
                end
                local.get 1
                i32.const 1
                i32.add
                br 1 (;@5;)
              end
              local.get 11
              local.get 12
              i32.lt_u
              if  ;; label = @6
                local.get 2
                local.get 4
                i32.sub
                local.set 9
                local.get 2
                local.set 0
                i32.const 1
                br 1 (;@5;)
              end
              local.get 0
              local.tee 4
              i32.const 1
              i32.add
              local.set 0
              i32.const 1
              local.set 9
              i32.const 1
            end
            local.tee 1
            local.get 0
            i32.add
            local.tee 2
            local.get 6
            i32.lt_u
            br_if 0 (;@4;)
          end
        end
        local.get 9
        local.get 8
        local.get 4
        i32.const 1
        i32.add
        local.get 5
        i32.const 1
        i32.add
        i32.gt_u
        local.tee 0
        select
        local.set 9
        block (result i32)  ;; label = @3
          block  ;; label = @4
            local.get 4
            local.get 5
            local.get 0
            select
            local.tee 5
            i32.const 1
            i32.add
            local.tee 12
            if  ;; label = @5
              local.get 7
              local.set 1
              local.get 12
              local.set 0
              loop  ;; label = @6
                local.get 1
                i32.load8_u
                local.get 1
                local.get 9
                i32.add
                i32.load8_u
                i32.ne
                br_if 2 (;@4;)
                local.get 1
                i32.const 1
                i32.add
                local.set 1
                local.get 0
                i32.const 1
                i32.sub
                local.tee 0
                br_if 0 (;@6;)
              end
            end
            local.get 6
            local.get 9
            i32.sub
            br 1 (;@3;)
          end
          local.get 5
          local.get 6
          local.get 5
          i32.const -1
          i32.xor
          i32.add
          local.tee 0
          local.get 0
          local.get 5
          i32.lt_u
          select
          i32.const 1
          i32.add
          local.set 9
          i32.const 0
        end
        local.set 8
        local.get 7
        i32.const 1
        i32.add
        local.set 15
        i32.const 1
        local.get 12
        i32.sub
        local.set 16
        local.get 6
        i32.const 63
        i32.or
        local.set 13
        i32.const 0
        local.set 1
        local.get 3
        local.set 0
        loop  ;; label = @3
          local.get 1
          local.set 11
          block  ;; label = @4
            local.get 3
            local.get 0
            local.tee 4
            i32.sub
            local.tee 0
            local.get 6
            i32.ge_u
            br_if 0 (;@4;)
            local.get 3
            local.set 1
            local.get 13
            local.set 2
            block  ;; label = @5
              loop  ;; label = @6
                local.get 1
                i32.load8_u
                i32.eqz
                br_if 1 (;@5;)
                local.get 0
                i32.const 1
                i32.add
                local.set 0
                local.get 1
                i32.const 1
                i32.add
                local.set 1
                local.get 2
                i32.const 1
                i32.sub
                local.tee 2
                br_if 0 (;@6;)
              end
              local.get 3
              local.get 13
              i32.add
              local.set 3
              br 1 (;@4;)
            end
            local.get 1
            local.set 3
            local.get 0
            local.get 6
            i32.ge_u
            br_if 0 (;@4;)
            i32.const 0
            local.set 4
            br 2 (;@2;)
          end
          i32.const 0
          local.set 1
          local.get 10
          i32.const 1024
          i32.add
          local.get 4
          local.get 6
          i32.add
          local.tee 0
          i32.const 1
          i32.sub
          i32.load8_u
          local.tee 2
          i32.const 3
          i32.shr_u
          i32.const 28
          i32.and
          i32.add
          i32.load
          local.get 2
          i32.shr_u
          i32.const 1
          i32.and
          i32.eqz
          br_if 0 (;@3;)
          local.get 10
          local.get 2
          i32.const 2
          i32.shl
          i32.add
          i32.load
          local.tee 0
          local.get 6
          i32.ne
          if  ;; label = @4
            local.get 4
            local.get 6
            local.get 0
            i32.sub
            local.tee 0
            local.get 11
            local.get 0
            local.get 11
            i32.gt_u
            select
            i32.add
            local.set 0
            br 1 (;@3;)
          end
          local.get 5
          local.set 1
          block  ;; label = @4
            local.get 7
            local.get 12
            local.get 11
            local.get 11
            local.get 12
            i32.lt_u
            select
            local.tee 14
            i32.add
            i32.load8_u
            local.tee 0
            if  ;; label = @5
              local.get 14
              local.get 15
              i32.add
              local.set 2
              local.get 4
              local.get 14
              i32.add
              local.set 1
              loop  ;; label = @6
                local.get 1
                i32.load8_u
                local.get 0
                i32.const 255
                i32.and
                i32.ne
                br_if 2 (;@4;)
                local.get 1
                i32.const 1
                i32.add
                local.set 1
                local.get 2
                i32.load8_u
                local.set 0
                local.get 2
                i32.const 1
                i32.add
                local.set 2
                local.get 0
                br_if 0 (;@6;)
              end
              local.get 5
              local.set 1
            end
            loop  ;; label = @5
              local.get 1
              i32.const 1
              i32.add
              local.get 11
              i32.le_u
              br_if 3 (;@2;)
              local.get 1
              local.get 4
              i32.add
              local.set 0
              local.get 1
              local.get 7
              i32.add
              local.get 1
              i32.const 1
              i32.sub
              local.set 1
              i32.load8_u
              local.get 0
              i32.load8_u
              i32.eq
              br_if 0 (;@5;)
            end
            local.get 4
            local.get 9
            i32.add
            local.set 0
            local.get 8
            local.set 1
            br 1 (;@3;)
          end
          local.get 1
          local.get 16
          i32.add
          local.set 0
          i32.const 0
          local.set 1
          br 0 (;@3;)
        end
        unreachable
      end
      local.get 10
      i32.const 1056
      i32.add
      global.set 0
      local.get 4
      local.set 0
    end
    local.get 0)
  (func (;35;) (type 0)
    i32.const 10000
    call 0
    drop)
  (func (;36;) (type 5) (param i32)
    local.get 0
    i32.const 10000
    i32.add
    call 0
    drop)
  (func (;37;) (type 8) (param i64)
    i32.const 799789
    call 0
    drop
    local.get 0
    i32.wrap_i64
    i32.const 10000
    i32.add
    call 0
    drop)
  (func (;38;) (type 9) (param f32)
    i32.const 133123
    call 0
    drop
    local.get 0
    i32.trunc_sat_f32_s
    i32.const 10000
    i32.add
    call 0
    drop)
  (func (;39;) (type 10) (param f64)
    i32.const 466456
    call 0
    drop
    local.get 0
    i32.trunc_sat_f64_s
    i32.const 10000
    i32.add
    call 0
    drop)
  (func (;40;) (type 0)
    i32.const 9999
    call 0
    drop)
  (func (;41;) (type 1) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 0
    local.get 1
    i32.gt_s
    select)
  (func (;42;) (type 1) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 0
    local.get 1
    i32.lt_s
    select)
  (func (;43;) (type 7) (param i32 i32 i32)
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
  (func (;44;) (type 7) (param i32 i32 i32)
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
  (func (;45;) (type 3) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32)
    local.get 2
    i32.const 0
    i32.gt_s
    if  ;; label = @1
      loop  ;; label = @2
        local.get 3
        i32.const 2147483644
        i32.and
        local.get 0
        i32.add
        local.tee 6
        call 6
        local.set 4
        local.get 1
        local.get 3
        i32.add
        i32.load8_u
        local.set 5
        local.get 6
        block (result i32)  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  local.get 3
                  i32.const 3
                  i32.and
                  i32.const 1
                  i32.sub
                  br_table 1 (;@6;) 2 (;@5;) 3 (;@4;) 0 (;@7;)
                end
                local.get 4
                i32.const -256
                i32.and
                local.get 5
                i32.or
                br 3 (;@3;)
              end
              local.get 4
              i32.const -65281
              i32.and
              local.get 5
              i32.const 8
              i32.shl
              i32.or
              br 2 (;@3;)
            end
            local.get 4
            i32.const -16711681
            i32.and
            local.get 5
            i32.const 16
            i32.shl
            i32.or
            br 1 (;@3;)
          end
          local.get 4
          i32.const 16777215
          i32.and
          local.get 5
          i32.const 24
          i32.shl
          i32.or
        end
        call 7
        local.get 2
        local.get 3
        i32.const 1
        i32.add
        local.tee 3
        i32.ne
        br_if 0 (;@2;)
      end
    end
    i32.const 9999
    call 0
    drop
    local.get 0)
  (func (;46;) (type 2) (param i32 i32)
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
  (func (;47;) (type 2) (param i32 i32)
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
  (func (;48;) (type 0)
    i32.const 10006
    call 0
    drop
    i32.const 9999
    call 0
    drop)
  (func (;49;) (type 5) (param i32)
    i32.const 5752
    i32.const 123456
    call 6
    local.get 0
    i32.add
    i32.const 5752
    i32.load
    i32.add
    i32.store)
  (memory (;0;) 5)
  (global (;0;) (mut i32) (i32.const 71296))
  (global (;1;) i32 (i32.const 1076))
  (global (;2;) i32 (i32.const 5752))
  (global (;3;) i32 (i32.const 1024))
  (global (;4;) i32 (i32.const 5756))
  (global (;5;) i32 (i32.const 5760))
  (global (;6;) i32 (i32.const 71296))
  (global (;7;) i32 (i32.const 1024))
  (global (;8;) i32 (i32.const 71296))
  (global (;9;) i32 (i32.const 327680))
  (global (;10;) i32 (i32.const 0))
  (global (;11;) i32 (i32.const 1))
  (global (;12;) i32 (i32.const 65536))
  (export "memory" (memory 0))
  (export "__wasm_call_ctors" (func 8))
  (export "_reset_stats" (func 9))
  (export "poopState" (global 1))
  (export "memset_i32" (func 43))
  (export "_reset_debug" (func 10))
  (export "_reset_bigfunc_trace" (func 11))
  (export "_reset_chacha" (func 12))
  (export "memset_i8" (func 44))
  (export "_init_all_the_things" (func 13))
  (export "strlen" (func 28))
  (export "_hxh_add_char_string_microcode" (func 46))
  (export "export_enable_stats" (func 14))
  (export "export_chacha_enable" (func 15))
  (export "export_enable_debug" (func 16))
  (export "export_enable_bigfunc_trace" (func 17))
  (export "_special_bigfunc_beforebranch" (func 18))
  (export "export_nothing" (func 49))
  (export "_hxh_breakpoint" (func 48))
  (export "_special_bigfunc_chachabyte_1" (func 19))
  (export "_special_bigfunc_chachabyte_2" (func 20))
  (export "_special_bigfunc_chachafinish_1" (func 21))
  (export "_special_bigfunc_chachafinish_2" (func 22))
  (export "inject_all" (func 23))
  (export "max_i32" (func 41))
  (export "memset" (func 24))
  (export "memcpy" (func 25))
  (export "memcmp" (func 26))
  (export "memchr" (func 27))
  (export "__strchrnul" (func 29))
  (export "strcspn" (func 30))
  (export "strncmp" (func 31))
  (export "strpbrk" (func 32))
  (export "strchr" (func 33))
  (export "strstr" (func 34))
  (export "_special_printargs_begin" (func 35))
  (export "_special_printargs_per_arg_i32" (func 36))
  (export "_special_printargs_per_arg_i64" (func 37))
  (export "_special_printargs_per_arg_f32" (func 38))
  (export "_special_printargs_per_arg_f64" (func 39))
  (export "_special_printargs_end" (func 40))
  (export "min_i32" (func 42))
  (export "memcpy_i8_to_arras_memory" (func 45))
  (export "_hxh_add_int_string_microcode" (func 47))
  (export "nothing_state" (global 2))
  (export "__dso_handle" (global 3))
  (export "__data_end" (global 4))
  (export "__stack_low" (global 5))
  (export "__stack_high" (global 6))
  (export "__global_base" (global 7))
  (export "__heap_base" (global 8))
  (export "__heap_end" (global 9))
  (export "__memory_base" (global 10))
  (export "__table_base" (global 11))
  (export "__wasm_first_page_end" (global 12))
  (data (;0;) (i32.const 1024) "Banna Turd Labs?! still looking.\00The total is..."))
