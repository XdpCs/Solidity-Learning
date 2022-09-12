// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// 这是一个简单的合约,在合约中存储一个数，你可以增加和减少这个数
contract Counter {
    // 存储在合约中的count变量,用public修饰可见性，在后面可以知道，public修饰的变量，会自动生成一个get函数
    uint public count;

    // 该函数用于获取当前count的值，其实此函数是多此一举hhh
    function getCount() public view returns (uint) {
        return count;
    }

    // 该函数用于增加count值
    function inc() public {
        count++;
    }

    // 该函数用于减少count值，但是在刚开始部署合约的时候，不能先调用此函数
    // 因为在solidity 8.0版本之后，如果溢出，会将交易回滚，显示交易失败
    function dec() public {
        count--;
    }
}
