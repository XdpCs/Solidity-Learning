# 6-不可变变量

## 基础知识

* 不可变变量类似于`常量`，但是少了一些约束
* 不可变变量的值可以在`构造函数`中初始化或`在声明时`初始化，但初始化后就不能被修改了,这样可以节省`gas`，提高合约的安全性
* [值类型变量](../003.ValueType/README.md)可以声明为`immutable`
* 和`constant`不同，`string和bytes`不可以声明为`immutable`，
* 在`Solidity 0.8.21`之前，如果不对`不可变变量`，在构造函数或声明时初始化赋值，会报`TypeError: Construction control flow ends without initializing all immutable state variables.`

## 例子

[例子](./Immutable.sol)

该例子是如何对不可变变量进行赋值

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Immutable {
    address public immutable MY_ADDRESS;
    uint public immutable MY_UINT;
    uint public immutable MY_LOVE = 1118;
    uint public immutable NO_USAGE;

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
uint public immutable NO_USAGE;
```

* 大写不可变变量的名称是一种编码习惯
* `NO_USAGE` 是用来展示不对`不可变变量`进行初始化，但是由于`Solidity`对每个变量都有默认值，所以部署后，访问这个值会返回`0`

```solidity
constructor(uint _myUint){
    MY_ADDRESS = msg.sender;
    MY_UINT = _myUint;
}
```

* `不可变变量`必须在构造函数的时候就赋值，`构造函数`只会在合约部署的时候调用一次

## 链接

* 上一页：[5-常量](../005.Constants/README.md)
