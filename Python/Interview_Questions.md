**Describe a real-world example of how you used Python to solve a DevOps challenge.**

Here you can talk about the projects that we did in this series
- GitHub Webhooks
- JIRA integration
- File Operations

**Sample answer**- Github-jira integration
- **Prolem statement**:
  - We have our sourcecode stored in github and all the work is tracked in jira
  - So there was a requirement given to me by the development team, that when ever a developer comments "/jira" in the github issue, a python script should be trigerred
  - and that script should create a jira ticket with all the information available on pull request or github issue
  
- **Solution**:
  - I wrote a python script which is a flask based application
  - It will expose an API and that API will be shared with github
  - So whenever a developer comments "/jira", a github webhook is trigerred
  - and it send the payload to flask API
  - Now this flask API will read the pull request and check if the comment is "/jira", it will tak to the jira api and it will create a ticket


  **********************************************************************************************************************************************************************************

  **Discuss the challenges that you faced while using Python for DevOps and how did you overcome it.**

  - I was not able to figure out the issue_type_ID: I explored the documentation
  - It was my first time with flask
  - Issues with webhooks
 
  **********************************************************************************************************************************************************************************

  **How can you secure your Python code and scripts?**

  - Any kind of sensitive data, I will not put in the code
  - I will try to use options such as command line arguments
  - If there is a password or API tocken to put then an environment variable
  - Handle any sensetive information using Input variables, command line arguments or env vars.
 
  **********************************************************************************************************************************************************************************

  **Explain the difference between mutable and immutable objects.**

  - Mutable- can be changed
  - Immutable- can not be changed
 
  ********************************************************************************************************************************************************************************

  **Difference between list and tuples?**
  Lists are mutable and typically used for storing collections of items that can be changed, while tuples are immutable and commonly used to store collections of items that shouldn't change.

  ****************************************************************************************************************************************************************************************

  **If two different teams that expect you to have two different versions of same python pakage or module, how to resolve?**

  - use virtualenv
  - Virtualenv creates isolated Python environments, allowing different projects to use different versions of packages without conflicts. 
  - Creating a virtual environment:

**Creating a virtual environment named 'myenv'**

```virtualenv myenv```

#### Activating the virtual environment:

- **On Windows**
```myenv\Scripts\activate```

- **On Unix or MacOS**
```source myenv/bin/activate```

*************************************************************************************************************************************************************************************************

**What are decorators in Python?**

- Decorators modify the behavior of functions. They take a function as an argument, add some functionality, and return another function without modifying the original function's code. 
- Real world example: suppose u want to validate if a user has a logged in session before invoking a API, you can use decorator.

************************************************************************************************************************************************************************************************
**How does exception handling work in Python?**

- Instead for breaking or failing of python program, you want to continue.
- Exception handling in Python uses try, except, else, and finally blocks.
- Example: Handling division by zero exception:

  ```try:
    result = 10 / 0
except ZeroDivisionError:
    print("Division by zero is not allowed.")
else:
    print("Division successful:", result)
finally:
    print("Execution completed.")```

**********************************************************************************************************************************************************************************************

**What's the difference between append() and extend() for lists?**

- append() adds a single element to the end of a list, while extend() adds multiple elements by appending elements from an iterable. Example:

  ```Using append():

my_list = [1, 2, 3]
my_list.append(4)
print(my_list)  # Output: [1, 2, 3, 4]
Using extend():
```

 ```my_list = [1, 2, 3]
my_list.extend([4, 5])
print(my_list)  # Output: [1, 2, 3, 4, 5]
```

*********************************************************************************************************************************************************************************************************
**Explain the use of lambda functions in Python.**
- When u know this function will not be re-used, you can write lambda funtions instead of funtion definitions.
- Lambda functions are anonymous functions used for short tasks.
- Benefits- it will make code more concise, easy to read.
- Example:

Defining and using a lambda function:

  ```square = lambda x: x**2
     print(square(5))  # Output: 25
```

********************************************************************************************************************************************************************************************************

**difference between for and while loop in python**

- for Loop:The for loop is used for iterating over a sequence (such as a list, tuple, string, or range) or any iterable object.
- The while loop is used for iterating until a specified condition evaluates to False.
- for loop is generally preferred when the number of iterations is known or the iteration involves iterating over a sequence, while while loop is preferred when the number of iterations is not known in advance or when the iteration depends on a condition.

******************************************************************************************************************************************************************************************************

**Explain the difference between == and is operators.**

- The == (equivalent) operator compares the values of two objects, 
- while the **is** (equal) operator checks if two variables point to the same object in memory.

Example:

Using ==:

a = [1, 2, 3]
b = [1, 2, 3]
print(a == b)  # Output: True (because values are equal)
Using is:

a = [1, 2, 3]
b = a
print(a is b)  # Output: True (because they reference the same object)

*************************************************************************************************************************************************************************************************************

