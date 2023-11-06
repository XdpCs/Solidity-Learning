// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Primitives {
    bool public b = false;
    bool public b1 = 1118 > 1114; // true
    bool public b2 = 1118 >= 1114; // true
    bool public b3 = 1118 < 1114; // false
    bool public b4 = 1118 <= 1114; // false
    bool public b5 = 1118 == 1114; // false
    bool public b6 = 1118 != 1114; // true
    bool public b7 = !b; // true
    bool public b8 = b1 && b2; // true
    bool public b9 = b3 && b1; // false,发生短路运算
    bool public b10 = b3 || b4; // false
    bool public b11 = b1 || b3; // true,发生短路运算

    uint8 public u8 = 18;
    uint24 public u24 = 1118;
    uint public u256 = 1114; // uint是uint256的别称
    int8 public i8 = - 18;
    int24 public i24 = 1118;
    int public i256 = - 1114; // int是int256的别称

    int public minInt = type(int).min;
    int public maxInt = type(int).max;

    int public int_1 = - 1114;
    int public int_2 = 1118 + 1114;
    int public int_3 = 1118 - 1114;
    int public int_4 = 18 * 14;
    int public int_5 = 18 / 18;
    int public int_6 = 1118 % 1114;
    int public int_7 = 2 ** 10;

    address public addr;

    constructor ()payable{

    }

    function getEth() public {
        addr = msg.sender;
        address  payable _addr = payable(addr);
        _addr.transfer(1 ether);
    }

    bytes1 public a1 = 0xb5; // [10110101]
    bytes2 public a2 = 0xb556; // [1011010101010110]
    bytes1 public a3 = a1[0]; // [10110101]

    bool public defaultBoo; // false
    uint public defaultUint; // 0
    int public defaultInt; // 0
    address public defaultAddr; // 0x0000000000000000000000000000000000000000
    bytes2 public defaultBytes; // 0x0000
}
