(module
  (type (;0;) (func))
  (type (;1;) (func (param i32 i32) (result i32)))
  (type (;2;) (func (param i32 i32)))
  (type (;3;) (func (param i32) (result i32)))
  (type (;4;) (func (result i32)))
  (type (;5;) (func (param i32 i32 i32) (result i32)))
  (type (;6;) (func (param i32)))
  (type (;7;) (func (param i32 i32 i32 i32)))
  (type (;8;) (func (param i64) (result i64)))
  (type (;9;) (func (param i64 i64) (result i64)))
  (type (;10;) (func (param i32 i32 i32)))
  (type (;11;) (func (param i32 i64) (result i32)))
  (type (;12;) (func (param i64)))
  (type (;13;) (func (param f32)))
  (type (;14;) (func (param f64)))
  (type (;15;) (func (param i32 i64)))
  (type (;16;) (func (param i32 f32)))
  (type (;17;) (func (param i32 f64)))
  (type (;18;) (func (param i32) (result i64)))
  (type (;19;) (func (param i32) (result f32)))
  (type (;20;) (func (param i32) (result f64)))
  (type (;21;) (func (param i64) (result i32)))
  (import "env" "special_arras_memory_memory_size" (func (;0;) (type 4)))
  (import "env" "special_arras_memory_i32_load" (func (;1;) (type 3)))
  (import "env" "special_arras_memory_i32_store8" (func (;2;) (type 2)))
  (import "env" "special_func_number" (func (;3;) (type 4)))
  (import "env" "special_start_func_number" (func (;4;) (type 4)))
  (import "env" "special_printargs" (func (;5;) (type 0)))
  (import "env" "special_clear_locals" (func (;6;) (type 0)))
  (import "env" "import_e_t_get" (func (;7;) (type 3)))
  (import "env" "special_arras_memory_i32_store" (func (;8;) (type 2)))
  (func (;9;) (type 0))
  (func (;10;) (type 0)
    i32.const 3480
    i32.const 5000
    i32.store
    i32.const 3472
    i32.const 0
    i32.store
    i32.const 3488
    i32.const 600
    i32.const 0
    call 70
    i32.const 3484
    i32.const 0
    i32.store
    i32.const 3476
    i32.const 0
    i32.store)
  (func (;11;) (type 0)
    i32.const 1216
    i32.const 0
    i32.store
    i32.const 1228
    i32.const 50
    i32.const 0
    call 70
    i32.const 1220
    i64.const 2147483648000
    i64.store align=4)
  (func (;12;) (type 0)
    i32.const 1436
    i32.const 500
    i32.store
    i32.const 1428
    i64.const 0
    i64.store align=4)
  (func (;13;) (type 0)
    i32.const 1448
    i32.const 1
    i32.store
    i32.const 1440
    i64.const 0
    i64.store align=4
    i32.const 1452
    i32.const 0
    i32.const 2000
    memory.fill
    i32.const 3464
    i64.const 0
    i64.store align=4
    i32.const 3452
    i32.const 0
    i32.store)
  (func (;14;) (type 0)
    (local i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 0
    global.set 0
    local.get 0
    i32.const 1087
    i32.store offset=4
    local.get 0
    i32.const 0
    i32.store
    i32.const 1135
    local.get 0
    call 29
    i32.const 1216
    i32.const 0
    i32.store
    i32.const 1228
    i32.const 50
    i32.const 0
    call 70
    i32.const 3480
    i32.const 5000
    i32.store
    i32.const 1220
    i64.const 2147483648000
    i64.store align=4
    i32.const 3472
    i32.const 0
    i32.store
    i32.const 3488
    i32.const 600
    i32.const 0
    call 70
    i32.const 1436
    i32.const 500
    i32.store
    i32.const 1448
    i32.const 1
    i32.store
    i32.const 1440
    i64.const 0
    i64.store align=4
    i32.const 1428
    i64.const 0
    i64.store align=4
    i32.const 3484
    i32.const 0
    i32.store
    i32.const 3476
    i32.const 0
    i32.store
    i32.const 1452
    i32.const 0
    i32.const 2000
    memory.fill
    i32.const 3464
    i64.const 0
    i64.store align=4
    i32.const 3452
    i32.const 0
    i32.store
    i64.const 5
    call 74
    drop
    i32.const 9999
    call 7
    drop
    local.get 0
    i32.const 16
    i32.add
    global.set 0)
  (func (;15;) (type 0)
    i32.const 3480
    i32.const 5000
    i32.store
    i32.const 3472
    i32.const 0
    i32.store
    i32.const 3488
    i32.const 600
    i32.const 0
    call 70
    i32.const 3472
    i64.const 1
    i64.store align=4
    i32.const 3484
    i32.const 0
    i32.store)
  (func (;16;) (type 6) (param i32)
    i32.const 1448
    i32.const 1
    i32.store
    i32.const 1440
    i64.const 0
    i64.store align=4
    i32.const 1452
    i32.const 0
    i32.const 2000
    memory.fill
    i32.const 3468
    local.get 0
    i32.store
    i32.const 1440
    i32.const 1
    i32.store
    i32.const 3452
    i32.const 0
    i32.store
    i32.const 3464
    i32.const 0
    i32.store
    i64.const 0
    call 74
    drop
    i32.const 3468
    i64.load32_s
    call 74
    drop
    i32.const 9999
    call 7
    drop)
  (func (;17;) (type 0)
    i32.const 1216
    i32.const 0
    i32.store
    i32.const 1228
    i32.const 50
    i32.const 0
    call 70
    i32.const 1224
    i32.const 500
    i32.store
    i32.const 1216
    i64.const 1
    i64.store align=4)
  (func (;18;) (type 0)
    i32.const 1436
    i32.const 500
    i32.store
    i32.const 1428
    i64.const 0
    i64.store align=4
    i32.const 1216
    i32.const 0
    i32.store
    i32.const 1228
    i32.const 50
    i32.const 0
    call 70
    i32.const 1428
    i32.const 1
    i32.store
    i32.const 1224
    i32.const 500
    i32.store
    i32.const 1216
    i64.const 1
    i64.store align=4)
  (func (;19;) (type 0)
    i64.const 0
    call 74
    drop
    call 0
    i64.extend_i32_s
    call 74
    drop
    i32.const 9999
    call 7
    drop)
  (func (;20;) (type 3) (param i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i64)
    global.get 0
    i32.const 80
    i32.sub
    local.tee 1
    global.set 0
    i32.const 126
    call 82
    block  ;; label = @1
      i32.const 1428
      i32.load
      i32.eqz
      br_if 0 (;@1;)
      i32.const 1432
      i32.load
      i32.const 1436
      i32.load
      i32.ge_s
      if  ;; label = @2
        i32.const 1436
        i32.const 500
        i32.store
        i32.const 1428
        i64.const 0
        i64.store align=4
        i32.const 1216
        i32.const 0
        i32.store
        i32.const 1228
        i32.const 50
        i32.const 0
        call 70
        i32.const 1220
        i64.const 2147483648000
        i64.store align=4
        br 1 (;@1;)
      end
      i32.const 11292
      i32.load
      local.set 6
      i32.const 11320
      i32.load
      local.set 7
      i32.const 11348
      i32.load
      local.set 4
      i32.const 11276
      i32.load
      local.set 2
      i32.const 11248
      i32.load
      local.set 3
      i32.const 16240
      i64.load
      local.set 8
      i32.const 9998
      call 7
      drop
      i32.const 5888
      i32.const 0
      i32.const 100
      memory.fill
      i32.const 6000
      i32.const 0
      i32.const 100
      memory.fill
      i32.const 6112
      i32.const 0
      i32.const 100
      memory.fill
      block  ;; label = @2
        local.get 2
        i32.const 0
        i32.le_s
        br_if 0 (;@2;)
        local.get 2
        call 0
        i32.const 16
        i32.shl
        i32.ge_s
        br_if 0 (;@2;)
        i32.const 5888
        local.get 2
        call 1
        call 40
        drop
      end
      block  ;; label = @2
        local.get 3
        i32.const 0
        i32.le_s
        br_if 0 (;@2;)
        local.get 3
        call 0
        i32.const 16
        i32.shl
        i32.ge_s
        br_if 0 (;@2;)
        i32.const 6000
        local.get 3
        call 1
        call 40
        drop
      end
      block  ;; label = @2
        local.get 8
        i32.wrap_i64
        local.tee 5
        i32.const 0
        i32.le_s
        br_if 0 (;@2;)
        call 0
        i32.const 16
        i32.shl
        local.get 5
        i32.le_s
        br_if 0 (;@2;)
        i32.const 6112
        local.get 5
        call 1
        call 40
        drop
      end
      local.get 1
      local.get 4
      call 36
      i32.store offset=72
      local.get 1
      local.get 4
      i32.store offset=68
      local.get 1
      i32.const 0
      i32.store offset=64
      i32.const 1181
      local.get 1
      i32.const -64
      i32.sub
      call 29
      local.get 1
      i32.const 16
      i32.add
      local.get 6
      i32.store
      local.get 1
      i32.const 20
      i32.add
      local.get 2
      i32.store
      local.get 1
      i32.const 24
      i32.add
      i32.const 5888
      i32.store
      local.get 1
      i32.const 28
      i32.add
      local.get 3
      i32.store
      local.get 1
      i32.const 32
      i32.add
      i32.const 6000
      i32.store
      local.get 1
      i32.const 40
      i32.add
      local.get 8
      i64.store
      local.get 1
      i32.const 48
      i32.add
      i32.const 6112
      i32.store
      local.get 1
      i32.const 0
      i32.store
      local.get 1
      local.get 4
      i32.store offset=8
      local.get 1
      local.get 7
      i32.store offset=12
      local.get 1
      i32.const 1432
      i32.load
      i32.store offset=4
      i32.const 1024
      local.get 1
      call 29
      i32.const 1432
      i32.const 1432
      i32.load
      i32.const 1
      i32.add
      i32.store
    end
    local.get 1
    i32.const 80
    i32.add
    global.set 0
    local.get 0)
  (func (;21;) (type 2) (param i32 i32)
    (local i32)
    i32.const 3464
    i32.load
    local.tee 2
    i32.eqz
    if  ;; label = @1
      i32.const 3456
      local.get 0
      i32.store
      i32.const 3452
      local.get 1
      i32.store
    end
    i32.const 3460
    local.get 0
    i32.store
    i32.const 3464
    local.get 2
    i32.const 1
    i32.add
    i32.store
    local.get 2
    i32.const 2000
    i32.rem_s
    i32.const 1452
    i32.add
    local.get 1
    i32.store8)
  (func (;22;) (type 2) (param i32 i32)
    (local i32)
    i32.const 223
    call 82
    i32.const 3464
    i32.load
    local.tee 2
    i32.eqz
    if  ;; label = @1
      i32.const 3456
      local.get 0
      i32.store
      i32.const 3452
      local.get 1
      i32.store
    end
    i32.const 3460
    local.get 0
    i32.store
    i32.const 3464
    local.get 2
    i32.const 1
    i32.add
    i32.store
    local.get 2
    i32.const 2000
    i32.rem_s
    i32.const 1452
    i32.add
    local.get 1
    i32.store8
    local.get 0
    local.get 1
    call 2)
  (func (;23;) (type 2) (param i32 i32)
    (local i32)
    i32.const 239
    call 82
    i32.const 1440
    i32.load
    i32.const 1
    i32.eq
    if  ;; label = @1
      i32.const 3464
      i32.load
      local.tee 2
      i32.eqz
      if  ;; label = @2
        i32.const 3456
        local.get 0
        i32.store
        i32.const 3452
        local.get 1
        i32.store
      end
      i32.const 3460
      local.get 0
      i32.store
      i32.const 3464
      local.get 2
      i32.const 1
      i32.add
      i32.store
      local.get 2
      i32.const 2000
      i32.rem_s
      i32.const 1452
      i32.add
      local.get 1
      i32.store8
    end
    local.get 0
    local.get 1
    call 2)
  (func (;24;) (type 0)
    i32.const 251
    call 82
    i32.const 3452
    i32.const 0
    i32.store
    i32.const 3464
    i32.const 0
    i32.store
    i32.const 1452
    i32.const 0
    i32.const 2000
    memory.fill)
  (func (;25;) (type 0)
    (local i32)
    i32.const 278
    call 82
    i32.const 1440
    i32.load
    if  ;; label = @1
      block  ;; label = @2
        i32.const 3452
        i32.load
        i32.const 3468
        i32.load
        i32.ne
        br_if 0 (;@2;)
        i32.const 3464
        i32.load
        i32.const 0
        i32.le_s
        br_if 0 (;@2;)
        i32.const 1216
        i32.const 0
        i32.store
        i32.const 1228
        i32.const 50
        i32.const 0
        call 70
        i32.const 1436
        i32.const 500
        i32.store
        i32.const 1224
        i32.const 500
        i32.store
        i32.const 1428
        i64.const 1
        i64.store align=4
        i32.const 1216
        i64.const 1
        i64.store align=4
        i32.const 1444
        i32.const 1444
        i32.load
        i32.const 1
        i32.add
        local.tee 0
        i32.store
        local.get 0
        i32.const 1448
        i32.load
        i32.lt_s
        br_if 0 (;@2;)
        i32.const 1448
        i32.const 1
        i32.store
        i32.const 1440
        i64.const 0
        i64.store align=4
        i32.const 1452
        i32.const 0
        i32.const 2000
        memory.fill
        i32.const 3468
        i32.const 0
        i32.store
      end
      i32.const 3452
      i32.const 0
      i32.store
      i32.const 3464
      i32.const 0
      i32.store
      i32.const 9998
      call 7
      drop
      i32.const 1452
      i32.const 0
      i32.const 2000
      memory.fill
    end)
  (func (;26;) (type 0)
    (local i32 i32 i32 i64)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 2
    global.set 0
    i32.const 333
    call 82
    call 3
    local.tee 0
    call 4
    i32.eq
    if  ;; label = @1
      local.get 2
      i32.const 1087
      i32.store offset=4
      local.get 2
      i32.const 0
      i32.store
      i32.const 1135
      local.get 2
      call 29
      i32.const 1216
      i32.const 0
      i32.store
      i32.const 1228
      i32.const 50
      i32.const 0
      call 70
      i32.const 3480
      i32.const 5000
      i32.store
      i32.const 1220
      i64.const 2147483648000
      i64.store align=4
      i32.const 3472
      i32.const 0
      i32.store
      i32.const 3488
      i32.const 600
      i32.const 0
      call 70
      i32.const 1436
      i32.const 500
      i32.store
      i32.const 1448
      i32.const 1
      i32.store
      i32.const 1440
      i64.const 0
      i64.store align=4
      i32.const 1428
      i64.const 0
      i64.store align=4
      i32.const 3484
      i32.const 0
      i32.store
      i32.const 3476
      i32.const 0
      i32.store
      i32.const 1452
      i32.const 0
      i32.const 2000
      memory.fill
      i32.const 3464
      i64.const 0
      i64.store align=4
      i32.const 3452
      i32.const 0
      i32.store
      i64.const 5
      call 74
      drop
      i32.const 9999
      call 7
      drop
    end
    block  ;; label = @1
      i32.const 1216
      i32.load
      i32.eqz
      br_if 0 (;@1;)
      i32.const 1220
      i32.load
      i32.const 1224
      i32.load
      i32.ge_s
      if  ;; label = @2
        i32.const 1216
        i32.const 0
        i32.store
        i32.const 1228
        i32.const 50
        i32.const 0
        call 70
        i32.const 1220
        i64.const 2147483648000
        i64.store align=4
        i64.const 5
        call 74
        drop
        i32.const 9999
        call 7
        drop
        br 1 (;@1;)
      end
      i64.const 0
      call 74
      drop
      i32.const 1220
      i64.load32_s
      call 74
      drop
      local.get 0
      i64.extend_i32_s
      call 74
      drop
      call 5
      i32.const 9999
      call 7
      drop
      i32.const 1220
      i32.const 1220
      i32.load
      i32.const 1
      i32.add
      i32.store
    end
    block  ;; label = @1
      i32.const 3472
      i32.load
      i32.eqz
      br_if 0 (;@1;)
      i32.const 3476
      i32.load
      i32.const 3480
      i32.load
      i32.ge_s
      if  ;; label = @2
        i32.const 3472
        i32.const 0
        i32.store
        i64.const 3
        call 74
        drop
        i32.const 1119
        i32.const 15
        call 79
        i32.const 9999
        call 7
        drop
        i64.const 0
        call 74
        drop
        i32.const 3476
        i64.load32_s
        call 74
        drop
        i32.const 9999
        call 7
        drop
        i32.const 3488
        local.set 0
        loop  ;; label = @3
          local.get 0
          i32.load
          local.tee 1
          i32.const 0
          i32.gt_s
          if  ;; label = @4
            i64.const 0
            call 74
            drop
            local.get 3
            call 74
            drop
            local.get 1
            i64.extend_i32_u
            call 74
            drop
            i32.const 9999
            call 7
            drop
          end
          local.get 0
          i32.const 4
          i32.add
          local.set 0
          local.get 3
          i64.const 1
          i64.add
          local.tee 3
          i64.const 600
          i64.ne
          br_if 0 (;@3;)
        end
        br 1 (;@1;)
      end
      local.get 0
      i32.const 2
      i32.shl
      i32.const 3488
      i32.add
      local.tee 1
      local.get 1
      i32.load
      i32.const 1
      i32.add
      i32.store
      i32.const 3476
      i32.const 3476
      i32.load
      i32.const 1
      i32.add
      i32.store
      i32.const 3484
      i32.const 3484
      i32.load
      local.tee 1
      local.get 0
      local.get 0
      local.get 1
      i32.lt_s
      select
      i32.store
    end
    call 6
    local.get 2
    i32.const 16
    i32.add
    global.set 0)
  (func (;27;) (type 7) (param i32 i32 i32 i32)
    (local i32 i32 i32)
    block  ;; label = @1
      local.get 2
      i32.load8_u
      local.tee 5
      i32.eqz
      br_if 0 (;@1;)
      local.get 1
      i32.const 0
      i32.le_s
      br_if 0 (;@1;)
      loop  ;; label = @2
        block  ;; label = @3
          local.get 5
          i32.const 37
          i32.eq
          if  ;; label = @4
            local.get 2
            i32.const 1
            i32.add
            local.set 6
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        local.get 2
                        i32.load8_u offset=1
                        local.tee 2
                        i32.const 99
                        i32.sub
                        br_table 1 (;@9;) 3 (;@7;) 5 (;@5;) 5 (;@5;) 5 (;@5;) 5 (;@5;) 5 (;@5;) 5 (;@5;) 5 (;@5;) 4 (;@6;) 5 (;@5;) 5 (;@5;) 5 (;@5;) 5 (;@5;) 5 (;@5;) 5 (;@5;) 2 (;@8;) 0 (;@10;)
                      end
                      local.get 2
                      i32.const 37
                      i32.ne
                      br_if 4 (;@5;)
                      local.get 0
                      local.get 4
                      i32.add
                      i32.const 37
                      i32.store8
                      local.get 4
                      i32.const 1
                      i32.add
                      local.set 4
                      br 6 (;@3;)
                    end
                    local.get 0
                    local.get 4
                    i32.add
                    local.get 3
                    i32.load8_u
                    i32.store8
                    local.get 4
                    i32.const 1
                    i32.add
                    local.set 4
                    local.get 3
                    i32.const 4
                    i32.add
                    local.set 3
                    br 5 (;@3;)
                  end
                  local.get 3
                  i32.load
                  local.tee 2
                  call 48
                  local.set 5
                  local.get 0
                  local.get 4
                  i32.add
                  local.get 2
                  call 49
                  drop
                  local.get 3
                  i32.const 4
                  i32.add
                  local.set 3
                  local.get 4
                  local.get 5
                  i32.add
                  local.set 4
                  br 4 (;@3;)
                end
                local.get 0
                local.get 4
                i32.add
                local.get 3
                i32.load
                call 40
                local.get 4
                i32.add
                local.set 4
                local.get 3
                i32.const 4
                i32.add
                local.set 3
                br 3 (;@3;)
              end
              local.get 0
              local.get 4
              i32.add
              local.get 3
              i32.const 7
              i32.add
              i32.const -8
              i32.and
              local.tee 2
              i64.load
              call 41
              local.get 4
              i32.add
              local.set 4
              local.get 2
              i32.const 8
              i32.add
              local.set 3
              br 2 (;@3;)
            end
            local.get 0
            local.get 4
            i32.add
            local.get 2
            i32.store8
            local.get 4
            i32.const 1
            i32.add
            local.set 4
            br 1 (;@3;)
          end
          local.get 0
          local.get 4
          i32.add
          local.get 5
          i32.store8
          local.get 4
          i32.const 1
          i32.add
          local.set 4
          local.get 2
          local.set 6
        end
        local.get 6
        i32.load8_u offset=1
        local.tee 5
        i32.eqz
        br_if 1 (;@1;)
        local.get 6
        i32.const 1
        i32.add
        local.set 2
        local.get 1
        local.get 4
        i32.gt_s
        br_if 0 (;@2;)
      end
    end)
  (func (;28;) (type 7) (param i32 i32 i32 i32)
    (local i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 4
    global.set 0
    local.get 4
    local.get 3
    i32.const 4
    i32.add
    local.tee 3
    i32.store offset=12
    local.get 0
    local.get 1
    local.get 2
    local.get 3
    call 27
    local.get 4
    i32.const 16
    i32.add
    global.set 0)
  (func (;29;) (type 2) (param i32 i32)
    (local i32)
    global.get 0
    i32.const 16
    i32.sub
    local.tee 2
    global.set 0
    local.get 2
    local.get 1
    i32.const 4
    i32.add
    i32.store offset=12
    i32.const 6224
    i32.const 0
    i32.const 5000
    memory.fill
    i32.const 6224
    i32.const 4999
    local.get 0
    local.get 2
    i32.load offset=12
    call 27
    i32.const 9998
    call 7
    drop
    i64.const 3
    call 74
    drop
    i32.const 6224
    i32.const 6224
    call 48
    call 79
    i32.const 9999
    call 7
    drop
    i32.const 6224
    i32.const 0
    i32.const 5000
    memory.fill
    local.get 2
    i32.const 16
    i32.add
    global.set 0)
  (func (;30;) (type 3) (param i32) (result i32)
    (local i32)
    local.get 0
    local.get 0
    i32.const 31
    i32.shr_s
    local.tee 1
    i32.xor
    local.get 1
    i32.sub)
  (func (;31;) (type 8) (param i64) (result i64)
    (local i64)
    local.get 0
    local.get 0
    i64.const 63
    i64.shr_s
    local.tee 1
    i64.xor
    local.get 1
    i64.sub)
  (func (;32;) (type 1) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 0
    local.get 1
    i32.gt_s
    select)
  (func (;33;) (type 1) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 0
    local.get 1
    i32.lt_s
    select)
  (func (;34;) (type 1) (param i32 i32) (result i32)
    (local i32 i32 i32)
    local.get 1
    i32.eqz
    if  ;; label = @1
      i32.const 1
      return
    end
    local.get 1
    i32.const 2
    i32.lt_s
    if  ;; label = @1
      local.get 0
      return
    end
    local.get 1
    i32.const 1
    i32.sub
    local.tee 3
    i32.const 7
    i32.and
    local.set 4
    local.get 0
    local.set 2
    local.get 1
    i32.const 2
    i32.sub
    i32.const 7
    i32.ge_u
    if  ;; label = @1
      local.get 3
      i32.const -8
      i32.and
      local.set 1
      local.get 0
      local.get 0
      i32.mul
      local.tee 2
      local.get 2
      i32.mul
      local.tee 2
      local.get 2
      i32.mul
      local.set 3
      local.get 0
      local.set 2
      loop  ;; label = @2
        local.get 2
        local.get 3
        i32.mul
        local.set 2
        local.get 1
        i32.const 8
        i32.sub
        local.tee 1
        br_if 0 (;@2;)
      end
    end
    local.get 4
    if  ;; label = @1
      loop  ;; label = @2
        local.get 0
        local.get 2
        i32.mul
        local.set 2
        local.get 4
        i32.const 1
        i32.sub
        local.tee 4
        br_if 0 (;@2;)
      end
    end
    local.get 2)
  (func (;35;) (type 9) (param i64 i64) (result i64)
    (local i64 i64 i64)
    local.get 1
    i64.eqz
    if  ;; label = @1
      i64.const 1
      return
    end
    local.get 1
    i64.const 2
    i64.lt_s
    if  ;; label = @1
      local.get 0
      return
    end
    local.get 1
    i64.const 1
    i64.sub
    local.tee 3
    i64.const 7
    i64.and
    local.set 4
    local.get 0
    local.set 2
    local.get 1
    i64.const 2
    i64.sub
    i64.const 7
    i64.ge_u
    if  ;; label = @1
      local.get 3
      i64.const -8
      i64.and
      local.set 1
      local.get 0
      local.get 0
      i64.mul
      local.tee 2
      local.get 2
      i64.mul
      local.tee 2
      local.get 2
      i64.mul
      local.set 3
      local.get 0
      local.set 2
      loop  ;; label = @2
        local.get 2
        local.get 3
        i64.mul
        local.set 2
        local.get 1
        i64.const 8
        i64.sub
        local.tee 1
        i64.const 0
        i64.ne
        br_if 0 (;@2;)
      end
    end
    local.get 4
    i64.const 0
    i64.ne
    if  ;; label = @1
      loop  ;; label = @2
        local.get 0
        local.get 2
        i64.mul
        local.set 2
        local.get 4
        i64.const 1
        i64.sub
        local.tee 4
        i64.const 0
        i64.ne
        br_if 0 (;@2;)
      end
    end
    local.get 2)
  (func (;36;) (type 3) (param i32) (result i32)
    (local i32 i32)
    local.get 0
    i32.eqz
    if  ;; label = @1
      i32.const 0
      return
    end
    i32.const 1
    local.set 2
    loop  ;; label = @1
      local.get 1
      i32.const 1
      i32.add
      local.set 1
      local.get 0
      local.get 2
      i32.const 10
      i32.mul
      local.tee 2
      i32.div_s
      br_if 0 (;@1;)
    end
    local.get 1)
  (func (;37;) (type 8) (param i64) (result i64)
    (local i64 i64)
    local.get 0
    i64.eqz
    if  ;; label = @1
      i64.const 0
      return
    end
    i64.const 1
    local.set 2
    loop  ;; label = @1
      local.get 1
      i64.const 1
      i64.add
      local.set 1
      local.get 0
      local.get 2
      i64.const 10
      i64.mul
      local.tee 2
      i64.div_s
      i64.const 0
      i64.ne
      br_if 0 (;@1;)
    end
    local.get 1)
  (func (;38;) (type 1) (param i32 i32) (result i32)
    (local i32 i32)
    block  ;; label = @1
      local.get 1
      i32.eqz
      if  ;; label = @2
        i32.const 1
        local.set 1
        br 1 (;@1;)
      end
      local.get 1
      i32.const 2
      i32.lt_s
      if  ;; label = @2
        i32.const 10
        local.set 1
        br 1 (;@1;)
      end
      local.get 1
      i32.const 1
      i32.sub
      local.tee 2
      i32.const 7
      i32.and
      local.set 3
      block  ;; label = @2
        local.get 1
        i32.const 2
        i32.sub
        i32.const 7
        i32.lt_u
        if  ;; label = @3
          i32.const 10
          local.set 1
          br 1 (;@2;)
        end
        local.get 2
        i32.const -8
        i32.and
        local.set 2
        i32.const 10
        local.set 1
        loop  ;; label = @3
          local.get 1
          i32.const 100000000
          i32.mul
          local.set 1
          local.get 2
          i32.const 8
          i32.sub
          local.tee 2
          br_if 0 (;@3;)
        end
      end
      local.get 3
      i32.eqz
      br_if 0 (;@1;)
      loop  ;; label = @2
        local.get 1
        i32.const 10
        i32.mul
        local.set 1
        local.get 3
        i32.const 1
        i32.sub
        local.tee 3
        br_if 0 (;@2;)
      end
    end
    local.get 0
    local.get 1
    i32.div_s
    i32.const 10
    i32.rem_s
    local.tee 0
    local.get 0
    i32.const 31
    i32.shr_s
    local.tee 0
    i32.xor
    local.get 0
    i32.sub)
  (func (;39;) (type 9) (param i64 i64) (result i64)
    (local i64 i64)
    block  ;; label = @1
      local.get 1
      i64.eqz
      if  ;; label = @2
        i64.const 1
        local.set 1
        br 1 (;@1;)
      end
      local.get 1
      i64.const 2
      i64.lt_s
      if  ;; label = @2
        i64.const 10
        local.set 1
        br 1 (;@1;)
      end
      local.get 1
      i64.const 1
      i64.sub
      local.tee 2
      i64.const 7
      i64.and
      local.set 3
      block  ;; label = @2
        local.get 1
        i64.const 2
        i64.sub
        i64.const 7
        i64.lt_u
        if  ;; label = @3
          i64.const 10
          local.set 1
          br 1 (;@2;)
        end
        local.get 2
        i64.const -8
        i64.and
        local.set 2
        i64.const 10
        local.set 1
        loop  ;; label = @3
          local.get 1
          i64.const 100000000
          i64.mul
          local.set 1
          local.get 2
          i64.const 8
          i64.sub
          local.tee 2
          i64.const 0
          i64.ne
          br_if 0 (;@3;)
        end
      end
      local.get 3
      i64.eqz
      br_if 0 (;@1;)
      loop  ;; label = @2
        local.get 1
        i64.const 10
        i64.mul
        local.set 1
        local.get 3
        i64.const 1
        i64.sub
        local.tee 3
        i64.const 0
        i64.ne
        br_if 0 (;@2;)
      end
    end
    local.get 0
    local.get 1
    i64.div_s
    i64.const 10
    i64.rem_s
    local.tee 0
    local.get 0
    i64.const 63
    i64.shr_s
    local.tee 0
    i64.xor
    local.get 0
    i64.sub)
  (func (;40;) (type 1) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    local.get 1
    if  ;; label = @1
      i32.const -1
      local.set 2
      i32.const 1
      local.set 3
      loop  ;; label = @2
        local.get 2
        local.tee 6
        i32.const 1
        i32.add
        local.set 2
        local.get 5
        local.tee 9
        i32.const 1
        i32.add
        local.set 5
        local.get 1
        local.get 3
        i32.const 10
        i32.mul
        local.tee 3
        i32.div_s
        br_if 0 (;@2;)
      end
      local.get 1
      i32.const 0
      i32.lt_s
      if  ;; label = @2
        local.get 0
        i32.const 45
        i32.store8
        i32.const 1
        local.set 4
      end
      local.get 9
      i32.const 2
      i32.sub
      local.set 10
      local.get 6
      local.set 8
      loop  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 5
              local.tee 11
              local.tee 2
              i32.const 1
              i32.sub
              local.tee 5
              br_table 2 (;@3;) 1 (;@4;) 0 (;@5;)
            end
            i32.const 10
            local.set 2
            local.get 10
            local.get 7
            i32.sub
            i32.const 7
            i32.ge_u
            if  ;; label = @5
              local.get 8
              i32.const -8
              i32.and
              local.set 3
              loop  ;; label = @6
                local.get 2
                i32.const 100000000
                i32.mul
                local.set 2
                local.get 3
                i32.const 8
                i32.sub
                local.tee 3
                br_if 0 (;@6;)
              end
            end
            local.get 9
            local.get 7
            i32.const -1
            i32.xor
            i32.add
            i32.const 7
            i32.and
            i32.eqz
            br_if 1 (;@3;)
            local.get 6
            i32.const 7
            i32.and
            local.set 3
            loop  ;; label = @5
              local.get 2
              i32.const 10
              i32.mul
              local.set 2
              local.get 3
              i32.const 1
              i32.sub
              local.tee 3
              br_if 0 (;@5;)
            end
            br 1 (;@3;)
          end
          i32.const 10
          local.set 2
        end
        local.get 0
        local.get 4
        i32.add
        local.get 1
        local.get 2
        i32.div_s
        i32.const 10
        i32.rem_s
        local.tee 2
        local.get 2
        i32.const 31
        i32.shr_s
        local.tee 2
        i32.xor
        local.get 2
        i32.sub
        i32.load8_u offset=1205
        i32.store8
        local.get 6
        i32.const 7
        i32.add
        local.set 6
        local.get 8
        i32.const 1
        i32.sub
        local.set 8
        local.get 7
        i32.const 1
        i32.add
        local.set 7
        local.get 4
        i32.const 1
        i32.add
        local.set 4
        local.get 11
        i32.const 1
        i32.gt_s
        br_if 0 (;@2;)
      end
      local.get 4
      return
    end
    local.get 0
    i32.const 48
    i32.store8
    i32.const 1)
  (func (;41;) (type 11) (param i32 i64) (result i32)
    (local i64 i64 i64 i64 i64 i64 i64 i32 i32 i32)
    local.get 1
    i64.const 0
    i64.ne
    if  ;; label = @1
      i64.const -1
      local.set 2
      i64.const 1
      local.set 4
      i64.const 1
      local.set 5
      loop  ;; label = @2
        local.get 2
        local.tee 6
        i64.const 1
        i64.add
        local.set 2
        local.get 3
        local.tee 8
        i64.const 1
        i64.add
        local.set 3
        local.get 4
        local.tee 7
        i64.const 1
        i64.add
        local.set 4
        local.get 1
        local.get 5
        i64.const 10
        i64.mul
        local.tee 5
        i64.div_s
        i64.const 0
        i64.ne
        br_if 0 (;@2;)
      end
      local.get 1
      i64.const 0
      i64.lt_s
      if  ;; label = @2
        local.get 0
        i32.const 45
        i32.store8
        i32.const 1
        local.set 9
      end
      local.get 8
      i64.const 2
      i64.sub
      local.set 5
      local.get 6
      i32.wrap_i64
      local.set 10
      i64.const 0
      local.set 4
      loop  ;; label = @2
        i64.const 1
        local.set 3
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 7
              i32.wrap_i64
              local.tee 11
              i32.const 1
              i32.sub
              br_table 2 (;@3;) 1 (;@4;) 0 (;@5;)
            end
            i64.const 10
            local.set 3
            local.get 5
            local.get 4
            i64.sub
            i64.const 7
            i64.ge_u
            if  ;; label = @5
              local.get 6
              i64.const -8
              i64.and
              local.set 2
              loop  ;; label = @6
                local.get 3
                i64.const 100000000
                i64.mul
                local.set 3
                local.get 2
                i64.const 8
                i64.sub
                local.tee 2
                i64.const 0
                i64.ne
                br_if 0 (;@6;)
              end
            end
            local.get 8
            local.get 4
            i64.const -1
            i64.xor
            i64.add
            i64.const 7
            i64.and
            i64.eqz
            br_if 1 (;@3;)
            local.get 10
            i64.extend_i32_u
            i64.const 7
            i64.and
            local.set 2
            loop  ;; label = @5
              local.get 3
              i64.const 10
              i64.mul
              local.set 3
              local.get 2
              i64.const 1
              i64.sub
              local.tee 2
              i64.const 0
              i64.ne
              br_if 0 (;@5;)
            end
            br 1 (;@3;)
          end
          i64.const 10
          local.set 3
        end
        local.get 7
        i64.const 1
        i64.sub
        local.set 7
        local.get 0
        local.get 9
        i32.add
        local.get 1
        local.get 3
        i64.div_s
        i64.const 10
        i64.rem_s
        local.tee 2
        local.get 2
        i64.const 63
        i64.shr_s
        local.tee 2
        i64.xor
        local.get 2
        i64.sub
        i32.wrap_i64
        i32.load8_u offset=1205
        i32.store8
        local.get 10
        i32.const 7
        i32.add
        local.set 10
        local.get 6
        i64.const 1
        i64.sub
        local.set 6
        local.get 4
        i64.const 1
        i64.add
        local.set 4
        local.get 9
        i32.const 1
        i32.add
        local.set 9
        local.get 11
        i32.const 1
        i32.gt_s
        br_if 0 (;@2;)
      end
      local.get 9
      return
    end
    local.get 0
    i32.const 48
    i32.store8
    i32.const 1)
  (func (;42;) (type 5) (param i32 i32 i32) (result i32)
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
  (func (;43;) (type 5) (param i32 i32 i32) (result i32)
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
  (func (;44;) (type 5) (param i32 i32 i32) (result i32)
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
  (func (;45;) (type 5) (param i32 i32 i32) (result i32)
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
  (func (;46;) (type 1) (param i32 i32) (result i32)
    (local i32)
    local.get 0
    local.get 1
    i32.load8_u
    local.tee 2
    i32.store8
    local.get 2
    if  ;; label = @1
      local.get 1
      i32.const 1
      i32.add
      local.set 1
      loop  ;; label = @2
        local.get 0
        i32.const 1
        i32.add
        local.tee 0
        local.get 1
        i32.load8_u
        local.tee 2
        i32.store8
        local.get 1
        i32.const 1
        i32.add
        local.set 1
        local.get 2
        br_if 0 (;@2;)
      end
    end
    local.get 0)
  (func (;47;) (type 1) (param i32 i32) (result i32)
    (local i32 i32)
    local.get 0
    local.get 1
    i32.load8_u
    local.tee 2
    i32.store8
    local.get 2
    if  ;; label = @1
      local.get 0
      i32.const 1
      i32.add
      local.set 2
      local.get 1
      i32.const 1
      i32.add
      local.set 1
      loop  ;; label = @2
        local.get 2
        local.get 1
        i32.load8_u
        local.tee 3
        i32.store8
        local.get 2
        i32.const 1
        i32.add
        local.set 2
        local.get 1
        i32.const 1
        i32.add
        local.set 1
        local.get 3
        br_if 0 (;@2;)
      end
    end
    local.get 0)
  (func (;48;) (type 3) (param i32) (result i32)
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
  (func (;49;) (type 1) (param i32 i32) (result i32)
    (local i32 i32)
    local.get 0
    call 48
    local.get 0
    i32.add
    local.tee 2
    local.get 1
    i32.load8_u
    local.tee 3
    i32.store8
    local.get 3
    if  ;; label = @1
      local.get 1
      i32.const 1
      i32.add
      local.set 1
      local.get 2
      i32.const 1
      i32.add
      local.set 2
      loop  ;; label = @2
        local.get 2
        local.get 1
        i32.load8_u
        local.tee 3
        i32.store8
        local.get 2
        i32.const 1
        i32.add
        local.set 2
        local.get 1
        i32.const 1
        i32.add
        local.set 1
        local.get 3
        br_if 0 (;@2;)
      end
    end
    local.get 0)
  (func (;50;) (type 1) (param i32 i32) (result i32)
    (local i32)
    local.get 1
    i32.const 255
    i32.and
    local.tee 1
    i32.eqz
    if  ;; label = @1
      local.get 0
      call 48
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
  (func (;51;) (type 1) (param i32 i32) (result i32)
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
        call 48
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
  (func (;52;) (type 5) (param i32 i32 i32) (result i32)
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
  (func (;53;) (type 1) (param i32 i32) (result i32)
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
        call 48
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
  (func (;54;) (type 1) (param i32 i32) (result i32)
    (local i32 i32)
    block  ;; label = @1
      local.get 1
      i32.const 255
      i32.and
      local.tee 3
      i32.eqz
      if  ;; label = @2
        local.get 0
        call 48
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
  (func (;55;) (type 1) (param i32 i32) (result i32)
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
  (func (;56;) (type 0)
    i64.const 0
    call 74
    drop)
  (func (;57;) (type 6) (param i32)
    local.get 0
    i64.extend_i32_s
    call 74
    drop)
  (func (;58;) (type 12) (param i64)
    i64.const 789789
    call 74
    drop
    local.get 0
    i64.extend32_s
    call 74
    drop)
  (func (;59;) (type 13) (param f32)
    i64.const 123123
    call 74
    drop
    local.get 0
    i32.trunc_sat_f32_s
    i64.extend_i32_s
    call 74
    drop)
  (func (;60;) (type 14) (param f64)
    i64.const 456456
    call 74
    drop
    local.get 0
    i32.trunc_sat_f64_s
    i64.extend_i32_s
    call 74
    drop)
  (func (;61;) (type 0)
    i32.const 9999
    call 7
    drop)
  (func (;62;) (type 2) (param i32 i32)
    local.get 0
    i32.const 2
    i32.shl
    i32.const 11224
    i32.add
    local.get 1
    i32.store)
  (func (;63;) (type 15) (param i32 i64)
    local.get 0
    i32.const 3
    i32.shl
    i32.const 15224
    i32.add
    local.get 1
    i64.store)
  (func (;64;) (type 16) (param i32 f32)
    local.get 0
    i32.const 2
    i32.shl
    i32.const 13224
    i32.add
    local.get 1
    f32.store)
  (func (;65;) (type 17) (param i32 f64)
    local.get 0
    i32.const 3
    i32.shl
    i32.const 19224
    i32.add
    local.get 1
    f64.store)
  (func (;66;) (type 3) (param i32) (result i32)
    local.get 0
    i32.const 2
    i32.shl
    i32.const 11224
    i32.add
    i32.load)
  (func (;67;) (type 18) (param i32) (result i64)
    local.get 0
    i32.const 3
    i32.shl
    i32.const 15224
    i32.add
    i64.load)
  (func (;68;) (type 19) (param i32) (result f32)
    local.get 0
    i32.const 2
    i32.shl
    i32.const 13224
    i32.add
    f32.load)
  (func (;69;) (type 20) (param i32) (result f64)
    local.get 0
    i32.const 3
    i32.shl
    i32.const 19224
    i32.add
    f64.load)
  (func (;70;) (type 10) (param i32 i32 i32)
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
  (func (;71;) (type 10) (param i32 i32 i32)
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
  (func (;72;) (type 4) (result i32)
    i32.const 9999
    call 7)
  (func (;73;) (type 4) (result i32)
    i32.const 9998
    call 7)
  (func (;74;) (type 21) (param i64) (result i32)
    (local i32)
    local.get 0
    i32.wrap_i64
    local.tee 1
    local.get 1
    i32.const 10000
    i32.add
    i32.const 9995
    call 7
    i32.const 1
    i32.eq
    select
    call 7)
  (func (;75;) (type 4) (result i32)
    i32.const 9995
    call 7)
  (func (;76;) (type 0)
    i32.const 9997
    call 7
    drop)
  (func (;77;) (type 0)
    i32.const 9996
    call 7
    drop)
  (func (;78;) (type 5) (param i32 i32 i32) (result i32)
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
        call 1
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
        call 8
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
    call 7
    drop
    local.get 0)
  (func (;79;) (type 2) (param i32 i32)
    local.get 1
    i32.const 0
    i32.gt_s
    if  ;; label = @1
      loop  ;; label = @2
        local.get 0
        i64.load8_u
        call 74
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
  (func (;80;) (type 2) (param i32 i32)
    local.get 1
    i32.const 0
    i32.gt_s
    if  ;; label = @1
      loop  ;; label = @2
        local.get 0
        i64.load32_s
        call 74
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
  (func (;81;) (type 0)
    i64.const 6
    call 74
    drop
    i32.const 9999
    call 7
    drop)
  (func (;82;) (type 6) (param i32)
    i32.const 23224
    i32.const 123456
    call 1
    local.get 0
    i32.add
    i32.const 23224
    i32.load
    i32.add
    i32.store)
  (memory (;0;) 10)
  (global (;0;) (mut i32) (i32.const 88768))
  (global (;1;) i32 (i32.const 1216))
  (global (;2;) i32 (i32.const 6224))
  (global (;3;) i32 (i32.const 1205))
  (global (;4;) i32 (i32.const 11224))
  (global (;5;) i32 (i32.const 23224))
  (global (;6;) i32 (i32.const 1024))
  (global (;7;) i32 (i32.const 23228))
  (global (;8;) i32 (i32.const 23232))
  (global (;9;) i32 (i32.const 88768))
  (global (;10;) i32 (i32.const 1024))
  (global (;11;) i32 (i32.const 88768))
  (global (;12;) i32 (i32.const 655360))
  (global (;13;) i32 (i32.const 0))
  (global (;14;) i32 (i32.const 1))
  (global (;15;) i32 (i32.const 65536))
  (export "memory" (memory 0))
  (export "__wasm_call_ctors" (func 9))
  (export "_reset_stats" (func 10))
  (export "poopState" (global 1))
  (export "memset_i32" (func 70))
  (export "_reset_debug" (func 11))
  (export "_reset_bigfunc_trace" (func 12))
  (export "_reset_chacha" (func 13))
  (export "memset_i8" (func 71))
  (export "_init_all_the_things" (func 14))
  (export "_poopf" (func 29))
  (export "hxh_push_microcode_literal" (func 74))
  (export "hxh_parse_execute" (func 72))
  (export "export_enable_stats" (func 15))
  (export "export_chacha_enable" (func 16))
  (export "export_enable_debug" (func 17))
  (export "export_enable_bigfunc_trace" (func 18))
  (export "export_wasm_arras_memsize" (func 19))
  (export "_special_bigfunc_beforebranch" (func 20))
  (export "export_nothing" (func 82))
  (export "special_bigfunc_localget_i32" (func 66))
  (export "special_bigfunc_localget_i64" (func 67))
  (export "hxh_reset" (func 73))
  (export "int_to_str" (func 40))
  (export "digits10" (func 36))
  (export "add_chacha_byte" (func 21))
  (export "_special_bigfunc_chachabyte_1" (func 22))
  (export "_special_bigfunc_chachabyte_2" (func 23))
  (export "_special_bigfunc_chachafinish_1" (func 24))
  (export "_special_bigfunc_chachafinish_2" (func 25))
  (export "inject_all" (func 26))
  (export "_hxh_add_char_string_microcode" (func 79))
  (export "max_i32" (func 32))
  (export "vspoopf" (func 27))
  (export "strlen" (func 48))
  (export "strcat" (func 49))
  (export "i64_to_str" (func 41))
  (export "_spoopf" (func 28))
  (export "printf_buffer" (global 2))
  (export "absi" (func 30))
  (export "absi64" (func 31))
  (export "min_i32" (func 33))
  (export "pow_i32" (func 34))
  (export "pow_i64" (func 35))
  (export "digits10i64" (func 37))
  (export "ithDigit10" (func 38))
  (export "ithDigit10i64" (func 39))
  (export "digitCharMap" (global 3))
  (export "memset" (func 42))
  (export "memcpy" (func 43))
  (export "memcmp" (func 44))
  (export "memchr" (func 45))
  (export "__stpcpy" (func 46))
  (export "strcpy" (func 47))
  (export "__strchrnul" (func 50))
  (export "strcspn" (func 51))
  (export "strncmp" (func 52))
  (export "strpbrk" (func 53))
  (export "strchr" (func 54))
  (export "strstr" (func 55))
  (export "_special_printargs_begin" (func 56))
  (export "_special_printargs_per_arg_i32" (func 57))
  (export "_special_printargs_per_arg_i64" (func 58))
  (export "_special_printargs_per_arg_f32" (func 59))
  (export "_special_printargs_per_arg_f64" (func 60))
  (export "_special_printargs_end" (func 61))
  (export "_special_bigfunc_localset_i32" (func 62))
  (export "locals_struct" (global 4))
  (export "_special_bigfunc_localset_i64" (func 63))
  (export "_special_bigfunc_localset_f32" (func 64))
  (export "_special_bigfunc_localset_f64" (func 65))
  (export "special_bigfunc_localget_f32" (func 68))
  (export "special_bigfunc_localget_f64" (func 69))
  (export "hxh_extended_literals_status" (func 75))
  (export "hxh_extended_literals_on" (func 76))
  (export "hxh_extended_literals_off" (func 77))
  (export "memcpy_i8_to_arras_memory" (func 78))
  (export "_hxh_add_int_string_microcode" (func 80))
  (export "_hxh_breakpoint" (func 81))
  (export "nothing_state" (global 5))
  (export "__dso_handle" (global 6))
  (export "__data_end" (global 7))
  (export "__stack_low" (global 8))
  (export "__stack_high" (global 9))
  (export "__global_base" (global 10))
  (export "__heap_base" (global 11))
  (export "__heap_end" (global 12))
  (export "__memory_base" (global 13))
  (export "__table_base" (global 14))
  (export "__wasm_first_page_end" (global 15))
  (data (;0;) (i32.const 1024) "%d| fa=%d, y=%d, r=%d, n=%d, *n=%s, g=%d, *g=%s, xd=%l, *xd=%s\00Wed Oct 29 05:26:26 AM EDT 2025\00The total is...\00Welcome to Bananan Turd Labs. \0aCompiled: '%s'\00fa test=%d, digits=%d, ")
  (data (;1;) (i32.const 1205) "0123456789"))
