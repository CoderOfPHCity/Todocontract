// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract Todo {
    struct Todos {
        string title;
        string todoDescription;
        bool isDone;
    }

    Todos[] public todos;

    function createTodo(
        string memory _title, 
        string memory _todoDescription)
        public
    {
        todos.push(
            Todos({
                title: _title,
                todoDescription: _todoDescription,
                isDone: false
            })
        );
    }

    function updateTodo(
        uint256 _todoId,
        string memory _title,
        string memory _todoDescription
    ) external {
        // Todos memory setTodo = todos[_todoId];
        require(!todos[_todoId].isDone, "This project is already completed");
        todos[_todoId].title = _title;
        todos[_todoId].todoDescription = _todoDescription;
    }

    function isDone(uint256 _todoId) external {
        todos[_todoId].isDone = !todos[_todoId].isDone;
    }

    function getAllTodo() external view returns(Todos[] memory){
        return todos;

    }
}