
import json
import pandas as pd

with open('data/schacon.repos.json', 'r') as file:
    data = json.load(file)

repos = []
for repo in data[:5]:  
    repos.append({
        'name': repo['name'],
        'html_url': repo['html_url'],
        'updated_at': repo['updated_at'],
        'visibility': repo['visibility']
    })

df = pd.DataFrame(repos)

df.to_csv('chacon.csv', index=False, header=False)

print(df.head())
