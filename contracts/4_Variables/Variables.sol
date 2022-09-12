// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// 在Solidity中有3种类型的变量
// 局部变量
//  1.声明在函数内部
//  2.不存储在区块链上
// 状态变量
//  1.声明在函数外部
//  2.存储在区块链上
// 全局变量
//  1.提供关于区块链上的信息
//  2.可以在函数内不声明直接使用
//  blockhash(uint blockNumber) returns (bytes32)：指定区块的哈希值--仅可用于最新的256个区块且不包括当前区块，否则返回0。
//  block.basefee (uint): 当前区块的基础费用
//  block.chainid (uint): 当前链 id
//  block.coinbase(address): 挖出当前区块矿工的地址
//  block.difficulty(uint): 当前区块难度
//  block.gaslimit(uint)：当前区块的gas限额
//  block.number(uint)：当前区块号
//  block.timestamp(uint)：当前区块的时间戳，自unix纪元以来的秒数
//  gasleft() returns (uint256)：剩余的gas
//  msg.data(bytes)：完整的calldata
//  msg.sender(address):消息发送者 (当前调用者)
//  msg.sig(bytes4)：calldata的前四个字节 (也就是函数标识符)
//  msg.value: (uint) 当前交易发送的wei的数量
//  tx.gasprice(uint):交易的gas价格
//  tx.origin(address):交易发起者(完全的调用链）
contract Variables {
    // 状态变量存储在区块链上，会更加消耗gas
    string public text = "hello,fyy";
    uint public num = 1118;
    uint public gasLeft;
    address public origin;
    uint public timestamp;

    function doSomething() public {
        // 局部变量不存储在区块链上，仅在函数执行过程中变量才有效，相比状态变量更加节省gas
        uint i = 1114;
        // 修改状态变量值
        text = "hello,xdp";
        // 全局变量的使用方法
        gasLeft = gasleft();
        origin = tx.origin;
        timestamp = block.timestamp;
    }
}
