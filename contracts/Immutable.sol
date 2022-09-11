// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
// 不可变变量就像常量
// 不可变变量的值可以在构造函数中初始化或在声明时初始化，但初始化后就不能被修改了
// 这样可以节省gas,提高合约的安全性
contract Immutable {
    // 大写不可变变量的名称是一种编码习惯
    address public immutable MY_ADDRESS;
    uint public immutable MY_UINT;
    uint public immutable MY_LOVE = 1118;

    constructor(uint _myUint){
        MY_ADDRESS = msg.sender;
        MY_UINT = _myUint;
    }
}
