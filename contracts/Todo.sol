// SPDX-License-Identifier: MIT
pragma solidity ^0.8;


contract Todo{

    struct Todos{
       uint todoId;
       string todoDescription;
       bool isDone;

    }

    Todos[] public todos;

    function createTodo(uint _todoId, string memory _todoDescription, bool _isDone ) public {
        todos.push(Todos({
            todoId: _todoId,
            todoDescription: _todoDescription,
            isDone: false

        }));

    }

    function updateTodo(uint _todoId, string memory _todoDescription) external view {
         
        Todos memory setTodo = todos[_todoId];
        require(_todoId == setTodo.todoId, "Jazz off! who goes you?");
        require(!setTodo.isDone, "This project is already completed" );
        setTodo.todoDescription = _todoDescription;

    }

    function removeTodo(uint _todoId) external {
        Todos memory setTodo = todos[_todoId];
        delete setTodo.todoId;

    }
}
