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
