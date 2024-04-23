# 008-时间单位

## 背景

通过学习`Solidity`，然后输出文章检验自己的学习成果[Github仓库](https://github.com/XdpCs/Solidity-learning)

欢迎大家关注我的[X](https://twitter.com/CsXdp)

## 基础知识

* `Solidity`中自带时间单位，它们分别是
  * seconds
  * minutes
  * hours
  * days
  * weeks
* 基本换算关系如下：
  * 1 == 1 seconds
  * 1 minutes == 60 seconds
  * 1 hours == 60 minutes
  * 1 days == 24 hours
  * 1 weeks == 7 days
* `seconds`为缺省时间单位
* 在`Solidity 0.5.0`之后，`years`已经被移除

## 例子

[例子](./TimeUnits.sol)

该例子是判断当前时间是否大于合约部署后的一分钟

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract TimeUnits {
    uint public start;
    constructor(){
        start = block.timestamp;
    }

    function judge() public view returns (bool) {
        if (block.timestamp >= start + 1 minutes)
            return true;
        return false;
    }
}
```

## 程序解析

```solidity
function judge() public view returns (bool) {
    if (block.timestamp >= start + 1 minutes)
        return true;
    return false;
}
```

* 这些时间单位是不能直接用在`变量`后面，想要使用，必须将输入变量换算为时间

## 链接

* 上一节：[007-以太币单位](../007.EtherUnits/README.md)
