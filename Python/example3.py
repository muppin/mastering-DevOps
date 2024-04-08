## Update the server.conf file when max_connection reaches certain threshold

def update_server_config(file_path, key, value):

    with open(file_path, "r") as file:
        lines = file.readlines()
        # print(lines)
        # print (type(lines))
        file.close()

    with open(file_path, "w") as file:
        for line in lines:
            if key in line:
                file.write(key + "=" + value + "\n")

            else:
                file.write(line)
        file.close()

update_server_config("server.conf", "MAX_CONNECTIONS", "800" )

    
