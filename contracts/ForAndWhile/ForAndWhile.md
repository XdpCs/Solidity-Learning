# 15-for和while循环

## 基础知识

* Solidity 支持`for`,`while`和`do while`循环
* 不要写无限循环，因为这可能会导致超越gas limit，从而造成交易失败
* 由于上面的原因，很少使用`while`和`do while`循环
* Solidity不支持`goto`
* `continue`跳出当前循环，进入下一个循环
* `break`结束当前循环

## 例子

[例子](./Loop.sol)

* 该例子是for`,`while`和`do while`循环及`continue`、`break`使用的例子

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Loop {
    uint public iFor;
    uint public jWhile;
    uint public jDoWhile;

    function loop() public {
        for (uint i = 0; i < 1120; i++) {
            if (i == 1114) {
                continue;
            }
            if (i == 1118) {
                iFor = i;
                break;
            }
            iFor = i;
        }

        uint j;
        while (j < 10) {
            j++;
        }
        jWhile = j;

        j = 0;
        do {
            j++;
        }
        while (j < 10);
        jDoWhile = j;
    }
}
```

## 程序解析

```solidity
uint public iFor;
uint public jWhile;
uint public jDoWhile;
```

* 存储循环结果的变量

```solidity
for(uint i = 0; i < 1120; i++) {
    if (i == 1114) {
        continue;
    }
    if (i == 1118) {
        iFor = i;
        break;
    }
    iFor = i;
}
```
* `for`循环的使用
* `continue`跳出当前循环，进入下一个循环
* `break`结束当前循环

```solidity
    uint j;
    while (j < 10) {
        j++;
    }
    jWhile = j;
```

* `while`循环的使用

```solidity
    j = 0;
    do {
        j++;
    }while (j < 10);
    jDoWhile = j;
```

* `do while`循环的使用

## 链接

* 上一节：[14-if/else](../IfElse/IfElse.md)
* 下一节：[16-数组](../Array/Array.md)