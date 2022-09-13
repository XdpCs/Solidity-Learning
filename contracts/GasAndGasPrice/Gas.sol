// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// 需要为一笔交易支付多少ether?
// 需要支付 gas消耗(gas spent) * gas价格(gas price)数量的ether
//    gas：计算单位
//    gas消耗(gas spent)：一笔交易中消耗的gas总数
//    gas价格(gas price)：你愿意支付的gas单价
// 拥有更高的gas价格的交易会有更高的优先权被打包入区块中
// 没有消耗完的gas将会被归还
// Gas 限制(gas limit)
// 你能花费的gas数量有2个上限
//     gas 限制(gas limit):你所设置的用在这笔交易中的最大数量的gas
//     区块gas限制(block gas limit):网络中设置的区块中所允许的最大数量的gas
contract Gas {
    uint public i = 0;

    // 使用完你发送的所有gas,这会导致交易失败
    // 状态变量的更改会被回滚
    // 消耗的gas不会被退还
    function forever() external {
        // 这个循环运行直至所有gas消耗光，然后交易失败
        while (true) {
            i += 1;
        }
    }

}
