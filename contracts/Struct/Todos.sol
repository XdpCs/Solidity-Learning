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
