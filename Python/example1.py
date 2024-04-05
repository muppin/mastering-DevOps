###To list all the files from the folders provided by the user

import os

folders = input ("Please enter the folder name using commas:").split(",")
print(folders)


def ListFilesInFolders(): 
     for folder in folders:
        try:
             files = os.listdir(folder)
        except FileNotFoundError:
             print("Please enter a valid folder name.", folder)
             continue
        except PermissionError:
              print("No access to the specified folder")
              continue
        print("files inside folder : ", folder)

        for file in files:
            print(file)

  
ListFilesInFolders()         
