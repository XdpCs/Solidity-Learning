// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Constants {
    address public constant MY_ADDRESS = 0x0000000000000000000000000000000000001118;
    uint public constant MY_UINT = 1118;
    string public constant MY_STRING = "0x1118";
    bytes public constant MY_BYTES = "FYY";
    bool public constant MY_BOOL = false;
    bytes32 public constant MY_KE256 = keccak256(abi.encodePacked("100"));
}