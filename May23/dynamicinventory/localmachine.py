import json
inventory = { 'all': { "children": ["local"] }, "local": { "hosts": ["localhost" ]} }
print(json.dumps(inventory))