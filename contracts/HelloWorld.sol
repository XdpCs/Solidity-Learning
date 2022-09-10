// SPDX-License-Identifier: MIT
// 如果不加此行，编译的时候，编译器会警告，但程序还是可以继续运行
// 如果你不想指定一个许可证，或者如果源代码不开源，请使用特殊值UNLICENSED
// 请注意,UNLICENSED(不存在于SPDX许可证列表中)与UNLICENSE(授予所有人所有权利)不同
// 每个源文件都应该注释最上面一行，以说明版权许可证
// 版权注释在文件的任何位置都可以被编译器识别，但建议把它放在文件的顶部。
// 编译器不会验证许可证是否属于SPDX版权许可列表,但它会在 bytecode metadata 中包含提供的字符串。
pragma solidity ^0.8.0;
// 源文件将不允许低于0.8.0版本并且不高于0.9.0的编译器编译,^表示高于
// 任何一个程序教学，开头都会教你如何写hello world，我也不例外
contract HelloWorld {
    // contract 声明了一个合约名字
    string public greet = "Hello World!";
    // 声明了一个string变量，并且可见性是public
}
