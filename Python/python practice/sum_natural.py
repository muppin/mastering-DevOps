def sum_of_Natural_nums(num):
    sum = (num*(num+1))//2
    return sum

num = int(input("Enter the number : "))

if (num >0):
    print(f"sum of first {num} natural numbers = ", sum_of_Natural_nums(num))
else:
    print("enter the correct number")