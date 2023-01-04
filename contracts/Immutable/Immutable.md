# 6-不可变变量

## 基础知识

* 不可变变量就像常量
* 不可变变量的值可以在构造函数中初始化或在声明时初始化，但初始化后就不能被修改了,这样可以节省`gas`,提高合约的安全性
* 数值变量可以声明为`immutable`
* `string`和`bytes`不可以声明为`immutable`,这不同于`constant`

## 例子

[例子](../Immutable/Immutable.sol)

该例子是如何对不可变变量进行赋值

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Immutable {
    address public immutable MY_ADDRESS;
    uint public immutable MY_UINT;
    uint public immutable MY_LOVE = 1118;

    constructor(uint _myUint){
        MY_ADDRESS = msg.sender;
        MY_UINT = _myUint;
    }
}
```

## 程序解析

```solidity
address public immutable MY_ADDRESS;
uint public immutable MY_UINT;
uint public immutable MY_LOVE = 1118;
```

* 大写不可变变量的名称是一种编码习惯

```solidity
constructor(uint _myUint){
    MY_ADDRESS = msg.sender;
    MY_UINT = _myUint;
}
```

* 不可变变量必须在构造函数的时候就赋值，构造函数只会在合约部署的时候调用一次

## 链接

* 上一页：[5-常量](../Constants/Constants.md)
* 下一页：[7-读取和写入状态变量](../ReadAndWriteState/ReadAndWriteState.md)