// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// 交易需要支付ether
// 1 ether 等于 10^18 wei
// 1 gwei 等于 10^9 wei
contract EtherUnits {
    uint public oneWei = 1 wei;
    // 1 wei 等于 1，若没填写单位，默认是wei为单位
    bool public isOneWei = 1 wei == 1;

    uint public oneEther = 1 ether;
    // 1 ether 等于 10^18 wei
    bool public isOneEther = 1 ether == 1e18;

    uint public oneGwei = 1 gwei;
    // 1 gwei 等于 10^9 wei
    bool public isOneGwei = 1 gwei == 1e9;
}
