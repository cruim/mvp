

### Пример объекта для теста
```
import requests
test = [{'PassengerId': '892', 'Pclass': '3', 'Name': 'Kelly, Mr. James', 'Sex': 'female', 'Age': '34.5', 'SibSp': '0',
        'Parch': '0', 'Ticket': '330911', 'Fare': '7.8292', 'Cabin': '', 'Embarked': 'Q'}]

headers = {'Content-type': 'application/json', 'Accept': 'text/plain'}

req = requests.post(url='http://127.0.0.1:8000/predict', json=test, verify=False, headers=headers)
print(req.text)
print(req.status_code)
```