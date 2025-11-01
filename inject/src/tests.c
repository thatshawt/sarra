#include "poopmath.h"
#include "utils.h"

struct{
    s32 passed;
    u8* test_name;
}test_struct;

void reset_test_struct()
{
    test_struct.passed = FALSE;
    test_struct.test_name = 0;
}

void test_struct_print_result_message()
{
    if(test_struct.passed == TRUE){
        _poopf("PASSED '%s'", test_struct.test_name);
    }else{
        _poopf("FAILED '%s'", test_struct.test_name);
    }
}

void assert_true(s32 a, u8* test_name)
{
    test_struct.test_name = test_name;
    if(a == TRUE){
        test_struct.passed = TRUE;
    }else{
        test_struct.passed = FALSE;
    }
    test_struct_print_result_message();
}

void assert_false(s32 a, u8* test_name)
{
    test_struct.test_name = test_name;
    if(a == TRUE){
        test_struct.passed = FALSE;
    }else{
        test_struct.passed = TRUE;
    }
    test_struct_print_result_message();
}

//TODO. add test for _poopf... probably test vspoopf instead cus how do we test printf buffer stuff :skull:

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

    assert_true(digits10(INT32_MAX) == 10, "digits10(INT32_MAX) == 10");

    assert_true(digits10(INT32_MIN) == 10, "digits10(INT32_MIN) == 10");
}

void do_all_tests(){
    test_digits10();
}