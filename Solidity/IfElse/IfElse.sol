// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract IfElse {
    function foo(uint x) public pure returns (uint){
        if (x < 10) {
            return 1114;
        } else if (x < 20) {
            return 1118;
        } else {
            return 824;
        }
    }

    function ternary(uint _x) public pure returns (uint){
        if (_x < 10) {
            return 1114;
        }
        return 1118;
    }

    function ternaryShort(uint _x) public pure returns (uint){
        return _x < 10 ? 1114 : 1118;
    }
}
