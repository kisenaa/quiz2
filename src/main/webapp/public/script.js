let todo = {
    title:'',
    description:'',
    statis:false
}

let tasks = []

const myTodo = localStorage.getItem('myTodoTasks');
    if (myTodo) {
        task = (JSON.parse(myTodo))
    }

const handleChange = (e) => {
    console.log("bip")
    todo = ({...todo, [e.target.name]: e.target.value})
    return false
};

const handleSubmit = (e) => {
    e.preventDefault();
    console.log("bop")

    if (todo.title) {
        const newTask = { ...todo }
        tasks = [...tasks, newTask]
        todo = {
            title:'',
            description:'',
            statis:false
        }
        localStorage.setItem("myTodoTasks", JSON.stringify(tasks));
    }
    window.location.reload()
}