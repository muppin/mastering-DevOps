import json
from urllib.request import urlopen

with urlopen("https://api.github.com/repos/kubernetes/kubernetes/pulls") as response:
    source = response.read()

data = json.loads(source)

with open('new_file1.json', 'w') as f:
    json.dump(data, f, indent=2)

# print(json.dumps(data, indent=2))
