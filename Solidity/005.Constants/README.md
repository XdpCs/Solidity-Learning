# 005-常量

## 背景

通过学习`Solidity`，然后输出文章检验自己的学习成果[github仓库](https://github.com/XdpCs/Solidity-learning)

## 基础知识

* 常量是不可修改的变量
* 它们的值是硬编码的，使用常量可以节省`gas`成本,还可以提高合约安全性
* 常量必须在声明的时候，进行初始化，之后便不能再改变了，且必须在编译时就确定其值，否则会报错
* 常量允许使用内置函数`keccak256`、`sha256`、`ripemd160`、`ecrecover`、`addmod` 和 `mulmod`（尽管除了`keccak256`之外，它们确实调用外部合约）
* [值类型变量](../003.ValueType/README.md)、`string`和`bytes`可以声明为`constant`

## 例子

[例子](./Constants.sol)

该例子是常量的使用方法的例子

```solidity
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
```

## 程序解析

```solidity
address public constant MY_ADDRESS = 0x0000000000000000000000000000000000001118;
uint public constant MY_UINT = 1118;
string public constant MY_STRING = "0x1118";
bytes public constant MY_BYTES = "FYY";
bool public constant MY_BOOL = false;
bytes32 public constant MY_KE256 = keccak256(abi.encodePacked("100"));
```

* 大写常量变量的名称是一种编码习惯

## 链接

* 上一节：[004-变量](../004.Variables/README.md)
* 下一节：[006-不可变变量](../006.Immutable/README.md)
