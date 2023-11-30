# 13-映射

## 基础知识

* 创建映射(Mapping)的语法是Mapping(KeyType => ValueType)
* 映射(Mapping)类似于数据结构中的哈希表
* 映射(Mapping)的细节
    * KeyType可以是Solidity的原始数据类型,bytes和string或合约类型、枚举类型,不可以使用自定义结构体
    * ValueType可以是任何类型包含一个映射(Mapping)或者一个数组
    * 映射(Mapping)的存储数据位置必须是storage,可以用于存储状态变量或函数内的存储引用或库函数的参数
    * 映射(Mapping)不能作为函数的参数或返回结果
    * 映射(Mapping)不能被遍历
* 映射(Mapping)原理
    * 映射(Mapping)在实际的初始化过程中，创建每个可能的key，并将其映射到字节形式全是零的值:一个类型的默认值
    * 在映射(Mapping)中，实际上并不存储key的值，而是存储它的keccak256哈希值，从而便于查询实际的值
    * 映射(Mapping)中不存储length的信息
* 映射(Mapping)默认值是所有元素都为其默认值

## 例子

[例子1](./Mapping.sol)

该例子是使用映射(Mapping)的例子

```solidity
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
```

[例子2](./NestedMapping.sol)

* 该例子是使用嵌套映射(Mapping)的例子

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

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
```

## 程序解析

### 例子1

```solidity
mapping(address => uint) public map;
```

* 映射 address 到 uint
* map 声明为public,其实会自动生成get函数

```solidity
function get(address _addr) public view returns (uint){
    return map[_addr];
}
```

* 映射(Mapping) 总是返回一个值
* 如果这个值从没被设置过，则将会返回默认值

```solidity
function set(address _addr, uint _i) public {
    map[_addr] = _i;
}
```

* 更新这个地址的值

```solidity
function remove(address _addr) public {
    delete map[_addr];
}
```

* 重置这个值到默认值

### 例子2

```solidity
mapping(address => mapping(uint => bool)) public nested;
```

* 嵌套映射 address 到 另一个mapping

```solidity
function get(address _addr, uint _i) public view returns (bool){
    return nested[_addr][_i];
}
```

* 你可以从嵌套映射中得到值，即使没有初始化

```solidity
 function set(address _addr, uint _i, bool _boo) public {
    nested[_addr][_i] = _boo;
}
```

* 设置这个地址和这个整数型的值

```solidity
function remove(address _addr, uint _i) public {
    delete nested[_addr][_i];
}
```

* 重置这个值到默认值

## 链接

* 上一节：[12-结构体](../Struct/Struct.md)
* 下一节：[14-if/else](../IfElse/IfElse.md)