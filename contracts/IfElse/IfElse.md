# 14-if/else

## 基础知识

* Solidity 支持条件声明 `if`,`else if`和`else`
* Solidity 不支持`switch`
* Solidity 支持三元运算符 语法为 条件表达式?表达式1:表达式2，条件表达式为真，选择表达式1，条件表达式为假，选择表达式2

## 例子

[例子](./IfElse.sol)

该例子是使用`if`,`else if`和`else`及三元运算符的例子

```solidity
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
```

## 程序解析

```solidity
function foo(uint x) public pure returns (uint){
    if (x < 10) {
        return 1114;
    } else if (x < 20) {
        return 1118;
    } else {
        return 824;
    }
}
```

* `if`,`else if`和`else`的使用

```solidity
    function ternary(uint _x) public pure returns (uint){
        if (_x < 10) {
            return 1114;
        }
        return 1118;
    }

    function ternaryShort(uint _x) public pure returns (uint){
        return _x < 10 ? 1114 : 1118;
    }
```

* 通过三元运算符，对if/else进行简写

## 链接

* 上一页：[13-映射](../Mapping/Mapping.md)
* 下一页：[15-for和while循环](../ForAndWhile/ForAndWhile.md)