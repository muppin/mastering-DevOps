import json

with open('states.json','r') as f:
    data = json.load(f)

for state in data['states']:
    print(state['cities']['city'])

    

# with open('new_file.json', 'w') as f:
#     json.dump(data, f, indent=2)
