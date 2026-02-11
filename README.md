# CSE449 - Extra Credit 1
Name: Brady Wright

UMID: 95878946

### Added Feature
I added the ability for the user to track the priority of each task. Each task comes with a dropdown menu that allows the user to select Low, Medium, or High.

### Installation Instructions (WSL/Linux)
Clone the repo:
```bash
git clone git@github.com:blwright13/cse449-ec1.git
```

In the repo folder, create a virtual environment and install ```jaseci```:
```bash
python3 -m venv jac-env
source jac-env/bin/activate
pip install jaseci
```

Navigate to the ```my-todo-app``` folder:
```bash
cd my-todo-app
```

Start the Jac server:
```bash
jac start main.jac
```

### How the Feature Works
The feature works by adding an additional property to the Todo node in ```main.jac``` which tracks the current priority of the todo. In order to manage this todo, a walker is added to ```main.jac``` which is used to update the priority of the todo. The signature for the corresponding server-side function is added to ```frontend.cl.jac```, with its implementation in ```frontend.impl.jac```. Finally, a dropdown menu is added to ```TodoItem.cl.jac```, with the corresponding styling added to ```styles.css```. As a whole, this feature functions similarly to the ability to toggle todos as completed, but with more options. I was hoping to expand on this feature by adding the ability to sort todos by priority, but did not have time to add such functionality.