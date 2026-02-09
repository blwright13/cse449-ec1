"""Todo item component."""

def:pub TodoItem(todo: dict, onToggle: any, onPriority: any, onDelete: any) -> any {
    has dropdownOpen: bool = False;

    return
        <div className="todo-item">
            <input
                type="checkbox"
                checked={todo.completed}
                onChange={lambda -> None { onToggle(todo.id); }}
                className="todo-checkbox"
            />
            <span className={("todo-title-completed" if todo.completed else "todo-title")}>
                {todo.title}
            </span>
            {(
                <span className="category-badge">{todo.category}</span>
            ) if todo.category and todo.category != "other" else None}
            <div className="priority-dropdown" style={{"display": "inline-block", "marginLeft": "12px"}}>
                <button
                    className="priority-dropdown-selected"
                    onClick={lambda -> None { isDropdownOpen = not isDropdownOpen; }}
                    style={{"minWidth": "84px"}}
                >
                    Priority: {selected}
                    <span className="priority-dropdown-arrow">{"▲" if isDropdownOpen else "▼"}</span>
                </button>
                {(
                    <ul className="priority-dropdown-list" style={{"position": "absolute", "background": "#fff", "border": "1px solid #bfcbe2", "marginTop": "4px", "padding": 0, "zIndex": 10}}>
                        {[(
                            <li 
                                key={option}
                                className={"priority-dropdown-option" + (" selected" if selected == option else "")}
                                onClick={lambda -> None { onPriority(todo.id, option); isDropdownOpen = False; }}
                                style={{"padding": "8px 16px", "cursor": "pointer", "background": ("#dde5f7" if selected == option else "#fff")}}
                            >
                                {option}
                            </li>
                        ) for option in options]}
                    </ul>
                ) if isDropdownOpen else None}
            </div>
            <button
                onClick={lambda -> None { onDelete(todo.id); }}
                className="todo-delete-btn"
            >
                ×
            </button>
        </div>;
}