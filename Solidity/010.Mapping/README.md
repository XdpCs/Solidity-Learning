# 010-映射(Mapping)

## 基础知识

* 创建映射(Mapping)的语法是`mapping(KeyType KeyName? => ValueType ValueName?) VariableName`，也可以写成`mapping(KeyType => ValueType)`
* 新增`Key Value`的语法是`Var[Key] = Value`，其中`Var`是映射变量名，`Key`和`Value`对应新增的键值对
* 删除`Key Value`的语法是`delete Var[Key]`，其中`Var`是映射变量名，`Key`是要删除的键
* 映射(Mapping)类似于数据结构中的`哈希表`
* 映射(Mapping)的细节
  * `KeyType`可以是Solidity的[值类型](../003.ValueType/README.md)，`bytes`，`string`和`合约类型`,不可以使用`自定义结构体`
  * `ValueType`可以是`任何类型`包含`映射(Mapping)`或者`数组`或者`结构体`
  * 映射(Mapping)的存储数据位置必须是storage,可以用于存储状态变量或函数内的存储引用或库函数的参数
  * 映射(Mapping)不能作为函数的参数或返回结果
  * 映射(Mapping)不能被遍历
  * 若映射(Mapping)声明为`public`，那么`Solidity`会自动给你创建一个`getter`函数，可以通过`Key`来查询对应的`Value`
* 映射(Mapping)原理
  * 映射(Mapping)在实际的初始化过程中，创建每个可能的Key，并将其映射到字节形式全是零的值:`一个类型的默认值`
  * 在映射(Mapping)中，实际上并不存储Key的值，而是存储它的`keccak256`的哈希值，从而便于查询实际的值
  * 映射(Mapping)中不存储`length`的信息

## 例子

[例子](./Mapping.sol)

该例子是使用映射(Mapping)的例子

```solidity
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

contract ValueContract {
    uint public value;

    constructor(uint _value) {
        value = _value;
    }
}
```

## 程序解析

### ValueContract 合约

```solidity
contract ValueContract {}
```

* 声明了一个叫`ValueContract`的空合约

### Mapping 合约

```solidity
mapping(address => uint) public map;
mapping(ValueContract => uint) public contractMap;
```

* 声明了`map`和`contractMap`，分别从 address 映射到 uint 和 ValueContract 映射到 uint
* `map`和`contractMap` 声明为`public`,其实会自动生成`get`函数

```solidity
function getMap(address _addr) public view returns (uint){
    return map[_addr];
}

function getContractMap(ValueContract _addr) public view returns (uint){
    return contractMap[_addr];
}
```

* 映射(Mapping)总是返回一个值
* 如果这个值从没被设置过，则将会返回`默认值`

```solidity
function setMap(address _addr, uint _i) public {
    map[_addr] = _i;
}

function getContractMap(ValueContract _addr) public view returns (uint){
    return contractMap[_addr];
}
```

* 更新这个地址或这个合约类型映射的值

```solidity
function removeMap(address _addr) public {
    delete map[_addr];
}

function removeContractMap(ValueContract _addr) public {
    delete contractMap[_addr];
}
```

* 重置这个值到默认值

### NestedMapping 合约

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

* 重置这个值到`默认值`

## 链接

* 上一节：[009-Gas和Gas价格](../009.GasAndGasPrice/README.md)
* 下一节：[011-结构体(Struct)](../011.Structs/README.md)
