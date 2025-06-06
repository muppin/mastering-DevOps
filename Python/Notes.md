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
   - Lists are commonly used for collections of items where the order and contents may change, or where modification of the elements is needed. For example, lists are suitable for storing a list of tasks, a list of numbers, or a list of user inputs, list of EC2 instances, list of S3 buckets.
   - Tuples are often used for fixed collections of items that should not change, or where immutability is desired. For example, tuples are used for representing coordinates, dates, or configuration settings or storing list of admins, which should not be modified.

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

For more info- https://github.com/iam-veeramalla/python-for-devops/tree/main/Day-08

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

## Lists, Tuples and sets

In Python, lists, tuples, and sets are three fundamental data structures used to store collections of items. Each has its own characteristics and use cases:

### Lists

- **Ordered**: Elements are stored in a specific order.
- **Mutable**: Elements can be added, removed, or changed.
- **Indexed**: Elements can be accessed by their index.
- **Duplicates Allowed**: Lists can contain duplicate elements.

#### Example

```python
# Define a list
my_list = [1, 2, 3, 4, 4, 5]

# Accessing elements
print("First element:", my_list[0])  # Output: 1

# Modifying elements
my_list[1] = 10
print("Modified list:", my_list)  # Output: [1, 10, 3, 4, 4, 5]

# Adding elements
my_list.append(6)
print("List after append:", my_list)  # Output: [1, 10, 3, 4, 4, 5, 6]

# Removing elements
my_list.remove(4)
print("List after removal:", my_list)  # Output: [1, 10, 3, 4, 5, 6]
```

### Tuples

- **Ordered**: Elements are stored in a specific order.
- **Immutable**: Elements cannot be changed after creation.
- **Indexed**: Elements can be accessed by their index.
- **Duplicates Allowed**: Tuples can contain duplicate elements.

#### Example

```python
# Define a tuple
my_tuple = (1, 2, 3, 4, 4, 5)

# Accessing elements
print("First element:", my_tuple[0])  # Output: 1

# Attempting to modify elements (will raise an error)
# my_tuple[1] = 10  # TypeError: 'tuple' object does not support item assignment

# Tuples can contain duplicates
print("Tuple with duplicates:", my_tuple)  # Output: (1, 2, 3, 4, 4, 5)
```

### Sets

- **Unordered**: Elements are not stored in a specific order.
- **Mutable**: Elements can be added or removed, but the set itself cannot contain mutable elements like lists.
- **Unindexed**: Elements cannot be accessed by an index.
- **No Duplicates**: Sets automatically remove duplicate elements.

#### Set Elements Must be Immutable

The elements of a set must be hashable, and mutable types like lists cannot be added to a set. However, immutable types like tuples can be elements of a set.
```
my_set = {1,2,3,(1,2)}
```
in the above set, set contains a tuple which is immutable

```
my_set = {1,2,3,[1,2]}
```
in the above set, set contains a list which is mutable which throws an error
#### Example

```python
# Define a set
my_set = {1, 2, 3, 4, 4, 5}

# Adding elements
my_set.add(6)
print("Set after adding an element:", my_set)  # Output: {1, 2, 3, 4, 5, 6}

# Removing elements
my_set.remove(2)
print("Set after removal:", my_set)  # Output: {1, 3, 4, 5, 6}

# Sets automatically remove duplicates
print("Set with duplicates removed:", my_set)  # Output: {1, 3, 4, 5, 6}
```

### Summary

| Feature              | List           | Tuple          | Set           |
|----------------------|----------------|----------------|---------------|
| Order                | Ordered        | Ordered        | Unordered     |
| Mutability           | Mutable        | Immutable      | Mutable       |
| Indexing             | Indexed        | Indexed        | Unindexed     |
| Duplicate Elements   | Allowed        | Allowed        | Not Allowed   |

Each of these data structures has its own strengths and is suitable for different scenarios:

- **Lists** are ideal when you need an ordered collection that can be modified.
- **Tuples** are best when you need an ordered collection that should not change after creation.
- **Sets** are useful for collections where order does not matter, and you need to ensure all elements are unique.

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

  - The enumerate function is a built-in function that allows you to iterate through a sequence and keep track of the index of each element. This function can be useful if you need to access the index of each element in the sequence.

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

### Conditional Statements-

  - if
  - elif
  - else

  - https://github.com/iam-veeramalla/python-for-devops/blob/main/Day-07/README.md
 
### Loops

- To perform the repetitive action on a block of code we use loops.
- There are two types of loops:
   - for -  this is used when there is definite number of executions (fixed number of executions)
   - while - the number of executions is decided dynamically

#### for

**syntax**

```
for variable in sequence:
    # Code to be executed for each item in the sequence
```
sequence can be range(n), lists, tuples

**example**

```
for i in range(n):
   print("something"
```
in the above example range(n) is a function that returns a list of numbers i.e from [0, 1, 2...., n-1]

#### while

**Syntax**

```
while condition:
    # Code to be executed as long as the condition is true
```

**Example**

```
count = 0
while count < 5:
    print(count)
    count += 1
```

#### Loop controls

- **break**: The "break" statement is used to exit the loop prematurely
- **continue**: The "continue" statement is used to skip the current iteration of the loop and proceed to the next one.

### Sets and Dictionaries

refer: https://github.com/muppin/python-for-devops/tree/main/Day-11



_________________________________________________________________________________________________________________________________________________________________________________________

### BOTO3

- BOTO3 is a module used to create resources on AWS or interact with AWS API's programatically using python.

**AWS CLI/BOTO3  Vs.  CFT/Teraaform**

- AWS CLI/BOTO3 is a scripting langauge, where as CFT/TF is a templating language.
- AWS CLI/BOTO3 is good for quick actions for example (aws s3 ls).
- BOTO3 supports serverless programming also. Ex. lambda functions
- First we have to authenticate to AWS, and then we have to talk to the particular service API, using the client connection.
- client = boto3.client('s3') -> same syntax for all resouces, just need to change s3 to whater ever resource we want.
- It is basically creating a client to talk to AWS API.
- OR
- resouce = boto3.resource('s3') - not supported for new AWS services, comparitively easier than client. But recommended way is to use client
- Resources represent an object-oriented interface to Amazon Web Services (AWS). They provide a higher-level abstraction than the raw, low-level calls made by service clients.
- botocore- moldule which handles exceptions

___________________________________________________________________________________________________________________________________________________________________________________________

### BOTO3 Project

- Created a lambda funtion wriiten python.
- To access AWS programatically by python , we have used a module called boto3.
- which will do API calls to AWS
- It will fetch the stale EBS volumes (6 months or later)

**Identifying Stale EBS Snapshots**

In this example, we'll create a Lambda function that identifies EBS snapshots that are no longer associated with any active EC2 instance and deletes them to save on storage costs.

**Description:**

The Lambda function fetches all EBS snapshots owned by the same account ('self') and also retrieves a list of active EC2 instances (running and stopped). For each snapshot, it checks if the associated volume (if exists) is not associated with any active instance. If it finds a stale snapshot, it deletes it, effectively optimizing storage costs.


