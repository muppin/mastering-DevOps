from string_length import length , pi

def reversestr(mystring):
    reverse_string=''
    for i in mystring:
        reverse_string= i.lower() + reverse_string 
    return reverse_string

mystring = input("enter the string : ")
lenstring= length(mystring)
revstring= reversestr(mystring)
print(revstring)
print(lenstring)
print(pi)