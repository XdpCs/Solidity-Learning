# 11-枚举

## 基础知识

* Solidity支持可枚举，它们对于建模选择和跟踪状态很有用
* 枚举(enum)可以声明在合约外面并从其他合约中导入
* 枚举(enum)主要通过`uint`分配名称，名称从`0`开始
* 枚举(enum)可以显式的和`uint`进行相互转换，并且会检查所转换的无符号整数是否在枚举长度范围内

## 例子

[例子1](./Enum.sol)

本例子是通过使用枚举(enum)模拟发货状态

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Enum {
    enum Status{
        Pending,
        Shipped,
        Accepted,
        Rejected,
        Canceled
    }

    Status public status;

    function get() public view returns (Status){
        return status;
    }

    function set(Status _status) public {
        status = _status;
    }

    function cancel() public {
        status = Status.Canceled;
    }

    function reject() public {
        status = Status.Rejected;
    }

    function accept() public {
        status = Status.Accepted;
    }

    function ship() public {
        status = Status.Shipped;
    }

    function pending() public {
        status = Status.Pending;
    }

    function reset() public {
        delete status;
    }
}
```

例子2

本例子是说明枚举(enum)可以声明在合约外面，并且可以被导入

[EnumImport.sol](./EnumImport.sol)

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./EnumDeclaration.sol";

contract EnumImport {
    Status public status;
}
```

[EnumDeclaration.sol](./EnumDeclaration.sol)

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
    enum Status {
        Pending,
        Shipped,
        Accepted,
        Rejected,
        Canceled
    }
```

## 程序解析

### 例子1

```solidity
 enum Status {
    Pending,
    Shipped,
    Accepted,
    Rejected,
    Canceled
}
```

* 枚举(enum)表示发货状态

```solidity
Status public status;
```

* 默认值是列出的第一个元素
* 在本例子中，默认值为"Pending"

```solidity
function get() public view returns (Status) {
    return status;
}
```

* 返回值为uint类型
    * Pending为0
    * Shipped为1
    * Accepted为2
    * Rejected为3
    * Canceled为4

```solidity
function set(Status _status) public {
    status = _status;
}
```

* 通过输入uint类型数字更新status变量,若大于枚举(enum)范围,会交易失败

```solidity
function cancel() public {
    status = Status.Canceled;
}
```

* 更新status为Canceled

```solidity
  function reject() public {
    status = Status.Rejected;
}
```

* 更新status为Rejected

```solidity
function accept() public {
    status = Status.Accepted;
}
```

* 更新status为Accepted

```solidity
function ship() public {
    status = Status.Shipped;
}
```

* 更新status为Shipped

```solidity
function pending() public {
    status = Status.Pending;
}
```

* 更新status为Pending

```solidity
function reset() public {
    delete status;
}
```

* 重置status值为第一个值，0

### 例子2

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
    enum Status {
        Pending,
        Shipped,
        Accepted,
        Rejected,
        Canceled
    }
```

* 枚举(enum)在文件中声明，在合约外声明

```solidity
import "./EnumDeclaration.sol";
```

* 导入枚举(enum)文件

## 链接

* 上一节：[10-Gas和Gas价格](../GasAndGasPrice/GasAndGasPrice.md)
* 下一节：[12-结构体](../Struct/Struct.md)
