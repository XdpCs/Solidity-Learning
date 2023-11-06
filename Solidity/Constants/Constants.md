# 5-常量

## 基础知识

* 常量是不可修改的变量
* 它们的值是硬编码的，使用常量可以节省gas成本,还可以提高合约安全性

## 例子

[例子](../Constants/Constants.sol)

该例子是常量的使用方法的例子

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Constants {
    address public constant MY_ADDRESS = 0x0000000000000000000000000000000000001118;
    uint public constant MY_UINT = 1118;
    string public constant MY_STRING = "0x1118";
    bytes public constant MY_BYTES = "FYY";
}
```

## 程序解析

```solidity
address public constant MY_ADDRESS = 0x0000000000000000000000000000000000001118;
uint public constant MY_UINT = 1118;
string public constant MY_STRING = "0x1118";
bytes public constant MY_BYTES = "FYY";
```

* 大写常量变量的名称是一种编码习惯
* 常量必须在声明的时候，进行初始化，之后便不能再改变了
* 数值变量、string和bytes可以声明为constant

## 链接

* 上一页：[4-变量](../Variables/Variables.md)
* 下一页：[6-不可变变量](../Immutable/Immutable.md)