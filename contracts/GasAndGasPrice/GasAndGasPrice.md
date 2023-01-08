# 10-Gas和Gas价格

## 基础知识

* 需要为一笔交易支付多少`Wei`?
    - 需要支付`gas消耗(gas spent) * gas价格(gas price)`数量的`Wei`
        - `gas`：计算单位
        - `gas消耗(gas spent)`：一笔交易中消耗的`gas`总数
        - `gas价格(gas price)`：你愿意支付的`gas`单价
* 拥有更高的`gas价格`的交易会有更高的优先权被打包入区块中
* 没有消耗完的`gas`将会被归还
* `gas` 限制`(gas limit)`
    - 默认花费的`gas`数量是`21000`个
    - `gas` 限制`(gas limit)`: 你所设置的用在这笔交易中的最大数量的`gas`
    - 区块`gas`限制`(block gas limit)`: 网络中设置的区块中所允许的最大数量的`gas`
* 使用完你发送的所有`gas`,这会导致交易失败,状态变量的更改会被回滚,消耗的`gas`不会被退还

## 例子

[例子](./Gas.sol)

该例子是表示函数出现死循环，消耗完用户所提供的所有`gas`，导致交易失败

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Gas {
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

* 这个循环会运行到直至所有`gas`消耗光，然后交易失败

## 链接

* 上一节：[9-时间单位](../Time/Time.md)
* 下一节：[11-枚举](../EnumDemo/Enum.md)