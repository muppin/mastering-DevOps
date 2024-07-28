# fibonacci
# 0, 1, 1, 2, 3, 5, 8
index = int(input("Enter the index you want till the series : "))

a=[]

first_number= 0
second_number= 1
temp=0


for i in range(0,index-2):
    temp=first_number+second_number #1 #2 #3
    first_number=second_number #1 #1 
    second_number=temp #1 #2 #3
    a.append(temp) #[1, 2, 3]

b = [0,1] + a
print(b)
c = b[0:4]
print(c)

