# to get the pull requests of a github repository

import requests

response = requests.get("https://api.github.com/repos/kubernetes/kubernetes/pulls")

print(response)

complete_details=response.json()

for i in range(len(complete_details)):
    print(complete_details[i]["user"]["login"])
