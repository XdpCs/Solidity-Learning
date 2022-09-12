// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// solidity中自带时间单位，他们分别是
// seconds、 minutes、 hours、 days 和 weeks
// 基本换算关系如下：
// 1 == 1 seconds
// 1 minutes == 60 seconds
// 1 hours == 60 minutes
// 1 days == 24 hours
// 1 weeks == 7 days
// 秒为缺省时间单位

contract Time {
    // 这些单位是不能直接用在变量后面
    // 想要使用，必须将输入变量换算为时间
    uint public start;
    bool public isTimeOut;
    constructor(){
        start = block.timestamp;
    }

    function judge() public {
        if (block.timestamp >= start + 1 seconds)
            isTimeOut = true;
    }
}
