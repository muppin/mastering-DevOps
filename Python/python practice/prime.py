def primeornot(num):
    for i in range(2,num):
        if(num%i==0):
            print(f"{num} is not prime")
            break
    else:
        print(f"{num} is prime")



num = int(input("Enter the prime number to check: "))

if num<=0:
    print("enter the valid number")
else:
    primeornot(num)