# Python

## Shell scripting vs Python scripting

### Shell scripting

- primary purpose of shell scripting is to interact, manage, get info from Linux systems.
- works only with the linux systems

### python

- python works with both linux and windows
- it also can be used to write complex programs, to interact with apis and data manupulation purpose.
- python has rich modules, where scripting becomes easier and efficient

For more info: https://github.com/iam-veeramalla/python-for-devops/blob/main/Day-01/01-shell-vs-python.md

## Python

- Python is a Dynamically typed programming language
- For each datatypes in python you have built-in functions

## Data Types

In programming, a data type is a classification or categorization that specifies which type of value a variable can hold. Data types are essential because they determine how data is stored in memory and what operations can be performed on that data. Python, like many programming languages, supports several built-in data types. Here are some of the common data types in Python:

1. **Numeric Data Types:**
   - **int**: Represents integers (whole numbers). Example: `x = 5`
   - **float**: Represents floating-point numbers (numbers with decimal points). Example: `y = 3.14`
   - **complex**: Represents complex numbers. Example: `z = 2 + 3j`

2. **Sequence Types:**
   - **str**: Represents strings (sequences of characters). Example: `text = "Hello, World"`
   - **list**: Represents lists (ordered, mutable sequences). Example: `my_list = [1, 2, 3]`
   - **tuple**: Represents tuples (ordered, immutable sequences). Example: `my_tuple = (1, 2, 3)`

3. **Mapping Type:**
   - **dict**: Represents dictionaries (key-value pairs). Example: `my_dict = {'name': 'John', 'age': 30}`

4. **Set Types:**
   - **set**: Represents sets (unordered collections of unique elements). Example: `my_set = {1, 2, 3}`
   - **frozenset**: Represents immutable sets. Example: `my_frozenset = frozenset([1, 2, 3])`

5. **Boolean Type:**
   - **bool**: Represents Boolean values (`True` or `False`). Example: `is_valid = True`

6. **Binary Types:**
   - **bytes**: Represents immutable sequences of bytes. Example: `data = b'Hello'`
   - **bytearray**: Represents mutable sequences of bytes. Example: `data = bytearray(b'Hello')`

7. **None Type:**
   - **NoneType**: Represents the `None` object, which is used to indicate the absence of a value or a null value.

8. **Custom Data Types:**
   - You can also define your custom data types using classes and objects.

### Difference between Lists and Tuples

In Python, both lists and tuples are used to store collections of items, but they have some key differences:

1. **Mutability**:
   - Lists: Lists are mutable, meaning their elements can be modified after creation. You can add, remove, or change elements in a list.
   - Tuples: Tuples are immutable, meaning their elements cannot be modified after creation. Once a tuple is created, its elements cannot be changed.

2. **Syntax**:
   - Lists are defined using square brackets `[]`, with elements separated by commas.
   - Tuples are defined using parentheses `()`, with elements separated by commas.

3. **Use Cases**:
   - Lists are commonly used for collections of items where the order and contents may change, or where modification of the elements is needed. For example, lists are suitable for storing a list of tasks, a list of numbers, or a list of user inputs.
   - Tuples are often used for fixed collections of items that should not change, or where immutability is desired. For example, tuples are used for representing coordinates, dates, or configuration settings.

4. **Performance**:
   - Lists typically have slightly larger memory overhead than tuples because they are mutable. However, this difference is usually negligible for small collections.
   - Tuples can be faster than lists for certain operations due to their immutability. For example, iterating over a tuple can be faster than iterating over a list.

Here's a quick example demonstrating the syntax and mutability difference between lists and tuples:

```python
# List example
my_list = [1, 2, 3, 4, 5]
my_list[0] = 10  # Modify the first element
print(my_list)   # Output: [10, 2, 3, 4, 5]

# Tuple example
my_tuple = (1, 2, 3, 4, 5)
# Attempting to modify a tuple will result in an error:
# my_tuple[0] = 10  # This will raise a TypeError
print(my_tuple)     # Output: (1, 2, 3, 4, 5)
```

