// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract Mapping {
    // 映射 address 到 uint
    mapping(address => uint) public map;

    // map 声明为public,其实会自动生成get函数
    function get(address _addr) public view returns (uint){
        // mapping 总是返回一个值
        // 如果这个值从没被设置过，则将会返回默认值
        return map[_addr];
    }

    function set(address _addr, uint _i) public {
        // 更新这个地址的值
        map[_addr] = _i;
    }

    function remove(address _addr) public {
        // 重置这个值到默认值
        delete map[_addr];
    }
}