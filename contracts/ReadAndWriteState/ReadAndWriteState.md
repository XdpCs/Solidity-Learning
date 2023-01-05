# 7-读取和写入状态变量

## 基础知识

* 写入和更新状态变量需要发送一笔交易
* 读取状态变量是免费的，无需任何交易费用

## 例子

[例子](../ReadAndWriteState/SimpleStorage.sol)

该例子是读写一个状态变量的例子

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleStorage {
    uint public num;

    function set(uint _num) public {
        num = _num;
    }

    function get() public view returns (uint) {
        return num;
    }
}
```

## 程序解析

```solidity
uint public num;
```

* 存储一个`uint`的状态变量

```solidity
 function set(uint _num) public {
    num = _num;
}
```

* 需要发送一笔交易才能写入状态变量

```solidity
function get() public view returns (uint) {
    return num;
}
```

* 读取状态变量时，不需要发送一笔交易

## 链接

* 上一节：[6-不可变变量](../Immutable/Immutable.md)
* 下一节：[8-以太币单位](../EtherAndWei/EtherAndWei.md)