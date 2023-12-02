// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract GasAndGasPrice {
    uint public i = 0;

    function forever() external {
        while (true) {
            i += 1;
        }
    }
}
