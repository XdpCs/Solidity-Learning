# 10-Gas和Gas价格

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

* 需要为一笔交易支付多少Wei?
    - 需要支付 gas消耗(gas spent) * gas价格(gas price)数量的Wei
        - gas：计算单位
        - gas消耗(gas spent)：一笔交易中消耗的gas总数
        - gas价格(gas price)：你愿意支付的gas单价
* 拥有更高的gas价格的交易会有更高的优先权被打包入区块中
* 没有消耗完的gas将会被归还
* Gas 限制(gas limit)
    - 你能花费的gas数量有2个上限
    - gas 限制(gas limit):你所设置的用在这笔交易中的最大数量的gas
    - 区块gas限制(block gas limit):网络中设置的区块中所允许的最大数量的gas
* 使用完你发送的所有gas,这会导致交易失败,状态变量的更改会被回滚,消耗的gas不会被退还
* 在Solidity中，单位之间的换算是在数字后边加上 wei，gwei 或 ether 来实现的，如果后面没有单位，缺省为 wei
* 从Solidity0.7.0版本开始， finney 和 szabo 被移除了。
* gwei 在solidity 0.6.11版本 中添加，因此在0.6.11之前的版本中不可用。

## 例子

[例子](./Gas.sol)

该例子说明了死循环，消耗完用户所提供的所有gas，导致交易失败和以太币单位测试

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Gas {
    uint public i = 0;

    function unit() pure external {
        assert(1 wei == 1);
        assert(1 gwei == 1e9);
        assert(1 ether == 1e18);
    }

    function forever() external {
        while (true) {
            i += 1;
        }
    }
}
```

## 程序解析

```solidity
 function unit() pure external {
    assert(1 wei == 1);
    assert(1 gwei == 1e9);
    assert(1 ether == 1e18);
}
```

* 当后面没有单位，缺省为 wei
* 测试了以太币的单位换算

```solidity
 function forever() external {
    while (true) {
        i += 1;
    }
}
```

* 这个循环运行直至所有gas消耗光，然后交易失败

## 链接

* 上一节：[9-时间单位](../Time/Time.md)
* 下一节：[11-映射](../Mapping/Mapping.md)