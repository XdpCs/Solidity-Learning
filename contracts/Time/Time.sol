// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Time {
    uint public start;
    constructor(){
        start = block.timestamp;
    }

    function judge() public view returns (bool) {
        if (block.timestamp >= start + 1 minutes)
            return true;
        return false;
    }
}
