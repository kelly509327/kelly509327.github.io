const addBtn = document.querySelector("#add_btn");
const editBtn = document.querySelector("#edit_btn");
const saveBtn = document.querySelector("#save_btn");
const deleteBtn = document.querySelector("#delete_btn");
const inputGroup = document.querySelector("#input_group");


let inputToDo = document.querySelector("#input");

editBtn.addEventListener("click", () => {
    editBtn.classList.add("hidden");
    saveBtn.classList.remove("hidden");
});

addBtn.addEventListener("click", () => {
    // input.textContent = "text";
    let inputGroupText = document.querySelector("#input");
    inputToDo = inputGroupText.placeholder;
    appendCardList();
})

deleteBtn.addEventListener("click", () => {
    localStorage.removeItem(storageKey);
})

saveBtn.addEventListener("click", () => {
    editBtn.classList.remove("hidden");
    saveBtn.classList.add("hidden");
    const val = inputToDo.value;
    localStorage.setItem(storageKey, val);
    inputToDo.value = "";
})

function appendCardList() {
    const div = document.createElement("input-group-text");
    inputGroup.append(div);

    const input = document.createElement("input");
    input.classList.add("form-check-input,mt-0");
    input.type = "checkbox";
    input.arialabel = "Checkbox for following text input";
    div.append(input);

    const inputText = document.createElement("input");
    inputText.classList.add("form-control");
    inputText.arialabel = inputToDo.textContent;
    div.append(inputText);

    // 找到要插入按钮的父容器
    const buttonContainer = document.getElementById('button-container');

    // 创建按钮组 div
    const btnGroup = document.createElement('div');
    btnGroup.classList.add('button-group');

    // 创建编辑按钮
    const editBtn = document.createElement('button');
    editBtn.type = 'button';
    editBtn.classList.add('btn', 'btn-outline-dark');
    editBtn.id = 'edit_btn';
    editBtn.textContent = '編輯';
    btnGroup.appendChild(editBtn);

    // 创建保存按钮
    const saveBtn = document.createElement('button');
    saveBtn.type = 'button';
    saveBtn.classList.add('btn', 'btn-outline-dark', 'hidden');
    saveBtn.id = 'save_btn';
    saveBtn.textContent = '保存';
    btnGroup.appendChild(saveBtn);

    // 创建删除按钮
    const deleteBtn = document.createElement('button');
    deleteBtn.type = 'button';
    deleteBtn.classList.add('btn', 'btn-outline-dark');
    deleteBtn.id = 'delete_btn';
    deleteBtn.textContent = '刪除';
    btnGroup.appendChild(deleteBtn);

    // 将按钮组添加到父容器中
    buttonContainer.appendChild(btnGroup);
    // 設定 div 內的 HTML
    // btnCard.innerHTML = `
    // <button type="button" class="btn btn-outline-dark" id="edit_btn">編輯</button>
    // <button type="button" class="btn btn-outline-dark hidden" id="save_btn">保存</button>
    // <button type="button" class="btn btn-outline-dark" id="delete_btn">刪除</button>
    // `;

}