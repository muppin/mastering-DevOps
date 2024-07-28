def fibonacci(i):
    if i==0:
        return 0
    elif i==1:
        return 1
    else :
        return fibonacci(i-2) + fibonacci(i-1)
    
a = []
index = int(input("enter the index : "))
if index <= 0:
    print("please enter the positive number")
else:
    for i in range(0,index):
        num=(fibonacci(i))
        a.append(num)

print(a)