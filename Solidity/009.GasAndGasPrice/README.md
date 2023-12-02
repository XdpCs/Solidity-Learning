# 009-Gas和Gas价格

## 基础知识

* 需要为一笔交易支付多少 `ether` ?
  * 需要支付 `gas消耗(gas spent) * gas价格(gas price)`数量的`ether`
    * gas：计算单位
    * gas消耗(gas spent)：一笔交易中消耗的`gas`总数
    * gas价格(gas price)：你愿意支付的`gas`单价
* 拥有`更高的gas`价格的交易会有`更高的优先权`被打包入区块中
* 没有消耗完的`gas`将会被归还
* Gas限制(gas limit)
  * 你能花费的gas数量有2个上限
    * gas限制(gas limit)：你所设置的用在这笔交易中最大数量的`gas`
    * 区块gas限制(block gas limit)：网络中设置的区块中所允许的最大数量的`gas`
* 使用完你发送的所有`gas`，这会导致交易失败，状态变量的更改会被`回滚`，消耗的`gas`不会被退还
* 这样的机制是为了防止用户，使用低价`gas`去滥用系统

## 例子

[例子](./GasAndGasPrice.sol)

该例子说明了死循环，消耗完用户所提供的所有`gas`，导致交易失败

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract GasAndGasPrice {
    uint public i = 0;

    function forever() external {
        while (true) {
            i += 1;
        }
    }
}
```

## 程序解析

```solidity
function forever() external {
    while (true) {
        i += 1;
    }
}
```

* 这个循环运行直至所有`gas`消耗光，然后交易失败

## 链接

* 上一节：[008-时间单位](../008.TimeUnits/README.md)
