# 012-数组

## 背景

通过学习`Solidity`，然后输出文章检验自己的学习成果[Github仓库](https://github.com/XdpCs/Solidity-learning)

欢迎大家关注我的[X](https://twitter.com/CsXdp)

## 基础知识

* 数组是引用类型
* 数组可以分为定长数组和不定长数组
* 数组的元素可以是任何类型，包括 [mapping](../010.Mapping/README.md) 或 [struct](../011.Structs/README.md)
* 如果数组的可见性是`public`，`Solidity`会自动生成索引为必需参数的`getter`函数
* 访问超过数组长度，会导致操作失败，并进行回滚

### 定长数组

* 语法：`T[k]`，`k`表示数组的长度，`T`表示类型
* 成员变量
  * `length`：包含元素的数量

### 不定长数组

* 语法：`T[]`，`T`表示类型
* `bytes` 和 `string` 是特殊的数组类型
  * `bytes`
    * `bytes`和`bytes1[]`很相似，但是`bytes`存储更加紧凑，所以更加节省`gas`
    * 如果是确定的`bytes`数，使用`bytes1`到`bytes32`值类型，更加节省`gas`
    * 使用`bytes.concat(b1, b2)`进行`bytes`拼接
  * `string`
    * 和`bytes`很相似，但是无法使用索引访问，也没用`length`成员变量
    * `Solidity`中，可以通过`keccak256(abi.encodePacked(s1)) == keccak256(abi.encodePacked(s2))`比较两个`string`是否相等，使用`string.concat(s1, s2)`进行字符串拼接
  * 如果`string` 和 `bytes` 的数据很短 那么它们的长度也会和数据一起存储到同一个插槽。 具体为：
    * 如果数据长度小于等于`31`字节， 则它存储在高位字节（左对齐），最低位字节存储`length * 2`
    * `[0x0A, 0x00, 0x00, 0x00, 0x00 | data...]`，假设`bytes`的长度为`5`
    * 如果数据长度超出`31`字节，则在主插槽存储`length * 2 + 1`， 数据照常存储在`keccak256(slot)`中，假设`bytes`长度为`40`
    * `[0x29, 0x00, 0x00, 0x00, 0x00 | keccak256(p)...]`
  * `string.concat` 或 `bytes.concat`如果没有参数，会返回一个空数组
  * `bytes`或`bytes1`到`bytes32`可以和`string`相互转换
* 成员变量
  * `length`：除了`string`都有这个变量，是包含元素的数量
* 成员函数
  * `push():` 不定长的`storage`数组和`bytes`拥有这个成员函数，会在数组末添加一个初始化的`零值`的元素，并返回这个值引用，所以可以使用`x.push() = b`进行赋值，`gas`是常数级别消耗，因为只是存储一个初始化零值
  * `push(x):` 不定长的`storage`数组和`bytes`拥有这个成员函数，会在数组末尾添加一个值为`x`的元素，这个函数不返回任何东西
  * `pop():`不定长的`storage`数组和`bytes`拥有这个成员函数，从数组末尾移除元素，隐式对移除的元素使用`delete`，这个函数不返回任何东西，`gas`消耗依赖于被移除元素的`大小`
* 在`memory`数组中，创建不定长数组可以使用`new`操作符，创建好的`memory`数组不可以改变大小
* 定长的内存数组不能分配给不定长的内存数组，`uint[] memory x = [uint(1), 3, 4];`这是错的
* 数组的基本类型是数组中`第一个表达式的类型`，以便所有其他表达式都可以隐式转换为它。如果不能转换，则这是一个类型错误。`[uint(1), 2, 3]`，这是一个`uint[3]`的数组

## 例子

[例子](./Array.sol)

该例子是

## 链接

* 上一节：[010-映射(Mapping)](../010.Mapping/README.md)
