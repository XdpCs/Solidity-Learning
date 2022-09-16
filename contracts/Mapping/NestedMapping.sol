// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NestedMapping {
    // 嵌套映射 address 到 另一个mapping
    mapping(address => mapping(uint => bool)) public nested;

    function get(address _addr, uint _i) public view returns (bool){
        // 你可以从嵌套映射中得到值，即使没有初始化
        return nested[_addr][_i];
    }

    function set(address _addr, uint _i, bool _boo) public {
        nested[_addr][_i] = _boo;
    }

    function remove(address _addr, uint _i) public {
        delete nested[_addr][_i];
    }
}
