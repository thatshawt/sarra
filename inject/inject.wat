(module
  (type (;0;) (func))
  (type (;1;) (func (param i32 i32) (result i32)))
  (type (;2;) (func (param i32 i32)))
  (type (;3;) (func (param i32) (result i32)))
  (type (;4;) (func (param i32 i32 i32) (result i32)))
  (type (;5;) (func (result i32)))
  (type (;6;) (func (param i32)))
  (type (;7;) (func (param i64) (result i64)))
  (type (;8;) (func (result i64)))
  (type (;9;) (func (param i32 i32 i32 i32)))
  (type (;10;) (func (param i64 i64) (result i64)))
  (type (;11;) (func (param i64)))
  (type (;12;) (func (param i32 i32 i32)))
  (type (;13;) (func (param i32 i64) (result i32)))
  (type (;14;) (func (param f32)))
  (type (;15;) (func (param f64)))
  (type (;16;) (func (param i32 i64)))
  (type (;17;) (func (param i32 f32)))
  (type (;18;) (func (param i32 f64)))
  (type (;19;) (func (param i32) (result i64)))
  (type (;20;) (func (param i32) (result f32)))
  (type (;21;) (func (param i32) (result f64)))
  (import "env" "special_arras_memory_memory_size" (func (;0;) (type 5)))
  (import "env" "special_arras_memory_i32_load" (func (;1;) (type 3)))
  (import "env" "special_arras_memory_i32_store8" (func (;2;) (type 2)))
  (import "env" "special_func_number" (func (;3;) (type 5)))
  (import "env" "special_start_func_number" (func (;4;) (type 5)))
  (import "env" "special_printargs" (func (;5;) (type 0)))
  (import "env" "special_clear_locals" (func (;6;) (type 0)))
  (import "env" "import_e_t_get" (func (;7;) (type 3)))
  (import "env" "special_arras_memory_i32_store" (func (;8;) (type 2)))
  (func (;9;) (type 0))
  (func (;10;) (type 0)
    i32.const 3448
    i32.const 5000
    i32.store
    i32.const 3440
    i32.const 0
    i32.store
    i32.const 3456
    i32.const 600
    i32.const 0
    call 70
    i32.const 3452
    i32.const 0
    i32.store
    i32.const 3444
    i32.const 0
    i32.store)
  (func (;11;) (type 0)
    i32.const 1184
    i32.const 0
    i32.store
    i32.const 1196
    i32.const 50
    i32.const 0
    call 70
    i32.const 1188
    i64.const 2147483648000
    i64.store align=4)
  (func (;12;) (type 0)
    i32.const 1404
    i32.const 500
    i32.store
    i32.const 1396
    i64.const 0
    i64.store align=4)
  (func (;13;) (type 0)
    i32.const 1416
    i32.const 1
    i32.store
    i32.const 1408
    i64.const 0
    i64.store align=4
    i32.const 1420
    i32.const 0
    i32.const 2000
    memory.fill
    i32.const 3432
    i64.const 0
    i64.store align=4
    i32.const 3420
    i32.const 0
    i32.store)
  (func (;14;) (type 0)
    (local i32)
    global.get 0
    i32.const 48
    i32.sub
    local.tee 0
    global.set 0
    local.get 0
    i32.const 1064
    i32.store offset=36
    local.get 0
    i32.const 0
    i32.store offset=32
    i32.const 1096
    local.get 0
    i32.const 32
    i32.add
    call 29
    local.get 0
    i32.const 16
    i32.add
    i64.const 123456789123123123
    i64.store
    local.get 0
    i32.const -1234
    i32.store offset=8
    local.get 0
    i64.const 528280977408
    i64.store
    i32.const 1036
    local.get 0
    call 29
    i32.const 1184
    i32.const 0
    i32.store
    i32.const 1196
    i32.const 50
    i32.const 0
    call 70
    i32.const 3448
    i32.const 5000
    i32.store
    i32.const 1188
    i64.const 2147483648000
    i64.store align=4
    i32.const 3440
    i32.const 0
    i32.store
    i32.const 3456
    i32.const 600
    i32.const 0
    call 70
    i32.const 1404
    i32.const 500
    i32.store
    i32.const 1416
    i32.const 1
    i32.store
    i32.const 1408
    i64.const 0
    i64.store align=4
    i32.const 1396
    i64.const 0
    i64.store align=4
    i32.const 3452
    i32.const 0
    i32.store
    i32.const 3444
    i32.const 0
    i32.store
    i32.const 1420
    i32.const 0
    i32.const 2000
    memory.fill
    i32.const 3432
    i64.const 0
    i64.store align=4
    i32.const 3420
    i32.const 0
    i32.store
    i64.const 5
    call 74
    drop
    call 72
    drop
    local.get 0
    i32.const 48
    i32.add
    global.set 0)
  (func (;15;) (type 0)
    i32.const 3448
    i32.const 5000
    i32.store
    i32.const 3440
    i32.const 0
    i32.store
    i32.const 3456
    i32.const 600
    i32.const 0
    call 70
    i32.const 3440
    i64.const 1
    i64.store align=4
    i32.const 3452
    i32.const 0
    i32.store)
  (func (;16;) (type 6) (param i32)
    i32.const 1416
    i32.const 1
    i32.store
    i32.const 1408
    i64.const 0
    i64.store align=4
    i32.const 1420
    i32.const 0
    i32.const 2000
    memory.fill
    i32.const 3436
    local.get 0
    i32.store
    i32.const 1408
    i32.const 1
    i32.store
    i32.const 3420
    i32.const 0
    i32.store
    i32.const 3432
    i32.const 0
    i32.store
    local.get 0
    i64.extend_i32_s
    call 80)
  (func (;17;) (type 0)
    i32.const 1184
    i32.const 0
    i32.store
    i32.const 1196
    i32.const 50
    i32.const 0
    call 70
    i32.const 1192
    i32.const 500
    i32.store
    i32.const 1184
    i64.const 1
    i64.store align=4)
  (func (;18;) (type 0)
    i32.const 1404
    i32.const 500
    i32.store
    i32.const 1396
    i64.const 0
    i64.store align=4
    i32.const 1184
    i32.const 0
    i32.store
    i32.const 1196
    i32.const 50
    i32.const 0
    call 70
    i32.const 1396
    i32.const 1
    i32.store
    i32.const 1192
    i32.const 500
    i32.store
    i32.const 1184
    i64.const 1
    i64.store align=4)
  (func (;19;) (type 0)
    call 0
    i64.extend_i32_s
    call 80)
  (func (;20;) (type 3) (param i32) (result i32)
    (local i32 i32 i32 i32 i64)
    global.get 0
    i32.const 32
    i32.sub
    local.tee 1
    global.set 0
    i32.const 131
    call 84
    block  ;; label = @1
      i32.const 1396
      i32.load
      i32.eqz
      br_if 0 (;@1;)
      i32.const 1400
      i32.load
      i32.const 1404
      i32.load
      i32.ge_s
      if  ;; label = @2
        i32.const 1404
        i32.const 500
        i32.store
        i32.const 1396
        i64.const 0
        i64.store align=4
        i32.const 1184
        i32.const 0
        i32.store
        i32.const 1196
        i32.const 50
        i32.const 0
        call 70
        i32.const 1188
        i64.const 2147483648000
        i64.store align=4
        br 1 (;@1;)
      end
      i32.const 11260
      i32.load
      drop
      i32.const 11288
      i32.load
      drop
      i32.const 11316
      i32.load
      local.set 4
      i32.const 11244
      i32.load
      local.set 2
      i32.const 11216
      i32.load
      local.set 3
      i32.const 16208
      i64.load
      local.set 5
      i64.const 123
      call 80
      local.get 1
      i64.const 528280978197
      i64.store offset=24
      local.get 1
      i64.const 1958505087099
      i64.store offset=16
      i32.const 1024
      local.get 1
      i32.const 16
      i32.add
      call 29
      call 73
      drop
      i32.const 5856
      i32.const 0
      i32.const 100
      memory.fill
      i32.const 5968
      i32.const 0
      i32.const 100
      memory.fill
      i32.const 6080
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
        i32.const 5856
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
        i32.const 5968
        local.get 3
        call 1
        call 40
        drop
      end
      block  ;; label = @2
        local.get 5
        i32.wrap_i64
        local.tee 2
        i32.const 0
        i32.le_s
        br_if 0 (;@2;)
        call 0
        i32.const 16
        i32.shl
        local.get 2
        i32.le_s
        br_if 0 (;@2;)
        i32.const 6080
        local.get 2
        call 1
        call 40
        drop
      end
      local.get 1
      local.get 4
      call 36
      i32.store offset=8
      local.get 1
      local.get 4
      i32.store offset=4
      local.get 1
      i32.const 0
      i32.store
      i32.const 1142
      local.get 1
      call 29
      i32.const 1400
      i32.const 1400
      i32.load
      i32.const 1
      i32.add
      i32.store
    end
    local.get 1
    i32.const 32
    i32.add
    global.set 0
    local.get 0)
  (func (;21;) (type 2) (param i32 i32)
    (local i32)
    i32.const 3432
    i32.load
    local.tee 2
    i32.eqz
    if  ;; label = @1
      i32.const 3424
      local.get 0
      i32.store
      i32.const 3420
      local.get 1
      i32.store
    end
    i32.const 3428
    local.get 0
    i32.store
    i32.const 3432
    local.get 2
    i32.const 1
    i32.add
    i32.store
    local.get 2
    i32.const 2000
    i32.rem_s
    i32.const 1420
    i32.add
    local.get 1
    i32.store8)
  (func (;22;) (type 2) (param i32 i32)
    (local i32)
    i32.const 230
    call 84
    i32.const 3432
    i32.load
    local.tee 2
    i32.eqz
    if  ;; label = @1
      i32.const 3424
      local.get 0
      i32.store
      i32.const 3420
      local.get 1
      i32.store
    end
    i32.const 3428
    local.get 0
    i32.store
    i32.const 3432
    local.get 2
    i32.const 1
    i32.add
    i32.store
    local.get 2
    i32.const 2000
    i32.rem_s
    i32.const 1420
    i32.add
    local.get 1
    i32.store8
    local.get 0
    local.get 1
    call 2)
  (func (;23;) (type 2) (param i32 i32)
    (local i32)
    i32.const 246
    call 84
    i32.const 1408
    i32.load
    i32.const 1
    i32.eq
    if  ;; label = @1
      i32.const 3432
      i32.load
      local.tee 2
      i32.eqz
      if  ;; label = @2
        i32.const 3424
        local.get 0
        i32.store
        i32.const 3420
        local.get 1
        i32.store
      end
      i32.const 3428
      local.get 0
      i32.store
      i32.const 3432
      local.get 2
      i32.const 1
      i32.add
      i32.store
      local.get 2
      i32.const 2000
      i32.rem_s
      i32.const 1420
      i32.add
      local.get 1
      i32.store8
    end
    local.get 0
    local.get 1
    call 2)
  (func (;24;) (type 0)
    i32.const 258
    call 84
    i32.const 3420
    i32.const 0
    i32.store
    i32.const 3432
    i32.const 0
    i32.store
    i32.const 1420
    i32.const 0
    i32.const 2000
    memory.fill)
  (func (;25;) (type 0)
    (local i32)
    i32.const 285
    call 84
    i32.const 1408
    i32.load
    if  ;; label = @1
      block  ;; label = @2
        i32.const 3420
        i32.load
        i32.const 3436
        i32.load
        i32.ne
        br_if 0 (;@2;)
        i32.const 3432
        i32.load
        i32.const 0
        i32.le_s
        br_if 0 (;@2;)
        i32.const 1184
        i32.const 0
        i32.store
        i32.const 1196
        i32.const 50
        i32.const 0
        call 70
        i32.const 1404
        i32.const 500
        i32.store
        i32.const 1192
        i32.const 500
        i32.store
        i32.const 1396
        i64.const 1
        i64.store align=4
        i32.const 1184
        i64.const 1
        i64.store align=4
        i32.const 1412
        i32.const 1412
        i32.load
        i32.const 1
        i32.add
        local.tee 0
        i32.store
        local.get 0
        i32.const 1416
        i32.load
        i32.lt_s
        br_if 0 (;@2;)
        i32.const 1416
        i32.const 1
        i32.store
        i32.const 1408
        i64.const 0
        i64.store align=4
        i32.const 1420
        i32.const 0
        i32.const 2000
        memory.fill
        i32.const 3436
        i32.const 0
        i32.store
      end
      i32.const 3420
      i32.const 0
      i32.store
      i32.const 3432
      i32.const 0
      i32.store
      call 73
      drop
      i32.const 1420
      i32.const 0
      i32.const 2000
      memory.fill
    end)
  (func (;26;) (type 0)
    (local i32 i32)
    global.get 0
    i32.const 48
    i32.sub
    local.tee 0
    global.set 0
    i32.const 340
    call 84
    call 3
    local.tee 1
    call 4
    i32.eq
    if  ;; label = @1
      local.get 0
      i32.const 1064
      i32.store offset=36
      local.get 0
      i32.const 0
      i32.store offset=32
      i32.const 1096
      local.get 0
      i32.const 32
      i32.add
      call 29
      local.get 0
      i32.const 16
      i32.add
      i64.const 123456789123123123
      i64.store
      local.get 0
      i32.const -1234
      i32.store offset=8
      local.get 0
      i64.const 528280977408
      i64.store
      i32.const 1036
      local.get 0
      call 29
      i32.const 1184
      i32.const 0
      i32.store
      i32.const 1196
      i32.const 50
      i32.const 0
      call 70
      i32.const 3448
      i32.const 5000
      i32.store
      i32.const 1188
      i64.const 2147483648000
      i64.store align=4
      i32.const 3440
      i32.const 0
      i32.store
      i32.const 3456
      i32.const 600
      i32.const 0
      call 70
      i32.const 1404
      i32.const 500
      i32.store
      i32.const 1416
      i32.const 1
      i32.store
      i32.const 1408
      i64.const 0
      i64.store align=4
      i32.const 1396
      i64.const 0
      i64.store align=4
      i32.const 3452
      i32.const 0
      i32.store
      i32.const 3444
      i32.const 0
      i32.store
      i32.const 1420
      i32.const 0
      i32.const 2000
      memory.fill
      i32.const 3432
      i64.const 0
      i64.store align=4
      i32.const 3420
      i32.const 0
      i32.store
      i64.const 5
      call 74
      drop
      call 72
      drop
    end
    block  ;; label = @1
      i32.const 1184
      i32.load
      i32.eqz
      br_if 0 (;@1;)
      i32.const 1188
      i32.load
      i32.const 1192
      i32.load
      i32.ge_s
      if  ;; label = @2
        i32.const 1184
        i32.const 0
        i32.store
        i32.const 1196
        i32.const 50
        i32.const 0
        call 70
        i32.const 1188
        i64.const 2147483648000
        i64.store align=4
        i64.const 5
        call 74
        drop
        call 72
        drop
        br 1 (;@1;)
      end
      i64.const 0
      call 74
      drop
      i32.const 1188
      i64.load32_s
      call 74
      drop
      local.get 1
      i64.extend_i32_s
      call 74
      drop
      call 5
      call 72
      drop
      i32.const 1188
      i32.const 1188
      i32.load
      i32.const 1
      i32.add
      i32.store
    end
    call 6
    local.get 0
    i32.const 48
    i32.add
    global.set 0)
  (func (;27;) (type 9) (param i32 i32 i32 i32)
    (local i32 i32 i32)
    i64.const 789
    call 80
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
                    i32.load
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
  (func (;28;) (type 9) (param i32 i32 i32 i32)
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
    i64.const 456
    call 80
    local.get 2
    local.get 1
    i32.const 4
    i32.add
    i32.store offset=12
    i32.const 6192
    i32.const 0
    i32.const 5000
    memory.fill
    i32.const 6192
    i32.const 4999
    local.get 0
    local.get 2
    i32.load offset=12
    call 27
    call 73
    drop
    i32.const 6192
    i32.const 6192
    call 48
    call 78
    i32.const 6192
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
  (func (;31;) (type 7) (param i64) (result i64)
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
  (func (;35;) (type 10) (param i64 i64) (result i64)
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
  (func (;37;) (type 7) (param i64) (result i64)
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
  (func (;39;) (type 10) (param i64 i64) (result i64)
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
        i32.load8_u offset=1166
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
  (func (;41;) (type 13) (param i32 i64) (result i32)
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
        i32.load8_u offset=1166
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
  (func (;42;) (type 4) (param i32 i32 i32) (result i32)
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
  (func (;43;) (type 4) (param i32 i32 i32) (result i32)
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
  (func (;44;) (type 4) (param i32 i32 i32) (result i32)
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
  (func (;45;) (type 4) (param i32 i32 i32) (result i32)
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
  (func (;52;) (type 4) (param i32 i32 i32) (result i32)
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
  (func (;58;) (type 11) (param i64)
    i64.const 789789
    call 74
    drop
    local.get 0
    i64.extend32_s
    call 74
    drop)
  (func (;59;) (type 14) (param f32)
    i64.const 123123
    call 74
    drop
    local.get 0
    i32.trunc_sat_f32_s
    i64.extend_i32_s
    call 74
    drop)
  (func (;60;) (type 15) (param f64)
    i64.const 456456
    call 74
    drop
    local.get 0
    i32.trunc_sat_f64_s
    i64.extend_i32_s
    call 74
    drop)
  (func (;61;) (type 0)
    call 72
    drop)
  (func (;62;) (type 2) (param i32 i32)
    local.get 0
    i32.const 2
    i32.shl
    i32.const 11192
    i32.add
    local.get 1
    i32.store)
  (func (;63;) (type 16) (param i32 i64)
    local.get 0
    i32.const 3
    i32.shl
    i32.const 15192
    i32.add
    local.get 1
    i64.store)
  (func (;64;) (type 17) (param i32 f32)
    local.get 0
    i32.const 2
    i32.shl
    i32.const 13192
    i32.add
    local.get 1
    f32.store)
  (func (;65;) (type 18) (param i32 f64)
    local.get 0
    i32.const 3
    i32.shl
    i32.const 19192
    i32.add
    local.get 1
    f64.store)
  (func (;66;) (type 3) (param i32) (result i32)
    local.get 0
    i32.const 2
    i32.shl
    i32.const 11192
    i32.add
    i32.load)
  (func (;67;) (type 19) (param i32) (result i64)
    local.get 0
    i32.const 3
    i32.shl
    i32.const 15192
    i32.add
    i64.load)
  (func (;68;) (type 20) (param i32) (result f32)
    local.get 0
    i32.const 2
    i32.shl
    i32.const 13192
    i32.add
    f32.load)
  (func (;69;) (type 21) (param i32) (result f64)
    local.get 0
    i32.const 3
    i32.shl
    i32.const 19192
    i32.add
    f64.load)
  (func (;70;) (type 12) (param i32 i32 i32)
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
  (func (;71;) (type 12) (param i32 i32 i32)
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
  (func (;72;) (type 8) (result i64)
    i32.const 9999
    call 7
    i64.extend_i32_s)
  (func (;73;) (type 8) (result i64)
    i32.const 9998
    call 7
    i64.extend_i32_s)
  (func (;74;) (type 7) (param i64) (result i64)
    (local i32)
    local.get 0
    i32.wrap_i64
    local.tee 1
    local.get 1
    i32.const 10000
    i32.add
    call 75
    i64.const 1
    i64.eq
    select
    call 7
    i64.extend_i32_s)
  (func (;75;) (type 8) (result i64)
    i32.const 9995
    call 7
    i64.extend_i32_s)
  (func (;76;) (type 0)
    i32.const 9997
    call 7
    drop)
  (func (;77;) (type 0)
    i32.const 9996
    call 7
    drop)
  (func (;78;) (type 2) (param i32 i32)
    i64.const 3
    call 74
    drop
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
    end
    call 72
    drop)
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
  (func (;80;) (type 11) (param i64)
    i64.const 0
    call 74
    drop
    local.get 0
    call 74
    drop
    call 72
    drop)
  (func (;81;) (type 4) (param i32 i32 i32) (result i32)
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
    call 72
    drop
    local.get 0)
  (func (;82;) (type 2) (param i32 i32)
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
  (func (;83;) (type 0)
    i64.const 6
    call 74
    drop
    call 72
    drop)
  (func (;84;) (type 6) (param i32)
    i32.const 23192
    i32.const 123456
    call 1
    local.get 0
    i32.add
    i32.const 23192
    i32.load
    i32.add
    i32.store)
  (memory (;0;) 21)
  (global (;0;) (mut i32) (i32.const 678560))
  (global (;1;) i32 (i32.const 1184))
  (global (;2;) i32 (i32.const 5856))
  (global (;3;) i32 (i32.const 5968))
  (global (;4;) i32 (i32.const 6080))
  (global (;5;) i32 (i32.const 6192))
  (global (;6;) i32 (i32.const 1166))
  (global (;7;) i32 (i32.const 11192))
  (global (;8;) i32 (i32.const 23192))
  (global (;9;) i32 (i32.const 1024))
  (global (;10;) i32 (i32.const 23196))
  (global (;11;) i32 (i32.const 23200))
  (global (;12;) i32 (i32.const 678560))
  (global (;13;) i32 (i32.const 1024))
  (global (;14;) i32 (i32.const 678560))
  (global (;15;) i32 (i32.const 1376256))
  (global (;16;) i32 (i32.const 0))
  (global (;17;) i32 (i32.const 1))
  (global (;18;) i32 (i32.const 65536))
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
  (export "hxh_console_log_literal" (func 80))
  (export "export_enable_debug" (func 17))
  (export "export_enable_bigfunc_trace" (func 18))
  (export "export_wasm_arras_memsize" (func 19))
  (export "_special_bigfunc_beforebranch" (func 20))
  (export "export_nothing" (func 84))
  (export "special_bigfunc_localget_i32" (func 66))
  (export "special_bigfunc_localget_i64" (func 67))
  (export "hxh_reset" (func 73))
  (export "n_point" (global 2))
  (export "g_point" (global 3))
  (export "xd_point" (global 4))
  (export "int_to_str" (func 40))
  (export "digits10" (func 36))
  (export "add_chacha_byte" (func 21))
  (export "_special_bigfunc_chachabyte_1" (func 22))
  (export "_special_bigfunc_chachabyte_2" (func 23))
  (export "_special_bigfunc_chachafinish_1" (func 24))
  (export "_special_bigfunc_chachafinish_2" (func 25))
  (export "inject_all" (func 26))
  (export "vspoopf" (func 27))
  (export "strlen" (func 48))
  (export "strcat" (func 49))
  (export "i64_to_str" (func 41))
  (export "_spoopf" (func 28))
  (export "printf_buffer" (global 5))
  (export "hxh_console_log_char_string" (func 78))
  (export "absi" (func 30))
  (export "absi64" (func 31))
  (export "max_i32" (func 32))
  (export "min_i32" (func 33))
  (export "pow_i32" (func 34))
  (export "pow_i64" (func 35))
  (export "digits10i64" (func 37))
  (export "ithDigit10" (func 38))
  (export "ithDigit10i64" (func 39))
  (export "digitCharMap" (global 6))
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
  (export "locals_struct" (global 7))
  (export "_special_bigfunc_localset_i64" (func 63))
  (export "_special_bigfunc_localset_f32" (func 64))
  (export "_special_bigfunc_localset_f64" (func 65))
  (export "special_bigfunc_localget_f32" (func 68))
  (export "special_bigfunc_localget_f64" (func 69))
  (export "hxh_extended_literals_status" (func 75))
  (export "hxh_extended_literals_on" (func 76))
  (export "hxh_extended_literals_off" (func 77))
  (export "_hxh_add_char_string_microcode" (func 79))
  (export "memcpy_i8_to_arras_memory" (func 81))
  (export "_hxh_add_int_string_microcode" (func 82))
  (export "_hxh_breakpoint" (func 83))
  (export "nothing_state" (global 8))
  (export "__dso_handle" (global 9))
  (export "__data_end" (global 10))
  (export "__stack_low" (global 11))
  (export "__stack_high" (global 12))
  (export "__global_base" (global 13))
  (export "__heap_base" (global 14))
  (export "__heap_end" (global 15))
  (export "__memory_base" (global 16))
  (export "__table_base" (global 17))
  (export "__wasm_first_page_end" (global 18))
  (data (;0;) (i32.const 1024) "%d %d %d %d\00what da-|%d %d %l|-number!?\00Thu Oct 30 05:30:06 AM EDT 2025\00Welcome to Bananan Turd Labs. \0aCompiled: '%s'\00fa test=%d, digits=%d, ")
  (data (;1;) (i32.const 1166) "0123456789"))
