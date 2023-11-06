// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract Mapping {
    mapping(address => uint) public map;

    function get(address _addr) public view returns (uint){
        return map[_addr];
    }

    function set(address _addr, uint _i) public {
        map[_addr] = _i;
    }

    function remove(address _addr) public {
        delete map[_addr];
    }
}