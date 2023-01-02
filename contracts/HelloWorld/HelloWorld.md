# 1-你好，世界

任何一个程序教学，开头都会教你如何写`Hello World`，我也不例外

## 例子

该例子是在链上存储`"Hello World!"`的字符串

[例子](./HelloWorld.sol)

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HelloWorld {
    string public greet = "Hello World!";
}
```

## 程序解析

```solidity
// SPDX-License-Identifier: MIT
```

* 如果不加此行，编译的时候，编译器会警告，但程序可以编译成功
* 如果你不想指定一个许可证，或者源代码不开源，请使用特殊值`UNLICENSED`
* 注意，`UNLICENSED(不存在于SPDX许可证列表中)`与`UNLICENSE(授予所有人所有权利)`不同
* 每个源文件都应该注释最上面一行，以说明版权许可证
* 版权注释在文件的任何位置都可以被编译器识别，但建议把它放在文件的顶部
* 编译器不会验证许可证是否属于`SPDX`版权许可列表,但它会在`bytecode metadata`中包含提供的字符串

```solidity
pragma solidity ^0.8.0;
```

* 源文件不允许使用低于`0.8.0`版本并且不高于`0.9.0`的编译器编译,`^`表示高于

```solidity
contract HelloWorld
```

* `contract`声明了一个合约名字，名字叫`HelloWorld`

```solidity
string public greet = "Hello World!";
```

* 声明了一个`string`变量，并且可见性是`public`

## 链接

* 上一节：[0-序言](../Preface/Preface.md)
* 下一节：[2-第一个App](../FirstApp/FirstApp.md)