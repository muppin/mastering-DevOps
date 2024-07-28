import os

def list_files_in_folder(folder):
    try:
        files = os.listdir(folder)
        return files
    except FileNotFoundError:
        return None, "please enter the correct path"


def main():

    folders = input("enter the folders to search for files seperated by space:").split()
    print(folders)
    print(f"example.py's __name__ is equal to {__name__}")

    for folder in folders:
        files = list_files_in_folder(folder)
        for file in files:
            print(file)


if __name__ == "__main__":
    print(f"example.py's __name__ is equal to {__name__}")
    main()
    



