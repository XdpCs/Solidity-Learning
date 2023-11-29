# 003-值类型

## 基础知识

* 我将介绍四种在`Solidity`中可用的值类型
  * 布尔类型(bool)
  * 整数类型(uint、int)
  * 地址类型(address)
  * 定长数组类型(bytes)
  * 枚举类型(enum)

### 布尔类型(bool)

* 布尔型的取值只有两种：`true`和 `false`
* 布尔型的运算符包括：
  * 比较运算符：>，>=，<，<=，==，!=
  * 与运算 &&
  * 或运算 ||
  * 非运算 !
  * && 和 ||运算符遵循短路规则，a||b，如果a是true,b不会被计算;a&&b,如果a是false,b不会被计算
  * 短路规则，会更加节省gas费用

### 整数类型(uint、int)

#### uint

* `uint`代表无符号整数，也就是说没有负数的整数
* 有不同的字节数的无符号整数，可供使用
  * `uint8` 范围 从 0 到 $2^8-1$
  * `uint16` 范围 从 0 到 $2^{16}-1$
  * ... 以`8`位为递增
  * `uint256` 范围 从 0 到 $2^{256}-1$

#### int

* `int`表示有符号整数，在int中允许有`负数`存在
* `int`表示的范围与`uint`表示的范围不同
  * `int8` 范围 从 $-2^7$ 到 $2^7-1$
  * `int16` 范围 从 $-2^{15}$ 到 $2^{15}-1$
  * ... 以`8`位为递增
  * `int256` 范围 从 $-2^{255}$ 到 $2^{255}-1$

#### 整数类型(uint、int)的运算符

* 比较运算符： <=， <， ==， !=， >=， >
* 算数运算符： +，-，-（一元运算符），*，/，%（取余），**（幂）

### 地址类型(address)

* address类型是一个`20`字节的值
* 地址类型有两种
  * 普通地址（address）：可以调用`call`, `delegatecall` 和 `staticcall`成员方法
  * payable address: 比普通地址多了`transfer`和`send`两个成员方法用于转账，和一个成员变量`balance`用于查询余额

### 定长数组类型(bytes)

* `bytes`表示一个字节序列
* `Solidity`提供了两种字节类型：
  * 固定大小的字节数组
    * 固定大小的字节数组属于值类型
    * 固定大小的字节数组存储数据会更节省gas费用
  * 动态大小的字节数组
    * 动态大小的字节数组不属于值类型，在后面会讲
* `bytes1, bytes2, bytes3, ..., bytes32` 代表从`1`到`32`的字节序列
* `bytes`类型的运算符：
  * 比较运算符：<=， <， ==， !=， >=， >
  * 位运算符： &， |， ^ （按位异或）， ~ （按位取反）
  * 移位运算符： << （左移位）， >> （右移位）
  * 索引访问： 如果`x`是`bytesI`类型，那么当`0 <= k < I`时，`x[k]`返回第`k`个字节（只读)
* 移位运算符以无符号的整数类型作为右操作数（但返回左操作数的类型），它表示要移位的位数。有符号类型的移位将产生一个编译错误
* 成员变量：
  * `.length`: 这个字节数组的长度（只读）

### 枚举类型(enum)

* 枚举类型用于表示一组有限的值
* 枚举类型的声明：
  * `enum` 枚举名称 { 枚举值1, 枚举值2, ... }
  * 枚举值的类型是`uint8`，从`0`开始递增，不能超过`256`个

### 默认值

* 未赋值的变量有一个默认值
  * `布尔类型(bool)`为`false`
  * `整数类型(uint、int)`为`0`
  * `地址类型(address)`为`0x0000000000000000000000000000000000000000`
  * `定长数组类型(bytes)`为`0`，根据长度决定，比如`bytes2`为`0x0000`
  * `枚举类型(enum)`为`0`

## 例子

[例子](./ValueType.sol)

该例子是值类型使用的例子

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ValueType {
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

    enum XdpCs {Alan, Xu, love, fyy}
    XdpCs public xdpCs;

    function SetXdp(XdpCs x) public {
        xdpCs = x;
    }

    bool public defaultBoo; // false
    uint public defaultUint; // 0
    int public defaultInt; // 0
    address public defaultAddr; // 0x0000000000000000000000000000000000000000
    bytes2 public defaultBytes; // 0x0000
    XdpCs public defaultEnum; // 0
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

* 布尔类型(bool)使用的例子

```solidity
uint8 public u8 = 18;
uint24 public u24 = 1118;
uint public u256 = 1114; // uint是uint256的别称
int8 public i8 = - 18;
int24 public i24 = 1118;
int public i256 = - 1114; // int是int256的别称
```

* 整数类型(uint、int)使用的例子

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

* 算术运算符的例子，如果想看比较运算符的例子，可以看上面布尔类型的例子

```solidity
address public addr;
```

* 地址类型(address)使用的例子

```solidity
constructor ()payable{

}
```

* 在部署合约的时候，可以向合约中转入`eth`
* 构造函数用`payable`修饰，保证部署合约的时候，能打入`eth`

```solidity
function getEth() public {
    addr = msg.sender;
    address  payable _addr = payable(addr);
    _addr.transfer(1 ether);
}
```

* 用户调用此函数，可以从合约中提取一个`ether`到自己的账户

```solidity
bytes1 public a1 = 0xb5; // [10110101]
bytes2 public a2 = 0xb556; // [1011010101010110]
bytes1 public a3 = a1[0]; // [10110101]
```

* 定长数组类型(bytes)使用的例子

```solidity
enum XdpCs {Alan, Xu, love, fyy}
XdpCs public xdpCs;

function SetXdp(XdpCs x) public{
xdpCs = x;
}
```

* 枚举类型(enum)使用的例子

```solidity
bool public defaultBoo; // false
uint public defaultUint; // 0
int public defaultInt; // 0
address public defaultAddr; // 0x0000000000000000000000000000000000000000
bytes2 public defaultBytes; // 0x0000
XdpCs public defaultEnum; // 0
```

* 默认值使用的例子

## 链接

* 上一页：[2-第一个App](../002.FirstApp/README.md)
* 下一页：[4-变量](../004.Variables/README.md)
