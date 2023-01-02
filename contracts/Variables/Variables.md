# 4-变量

## 基础知识

* 在`Solidity`中有`3`种类型的变量
    * 局部变量
        * 声明在函数内部
        * 不存储在区块链上
    * 状态变量
        * 声明在函数外部
        * 存储在区块链上
    * 全局变量
        * 提供关于区块链上的信息
        * 可以在函数内不声明直接使用
        * 全局变量列举
            * `blockhash(uint blockNumber) returns (bytes32)`: 指定区块的哈希值--仅可用于最新的`256`个区块且不包括当前区块，否则返回`0`
            * `block.basefee (uint)`: 当前区块的基础费用
            * `block.chainid (uint)`: 当前链 `id`
            * `block.coinbase(address)`: 挖出当前区块矿工的地址
            * `block.difficulty(uint)`: 当前区块难度
            * `block.gaslimit(uint)`: 当前区块的`gas`限额
            * `block.number(uint)`: 当前区块号
            * `block.timestamp(uint)`: 当前区块的时间戳，自`unix`纪元以来的秒数
            * `gasleft() returns (uint256)`: 剩余的`gas`
            * `msg.data(bytes)`: 完整的`calldata`
            * `msg.sender(address)`: 消息发送者 (当前调用者)
            * `msg.sig(bytes4)`：`calldata`的前四个字节 (也就是函数标识符)
            * `msg.value(uint)`: 当前交易发送的`wei`的数量
            * `tx.gasprice(uint)`: 交易的`gas`价格
            * `tx.origin(address)`: 交易发起者(完全的调用链）

## 例子

[例子](../Variables/Variables.sol)

该例子是局部变量、状态变量和全局变量使用的例子

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Variables {
    string public text = "hello,fyy";
    uint public num = 1118;
    uint public gasLeft;
    address public origin;
    uint public timestamp;

    function doSomething() public {
        uint i = 1114;
        text = "hello,xdp";
        gasLeft = gasleft();
        origin = tx.origin;
        timestamp = block.timestamp;
    }
}
```

## 程序解析

```solidity
string public text = "hello,fyy";
uint public num = 1118;
uint public gasLeft;
address public origin;
uint public timestamp;
```

* 状态变量存储在区块链上，会更加消耗`gas`

```solidity
uint i = 1114; 
```

* 局部变量不存储在区块链上，仅在函数执行过程中变量才有效，相比状态变量更加节省`gas`

```solidity
text = "hello,xdp";
gasLeft = gasleft();
origin = tx.origin;
timestamp = block.timestamp;
```

* 修改状态变量值

```solidity
gasLeft = gasleft();
origin = tx.origin;
timestamp = block.timestamp;
```

* 全局变量的使用方法

## 链接

* 上一页：[3-原始数据类型](../Primitives/Primitives.md)
* 下一页：[5-常量](../Constants/Constants.md)