In summary, use lists when you need a mutable collection of items, and use tuples when you want an immutable collection of items or when you need to ensure the integrity of the data.

## Variables and Keywords 

### Keywords

- Keywords are reserved words in Python that have predefined meanings and cannot be used as variable names or identifiers.
- These words are used to define the structure and logic of the program.
- They are an integral part of the Python language and are case-sensitive, which means you must use them exactly as specified.
- refer - https://github.com/iam-veeramalla/python-for-devops/blob/main/Day-03/keywords.md

### Variables

-  Variables makes your much easier
-  variable is a named storage location used to store data.
-  Variables are essential for programming as they allow us to work with data, manipulate it, and make our code more flexible and reusable.

There are 2 types of Variables:
- **Global** : They are available for the entire python programme, and these are created outside the function.
- **Local** : They are created inside the function and are completely restricted to that function alone.

**Note** : *Variable Lifetime*: The lifetime of a variable is determined by when it is created and when it is destroyed or goes out of scope. Local variables exist only while the function is being executed, while global variables exist for the entire duration of the program.

### Best practices for declaring variables

- **use Lower case**
- **use Snake_casing/camelCasing**
- **Should be descriptive enough**

**Note**: fstrring in python which allow variables to be inserted directly into the string.
for ex:
```
server_name = "my_server"
print(f"Server Name: {server_name}")
```

## Functions, Modules and packages

### Functions

- A function in Python is a block of code that performs a specific task. Functions are defined using the def keyword and can take inputs, called arguments. They are a way to encapsulate and reuse code.
- for ex:
```
  def greet(name):
    return f"Hello, {name}!"

message = greet("Alice")
print(message)
```

### Modules

- Module is collection of functions.
- module is a Python script containing Python code. It can define functions, classes, and variables that can be used in other Python scripts. Modules help organize and modularize your code, making it more maintainable
- for ex: Suppose you have a Python file named my_module.py:
```
def square(x):
    return x ** 2

pi = 3.14159265
```

You can use this module in another script:
```
import my_module

result = my_module.square(5)
print(result)
print(my_module.pi)
```

### Packages

- Package is a collection of modules.
- A package is a directory that contains one or more Python modules and an optional special file called __init__.py. The __init__.py file is used to initialize the package and can contain initialization code or define variables and functions that are available when the package is imported.
- Example:
Consider the following directory structure:


```
mypackage/
├── __init__.py
├── module1.py
├── module2.py
└── subpackage/
    ├── __init__.py
    └── submodule.py
```


mypackage/: The top-level package directory.
__init__.py: Initialization file for the package.
module1.py, module2.py: Python modules within the package.
subpackage/: A subpackage directory.
subpackage/__init__.py: Initialization file for the subpackage.
subpackage/submodule.py: Python module within the subpackage.
**PIP** - Python Package installer


### Virtual Environment

- Logical separation for python projects.
- A virtual environment in Python is a self-contained directory hierarchy that contains its own Python interpreter and libraries.
- It allows you to create isolated environments for different Python projects, each with its own set of dependencies, without interfering with the system-wide Python installation or other projects.

**Steps**
- Install virtualenv-  ```pip install virtualenv```
- Create your virtualenv- ```python -m venv myenv```
- Activate- ```source myenv/bin/activate```
- Deactivate- ```conda deactivate```



### Command Line Arguments and Environment variables

- Command line Arguments are used to pass the arguments to the python programme while running the programme.
- These are dynamically passed by the user while running the programme.
- The command line arguments are read by sys module
- for ex:
- ```
  import sys

  num1 = int(sys.argv[1])  #by default the arguments read are String type.
  num2 = int(sys.argv[2])
  ```

  **Environment Variables**

  - When you want to store some sensitive information, we use environment variables
  - to create env variable ``` export <env_name>="<env_value>"```
  - using os madule, we can read the env variables
    ```
    import os

    print(os.getenv("<env_name>")
    ```
  
  


