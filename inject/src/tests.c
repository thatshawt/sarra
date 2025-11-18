#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wpointer-sign"

#include "poopmath.h"
#include "utils.h"
#include "poopstrings.h"

struct{
    s32 passed;
    u8* test_name;
}test_struct;

void reset_test_struct()
{
    test_struct.passed = FALSE;
    test_struct.test_name = 0;
}

// void test_struct_print_result_message()
// {
//     if(test_struct.passed == TRUE){
//         _poopf("%s '%s'", PASSED_MSG, test_name);
//     }else{
//         _poopf("%s '%s'", FAILED_MSG, test_name);
//     }
// }

#define PASSED_MSG "PASS"
#define FAILED_MSG "FAILED"

void assert_true(s32 a, u8* test_name)
{
    if(a == TRUE){
        _poopf("%s %d == TRUE. '%s'", PASSED_MSG, a, test_name);
    }else{
        _poopf("%s %d != TRUE. '%s'", FAILED_MSG, a, test_name);
    }
}

void assert_false(s32 a, u8* test_name)
{
    if(a == FALSE){
        _poopf("%s %d == FALSE. '%s'", PASSED_MSG, a, test_name);
    }else{
        _poopf("%s %d != FALSE. '%s'", FAILED_MSG, a, test_name);
    }
}

void assert_int_equals(s32 a, s32 b, u8* test_name)
{
    if(a == b){
        _poopf("%s %d == %d '%s'", PASSED_MSG, a,b, test_name);
    }else{
        _poopf("%s %d != %d '%s'", FAILED_MSG, a,b, test_name);
    }
}

void assert_string_equals(u8* a, u8* b, u8* test_name)
{
    if(a == NULL || b == NULL){
        _poopf("%s (null pointer) '%s'", FAILED_MSG, test_name);
        return;
    }
    s32 cmp = memcmp(a, b, strlen((char*)a)+1);
    if(cmp == 0){
        _poopf("%s '%s'=='%s' '%s'", PASSED_MSG, a, b, test_name);
    }else{
        _poopf("%s '%s'!='%s' '%s'", FAILED_MSG, a, b, test_name);
    }
}

void test_digits10(){
    reset_test_struct();
    // assert_true(digits10(0) == 1, "digits10(0) == 1");
    // assert_true(digits10(1) == 1, "digits10(1) == 1");
    // assert_true(digits10(-1) == 1, "digits10(-1) == 1");
    
    s32 result = TRUE;
    for(int i=-9;i<=9;i++){
        result = result && (digits10(i) == 1);
    }
    assert_true(result == TRUE, "digits10 single digit nums");

    result = TRUE;
    for(int i=-99;i<=99;i++){
        //skip length 1 nums
        if(BETWEEN_INC(i,-9,9))continue;
        result = result && (digits10(i) == 2);
    }
    assert_true(result == TRUE, "digits10 two digit nums");

    // result = TRUE;
    // for(int i=-999999999;i<=999999999;i++){
    //     if(i == -99999999){//skip all other lengths straight to length 9 positive end
    //         i = 100000000;
    //     }
    //     result = result && (digits10(i) == 9);
    // }
    // assert_true(result == TRUE, "digits10 9 digit nums");
    assert_true(digits10(999999999) == 9, "digits10(999999999) == 9");
    assert_true(digits10(INT32_MAX) == 10, "digits10(INT32_MAX) == 10");
    assert_true(digits10(INT32_MIN) == 10, "digits10(INT32_MIN) == 10");
}

void test_digits10i64(){
    reset_test_struct();
    // assert_true(digits10(0) == 1, "digits10(0) == 1");
    // assert_true(digits10(1) == 1, "digits10(1) == 1");
    // assert_true(digits10(-1) == 1, "digits10(-1) == 1");
    
    s32 result = TRUE;
    for(int i=-9;i<=9;i++){
        result = result && (digits10i64(i) == 1);
    }
    assert_true(result == TRUE, "digits10i64 single digit nums");

    result = TRUE;
    for(int i=-99;i<=99;i++){
        //skip length 1 nums
        if(BETWEEN_INC(i,-9,9))continue;
        result = result && (digits10i64(i) == 2);
    }
    assert_true(result == TRUE, "digits10i64 two digit nums");

    assert_true(digits10i64(999999999) == 9, "digits10i64(999999999) == 9");

    assert_true(digits10i64(INT32_MAX) == 10, "digits10i64(INT32_MAX) == 10");
    assert_true(digits10i64(INT32_MIN) == 10, "digits10i64(INT32_MIN) == 10");

    assert_true(digits10i64(999999999999999999) == 18, "digits10i64(999999999999999999) == 18");
    assert_true(digits10i64(INT64_MAX) == 19, "digits10i64(INT64_MAX) == 19");

    assert_true(digits10i64(-999999999999999999) == 18, "digits10i64(-999999999999999999) == 18");
    assert_true(digits10i64(INT64_MIN) == 19, "digits10i64(INT64_MIN) == 19");
}

