# 1-你好，世界

任何一个程序教学，开头都会教你如何写`Hello World`，此教程也不例外

## 例子

该例子是在链上存储`"Hello World!"`的字符串

[例子](./HelloWorld.sol)

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract HelloWorld {
    string public greet = "Hello World!";
}
```

## 程序解析

```solidity
// SPDX-License-Identifier: MIT
```

* 在链上的项目，一般都会把智能合约的代码公开，以取得使用者的信任
* 每个源文件都应该注释在最上面一行，以说明版权许可证
* 如果不加此行，编译的时候，编译器会警告，但程序仍然可以编译成功
* 如果不想指定一个许可证或源代码不开源，请使用特殊值`UNLICENSED`,注意，`UNLICENSED`(不存在于SPDX许可证列表中)与`UNLICENSE`(授予所有人所有权利)不同
* 版权注释在文件的任何位置都可以被编译器识别，但建议把它放在文件的顶部
* 编译器不会验证许可证是否属于`SPDX`版权许可列表,但它会在`bytecode metadata`中包含提供的字符串

```solidity
pragma solidity ^0.8.17;
```

* `pragma`关键字用于启用编译器特性或检查
* `pragma`指令只对该源文件下生效
* `pragma`指令不会改变编译器的版本
* `pragma`指令是指示编译器检查当前编译器的版本是否与编译所要求的版本一致
* 源文件不允许使用低于`0.8.17`版本并且不高于`0.9.0`的编译器进行编译,`^`表示高于
* 当开发智能合约时，应使用最新版本的`Solidity`，除某些特殊情况之外，因为一些安全问题只会在最新版本修复

```solidity
contract HelloWorld
```

* `contract`声明了一个合约的名字，名字叫`HelloWorld`

```solidity
string public greet = "Hello World!";
```

* 声明了一个`string`变量，并且可见性是`public`

## 参考资料

* [Solidity中文文档](https://docs.soliditylang.org/zh/latest)

## 链接

* 上一节：[0-序言](../Preface/Preface.md)
* 下一节：[2-第一个App](../FirstApp/FirstApp.md)