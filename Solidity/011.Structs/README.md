# 011-结构体(Struct)

## 背景

通过学习`Solidity`，然后输出文章检验自己的学习成果[Github仓库](https://github.com/XdpCs/Solidity-learning)

欢迎大家关注我的[X](https://twitter.com/CsXdp)

## 基础知识

* 结构体(Struct)是`引用类型`
* 你可以通过结构体(Struct)定义自己的类型
* 结构体(Struct)可以将相关数据分组在一起
* 结构体(Struct)可以声明在合约外面并从其他合约中导入
* 结构体(Struct)无法包含其自身类型
* 结构体(Struct)中，若成员变量存在引用类型，建议使用`storage`获取该结构体的引用，以防止引用类型的数据丢失
* 结构体(Struct)有三种初始化的方法，会在下文的例子中讲到

## 例子

[例子](./Todos.sol)

该例子是通过使用结构体(Struct)存储待办事项的例子

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

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

## 程序解析

```solidity
struct Todo {
    string text;
    bool completed;
}
```

* 待办事项的结构体(Struct)

```solidity
Todo[] public todos;
```

* Todo结构体(Struct)数组

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

* 三种方法初始化一个结构体(Struct)
  * `Todo(_text, false)`，像函数调用一样初始化，这种方式不推荐，因为如果在结构体中间新增一个新的变量，所有初始化函数都需要改
  * `Todo({text : _text, completed : false})`，像键值对映射一样初始化，强烈推荐
  * `Todo memory todo`初始化一个结构体(Struct)变量，然后对其进行赋值

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

## 链接

* 上一节：[010-映射(Mapping)](../010.Mapping/README.md)
