# 8-以太币单位

## 基础知识

* 以太币单位

|         单位          | Wei                       | Wei值     |
|:-------------------:|---------------------------|----------|
|         Wei         | 1                         | 1 Wei    |
|   Kwei (babbage)    | 1,000                     | 1e3 Wei  |
|   Mwei (lovelace)   | 1,000,000                 | 1e6 Wei  |
|   Gwei (shannon)    | 1,000,000,000             | 1e9 Wei  |   
| microether (szabo)  | 1,000,000,000,000         | 1e12 Wei |
| milliether (finney) | 1,000,000,000,000,000     | 1e15 Wei |
|        ether        | 1,000,000,000,000,000,000 | 1e18 Wei |

* 交易需要支付ether
* 在Solidity中，单位之间的换算是在数字后边加上 wei，gwei 或 ether 来实现的
* 在Solidity中，后面没有单位，缺省为 wei
* 从Solidity0.7.0版本开始， finney 和 szabo 被移除了
* gwei 在solidity 0.6.11版本中添加，因此在0.6.11之前的版本中不可用

## 例子

该例子是测试了以太币的单位换算

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EtherUnits {
    uint public oneWei = 1 wei;
    bool public isOneWei = 1 wei == 1;

    uint public oneEther = 1 ether;
    bool public isOneEther = 1 ether == 1e18;

    uint public oneGwei = 1 gwei;
    bool public isOneGwei = 1 gwei == 1e9;
}

```

## 程序解析

```solidity
uint public oneWei = 1 wei;
bool public isOneWei = 1 wei == 1;
```

* 1 wei 等于 1，若没填写单位，默认是以wei为单位

```solidity
uint public oneEther = 1 ether;
bool public isOneEther = 1 ether == 1e18;
```

* 1 ether 等于 10^18 wei

```solidity
uint public oneGwei = 1 gwei;
bool public isOneGwei = 1 gwei == 1e9;
```

* 1 gwei 等于 10^9 wei

## 链接

* 上一节：[7-读取和写入状态变量](../ReadAndWriteState/ReadAndWriteState.md)
* 下一节：[9-时间单位](../Time/Time.md)
