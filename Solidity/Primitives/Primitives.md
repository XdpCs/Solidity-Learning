# 3-原始数据类型

## 基础知识

* 我将介绍四种在Solidity中可用的原始数据类型，它们都是值类型
    * bool
    * uint、int
    * address
    * bytes(定长数组)
* 布尔型(bool)
    * 布尔型的取值只有两种：true和false
    * 布尔型的运算符包括：
        * 比较运算符：>，>=，<，<=，==，!=
        * 与运算 &&
        * 或运算 ||
        * 非运算 !
    * &&和||运算符遵循短路规则，a||b，如果a是true,b不会被计算;a&&b,如果a是false,b不会被计算
    * 短路规则会更加节省gas费用
* 整数型(uint、int)
    * uint代表无符号整数，也就是说没有负数的整数
    * 有不同的字节数的无符号整数，可供使用
        * uint8 范围 从 0 到 2 ** 8 - 1
        * uint16 范围 从 0 到 2 ** 16 - 1
        * ... 以8位为递增
        * uint256 范围 从 0 到 2 ** 256 - 1
    * int表示有符号整数，在int中允许有负数存在
    * int表示的范围与uint表示的范围不同
        * int8 范围 从 -2 ** 7 到 2 ** 7 - 1
        * int16 范围 从 -2 ** 15 到 2 ** 15 - 1
        * ... 以8位为递增
        * int256 范围 从 -2 ** 255 到 2 ** 255 - 1
    * 整型的运算符
        * 比较运算符： <=， <， ==， !=， >=， >
        * 算数运算符： +，-，-（一元运算符），*，/，%（取余），**（幂）
* 地址类型(address)
    * address类型是一个20个字节的值
    * 有单纯的地址和可以进行ETH转账的地址(payable)两种类型
    * payable的地址拥有balance和transfer()
        * balance用于查询余额
        * transfer()用于转账
* 字节类型(bytes)
    * bytes表示一个字节序列
    * Solidity 提供了两种字节类型：
        * 固定大小的字节数组
            * 固定大小的字节数组属于原始数据类型、值类型
            * 固定大小的字节数组存储数据会更节省gas费用
        * 动态大小的字节数组
            * 动态大小的字节数组不属于此类型、值类型，在后面会讲
* 默认值
    * 未赋值的变量有一个默认值
    * 布尔型(bool)为false
    * 整数型(uint、int)为0
    * 地址类型(address)为0x0000000000000000000000000000000000000000
    * 字节类型(bytes)为0

## 例子

[例子](./Primitives.sol)

该例子是原始类型使用的例子

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Primitives {
    bool public b = false;
    bool public b1 = 1118 > 1114; // true
    bool public b2 = 1118 >= 1114; // true
    bool public b3 = 1118 < 1114; // false
    bool public b4 = 1118 <= 1114; // false
    bool public b5 = 1118 == 1114; // false
    bool public b6 = 1118 != 1114; // true
    bool public b7 = !b; // true
    bool public b8 = b1 && b2; // true
    bool public b9 = b3 && b1; // false,发生短路运算
    bool public b10 = b3 || b4; // false
    bool public b11 = b1 || b3; // true,发生短路运算

    uint8 public u8 = 18;
    uint24 public u24 = 1118;
    uint public u256 = 1114; // uint是uint256的别称
    int8 public i8 = - 18;
    int24 public i24 = 1118;
    int public i256 = - 1114; // int是int256的别称

    int public minInt = type(int).min;
    int public maxInt = type(int).max;

    int public int_1 = - 1114;
    int public int_2 = 1118 + 1114;
    int public int_3 = 1118 - 1114;
    int public int_4 = 18 * 14;
    int public int_5 = 18 / 18;
    int public int_6 = 1118 % 1114;
    int public int_7 = 2 ** 10;

    address public addr;

    constructor ()payable{

    }

    function getEth() public {
        addr = msg.sender;
        address  payable _addr = payable(addr);
        _addr.transfer(1 ether);
    }

    bytes1 public a1 = 0xb5; // [10110101]
    bytes2 public a2 = 0xb556; // [1011010101010110]
    bytes1 public a3 = a1[0]; // [10110101]

    bool public defaultBoo; // false
    uint public defaultUint; // 0
    int public defaultInt; // 0
    address public defaultAddr; // 0x0000000000000000000000000000000000000000
    bytes2 public defaultBytes; // 0x0000
}
```

## 程序解析

```solidity
    bool public b = false;
    bool public b1 = 1118 > 1114; // true
    bool public b2 = 1118 >= 1114; // true
    bool public b3 = 1118 < 1114; // false
    bool public b4 = 1118 <= 1114; // false
    bool public b5 = 1118 == 1114; // false
    bool public b6 = 1118 != 1114; // true
    bool public b7 = !b; // true
    bool public b8 = b1 && b2; // true
    bool public b9 = b3 && b1; // false,发生短路运算
    bool public b10 = b3 || b4; // false
    bool public b11 = b1 || b3; // true,发生短路运算
```

* 布尔型(bool)使用的例子

```solidity
    uint8 public u8 = 18;
    uint24 public u24 = 1118;
    uint public u256 = 1114; // uint是uint256的别称
    int8 public i8 = - 18;
    int24 public i24 = 1118;
    int public i256 = - 1114; // int是int256的别称
```

* 整数型(uint、int)使用的例子

```solidity
    int public minInt = type(int).min;
    int public maxInt = type(int).max;
```

* int的最大值和最小值

```solidity
    int public int_1 = - 1114;
    int public int_2 = 1118 + 1114;
    int public int_3 = 1118 - 1114;
    int public int_4 = 18 * 14;
    int public int_5 = 18 / 18;
    int public int_6 = 1118 % 1114;
    int public int_7 = 2 ** 10;
```

* 算术运算符的例子，如果想看比较运算符的例子，可以看上面布尔值的例子

```solidity
   address public addr;
```

* 地址类型(address)使用的例子

```solidity
constructor ()payable{

}
```

* 在部署合约的时候，需要向合约中转入eth,否则会调用失败
* 构造函数用payable修饰，保证部署合约的时候，能打入eth

```solidity
function getEth() public {
    addr = msg.sender;
    address  payable _addr = payable(addr);
    _addr.transfer(1 ether);
}
```

* 用户调用此函数，可以从合约中提取一个ether到自己的账户

```solidity
    bytes1 public a1 = 0xb5; // [10110101]
    bytes2 public a2 = 0xb556; // [1011010101010110]
    bytes1 public a3 = a1[0]; // [10110101]
```

* 字节类型(bytes)使用的例子

```solidity
    bool public defaultBoo; // false
    uint public defaultUint; // 0
    int public defaultInt; // 0
    address public defaultAddr; // 0x0000000000000000000000000000000000000000
    bytes2 public defaultBytes; // 0x0000
```

* 默认值使用的例子

## 链接

* 上一页：[2-第一个App](../FirstApp/FirstApp.md)
* 下一页：[4-变量](../Variables/Variables.md)