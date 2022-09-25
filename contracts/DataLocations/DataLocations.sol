// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DataLocations {
    uint[] public arr;
    mapping(uint => address)map;

    struct MyStruct {
        uint foo;
    }

    mapping(uint => MyStruct) myStructs;

    function f() public {
        _f(arr, map, myStructs[1]);
        MyStruct storage myStruct = myStructs[1];
        MyStruct memory myMemStruct = MyStruct(0);

    }

    function _f(uint[] storage _arr,
        mapping(uint => address) storage _map,
        MyStruct storage _myStruct
    ) internal {
        _arr.push(1114);
        _map[1] = address(0x1118);
        _myStruct.foo = 1118;
    }

    function g(uint[] memory _arr) public pure returns (uint[] memory){
        if (_arr.length == 0) {
            uint[] memory returnArr = new uint[](2);
            returnArr[0] = 1118;
            returnArr[1] = 1114;
            return returnArr;
        }
        else
            return _arr;
    }
}
