# 2-第一个App

这是一个计数器合约,在合约中存储一个数,可以对这个数进行增加和减少操作

## 例子

该例子是一个链上计数器合约

[例子](./Counter.sol)

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

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

* `count`是存储在链上合约中的变量,用`public`修饰可见性,在后面的文章中可以知道，`public`修饰的变量，会自动生成一个`get`函数

```solidity
function getCount() public view returns (uint) {
    return count;
}
```

* 该函数用于获取当前`count`变量的值，其实此函数是多此一举hhh

```solidity
function inc() public {
    count++;
}
```

* 该函数用于增加`count`变量的值

```solidity
function dec() public {
    count--;
}
```

* 该函数用于减少`count`变量的值，但是在部署合约完成后，不能先调用此函数
* 因为在`Solidity 8.0`版本之后，如果溢出，会将交易回滚，显示交易失败
* 溢出的问题，会在[3-原始数据类型](../Primitives/Primitives.md)中，讲解数值变量的范围

## 链接

* 上一节：[1-你好，世界](../HelloWorld/HelloWorld.md)
* 下一节：[3-原始数据类型](../Primitives/Primitives.md)