void test_f32_to_str(){
    u8 buffer[100] = {0};
    s32 result = -1;
    
    result = f32_to_str(buffer, 0.0f);
    assert_int_equals(result, strlen(buffer), "f32_to_str(0.0f) length");
    assert_string_equals(buffer, "0.00", "f32_to_str(0.0f) dest");
    memset(buffer, 0, sizeof(buffer));

    result = f32_to_str(buffer, 1.0f);
    assert_int_equals(result , strlen(buffer), "f32_to_str(1.0f) length");
    assert_string_equals(buffer, "1.00", "f32_to_str(1.0f) dest");
    memset(buffer, 0, sizeof(buffer));

    result = f32_to_str(buffer, -1.0f);
    assert_int_equals(result , strlen(buffer), "f32_to_str(-1.0f) length");
    assert_string_equals(buffer , "-1.00", "f32_to_str(-1.0f) dest");
    memset(buffer, 0, sizeof(buffer));

    result = f32_to_str(buffer, 10.0f);
    assert_int_equals(result, strlen(buffer), "f32_to_str(10.0f) length");
    assert_string_equals(buffer , "10.00", "f32_to_str(10.0f) dest");
    memset(buffer, 0, sizeof(buffer));

    result = f32_to_str(buffer, 3.1415926f);
    assert_int_equals(result, strlen(buffer), "f32_to_str(3.1415926) length");
    assert_string_equals(buffer, "3.1415925", "f32_to_str(3.1415926) dest");
    memset(buffer, 0, sizeof(buffer));

    result = f32_to_str(buffer, (f32)123.456123);
    assert_int_equals(result, strlen(buffer), "f32_to_str(123.456123) length");
    assert_string_equals(buffer, "123.4561233", "f32_to_str(123.456123) dest");
    memset(buffer, 0, sizeof(buffer));
}

void test_spoopf()
{
    u8 buffer[100] = {0};

    _spoopf(buffer, 100, "%f", 123.123f);
    assert_string_equals(buffer, "123.1230010", "_spoopf(buffer, 100, \"%f\", 123.123f)");
    memset(buffer, 0, sizeof(buffer));

    _spoopf(buffer, 100, "%f %f", 123.123, 456.456);
    assert_string_equals(buffer, "123.1230010 456.4559936", "_spoopf(buffer, 100, \"%f %f\", 123.123f, 456.456f)");
    memset(buffer, 0, sizeof(buffer));

    _spoopf(buffer, 100, "%z", 123.123123123);
    assert_string_equals(buffer, "123.123123122999", "_spoopf(buffer, 100, \"%z\", (f64)123.123123123)");
    memset(buffer, 0, sizeof(buffer));

}

void test_int_to_str()
{
    u8 buffer[32] = {0};

    int result = int_to_str(buffer, 0);
    assert_int_equals(result, strlen(buffer), "int_to_str(0) length");
    assert_string_equals(buffer, "0", "int_to_str(0) dest");
    memset(buffer, 0, sizeof(buffer));

    result = int_to_str(buffer, 12345);
    assert_int_equals(result, strlen(buffer), "int_to_str(12345) length");
    assert_string_equals(buffer, "12345", "int_to_str(12345) dest");
    memset(buffer, 0, sizeof(buffer));

    result = int_to_str(buffer, -9876);
    assert_int_equals(result, strlen(buffer), "int_to_str(-9876) length");
    assert_string_equals(buffer, "-9876", "int_to_str(-9876) dest");
    memset(buffer, 0, sizeof(buffer));

    result = int_to_str(buffer, 42);
    assert_int_equals(result, strlen(buffer), "int_to_str(42) length");
    assert_string_equals(buffer, "42", "int_to_str(42) dest");
    memset(buffer, 0, sizeof(buffer));

    result = int_to_str(buffer, -1);
    assert_int_equals(result, strlen(buffer), "int_to_str(-1) length");
    assert_string_equals(buffer, "-1", "int_to_str(-1) dest");
    memset(buffer, 0, sizeof(buffer));

}


void do_all_tests(){
    test_digits10();
    test_digits10i64();
    test_f32_to_str();
    test_spoopf();
    test_int_to_str();
}

#pragma clang diagnostic pop

