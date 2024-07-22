const todoInput = document.querySelector("#todo_input");
const addButton = document.querySelector("#add_btn");
const key= "todoList"
addButton.addEventListener("click", function(event){
    const todoContent = todoInput.value.trim();
    if(!todoContent)return;
    const todoItem ={
        id:new Date().valueOf(),
        content: todoContent,
        isDone: false,
    }
    saveToDoItem(todoItem);
})

function saveToDoItem(todoItem){
    const todoList = localStorage.getItem(key) || [];
    todoList.push(todoItem);
    const json = JSON.stringify(todoList);
    localStorage.setItem(key,json);
}