// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// 写入和更新状态变量需要发送一笔交易
// 读取状态变量是免费的，无需任何交易费用
contract SimpleStorage{
    // 存储一个数字的状态变量
    uint public num;

    //需要发送一笔交易才能写入状态变量
    function set(uint _num) public {
        num = _num;
    }

    // 读取状态变量不需要发送一笔交易
    function get() public view returns (uint) {
        return num;
    }
}