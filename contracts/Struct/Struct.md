# 12-结构体

## 基础知识

* 你可以通过结构体(struct)定义自己的类型
* 结构体(struct)可以将相关数据分组在一起
* 结构体(struct)可以声明在合约外面并从其他合约中导入

## 例子

[例子1](./Todos.sol)

该例子是通过使用结构体(struct)存储待办事项的例子

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Todos {
    struct Todo {
        string text;
        bool completed;
    }

    Todo[] public todos;

    function createOneWay(string memory _text) public {
        todos.push(Todo(_text, false));
    }

    function createTwoWay(string memory _text) public {
        todos.push(Todo({text : _text, completed : false}));
    }

    function createThreeWay(string memory _text) public {
        Todo memory todo;
        todo.text = _text;
        todos.push(todo);
    }

    function get(uint _index) public view returns (string memory text, bool completed){
        Todo storage todo = todos[_index];
        return (todo.text, todo.completed);
    }

    function update(uint _index, string memory _text) public {
        Todo storage todo = todos[_index];
        todo.text = _text;
    }

    function toggleCompleted(uint _index) public {
        Todo storage todo = todos[_index];
        todo.completed = !todo.completed;
    }
}
```

例子2

本例子是说明结构体(struct)可以声明在合约外面，并且可以被导入

[StructDeclaration.sol](./StructDeclaration.sol)

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

    struct Todo {
        string text;
        bool completed;
    }
```

[TodosStruct.sol](./TodosStruct.sol)

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./StructDeclaration.sol";

contract TodosStruct {
    Todo[] public todos;
}
```

## 程序解析

### 例子1

```solidity
struct Todo {
    string text;
    bool completed;
}
```

* 待办事项的结构体(struct)

```solidity
Todo[] public todos;
```

* Todo结构体(struct)数组

```solidity
    function createOneWay(string memory _text) public {
    todos.push(Todo(_text, false));
}

    function createTwoWay(string memory _text) public {
        todos.push(Todo({text : _text, completed : false}));
    }

    function createThreeWay(string memory _text) public {
        Todo memory todo;
        todo.text = _text;
        todos.push(todo);
    }
```

* 三种方法初始化一个结构体(struct)
    * function createOneWay(string memory _text)像函数调用一样初始化
    * function createTwoWay(string memory _text)像键值对映射一样初始化
    * function createThreeWay(string memory _text)，初始化一个结构体(struct)变量，然后对其进行赋值

```solidity
function get(uint _index) public view returns (string memory text, bool completed){
    Todo storage todo = todos[_index];
    return (todo.text, todo.completed);
}
```

* 由于todos声明为public，Solidity会自动生成get方法，所以你其实不需要此方法

```solidity
function update(uint _index, string memory _text) public {
    Todo storage todo = todos[_index];
    todo.text = _text;
}
```

* 更新text

```solidity
function toggleCompleted(uint _index) public {
    Todo storage todo = todos[_index];
    todo.completed = !todo.completed;
}
```

* 更新completed

### 例子2

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

    struct Todo {
        string text;
        bool completed;
    }
```

* 结构体(struct)在文件中声明，在合约外声明

```solidity
import "./StructDeclaration.sol";
```

* 导入结构体(struct)文件

## 链接

* 上一节：[11-枚举](../EnumDemo/Enum.md)
* 下一节：[13-映射](../Mapping/Mapping.md)