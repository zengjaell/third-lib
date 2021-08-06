/**
 * 
 * Release under GPLv-3.0.
 * 
 * @file    sum_test.cpp
 * @brief   
 * @author  gnsyxiang <gnsyxiang@163.com>
 * @date    06/08 2021 14:30
 * @version v0.0.1
 * 
 * @since    note
 * @note     note
 * 
 *     change log:
 *     NO.     Author              Date            Modified
 *     00      zhenquan.qiu        06/08 2021      create the file
 * 
 *     last modified: 06/08 2021 14:30
 */
#include <iostream>
#include <gtest/gtest.h>

#include "sum.h"

TEST(sum, testSum) {
	EXPECT_EQ(5, sum(2, 3));	// 求合2+3=5
	EXPECT_NE(3, sum(3, 4));	// 求合3+4 != 3
}
