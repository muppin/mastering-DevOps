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
  


