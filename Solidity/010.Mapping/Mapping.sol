// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;


contract Mapping {
    mapping(address => uint) public map;
    mapping(ValueContract => uint) public contractMap;

    function getMap(address _addr) public view returns (uint){
        return map[_addr];
    }

    function setMap(address _addr, uint _i) public {
        map[_addr] = _i;
    }

    function removeMap(address _addr) public {
        delete map[_addr];
    }

    function getContractMap(ValueContract _addr) public view returns (uint){
        return contractMap[_addr];
    }

    function setContractMap(ValueContract _addr, uint _i) public {
        contractMap[_addr] = _i;
    }

    function removeContractMap(ValueContract _addr) public {
        delete contractMap[_addr];
    }
}

contract NestedMapping {
    mapping(address => mapping(uint => bool)) public nested;

    function get(address _addr, uint _i) public view returns (bool){
        return nested[_addr][_i];
    }

    function set(address _addr, uint _i, bool _boo) public {
        nested[_addr][_i] = _boo;
    }

    function remove(address _addr, uint _i) public {
        delete nested[_addr][_i];
    }
}

contract ValueContract {}