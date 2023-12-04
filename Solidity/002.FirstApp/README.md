# 002-第一个App

## 背景

通过学习`Solidity`，然后输出文章检验自己的学习成果[github仓库](https://github.com/XdpCs/Solidity-learning)

## 基础知识

这是一个简单的计数器合约，在合约中存储一个数，你可以增加和减少此数

## 例子

该例子是一个链上计数器合约

[例子](./Counter.sol)

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Counter {
    uint public count;

    function getCount() public view returns (uint) {
        return count;
    }

    function inc() public {
        count++;
    }

    function dec() public {
        count--;
    }
}
```

## 程序解析

```solidity
uint public count;
```

* 存储在链上合约中的`count`变量,用`public`修饰可见性，在后面可以知道，`public`修饰的变量，会自动生成一个`get函数`

```solidity
function getCount() public view returns (uint) {
    return count;
}
```

* 该函数用于获取当前`count`的值，其实此函数是多此一举hhh

```solidity
function inc() public {
    count++;
}
```

* 该函数用于增加`count`的值

```solidity
function dec() public {
    count--;
}
```

* 该函数用于减少`count`的值，但是在刚开始部署合约的时候，不能先调用此函数
* 因为在`Solidity 8.0`版本之后，如果溢出，会将交易回滚，显示交易失败
* 溢出的问题，会在[003-值类型](../003.ValueType/README.md)中，讲解数值变量的范围

## 链接

* 上一节：[001-你好，世界](../001.HelloWorld/README.md)
* 下一节：[003-值类型](../003.ValueType/README.md)
