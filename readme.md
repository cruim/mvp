### Описание:
Реализация для n моделей. Актуально когда для нескольких моделей
используется похожий входящий dataset. Разбито на три слоя: валидация входного 
объекта(используется `marshmallow`), подготовка данных(`preparation`)
и получение расчета модели/моделей. Для добавления очередной модели
достаточно добавить в директорию `models` папку `model_<model_name>` и реализовать
такую же структуру внутри. Также можно будет добавить: покрытие юнит тестами с формированием
`coverage-report`, который может быть использован при сборки дистрибутива и проверку качества
кода перед сборкой дистрибутива(`sonar`).

### Активация venv и установка библиотек:
```bazaar
python3 -m venv venv
source venc/bin/activate
pip install -r requirements.txt
```

### Запуск: `bash app.sh`

### Пример объекта для теста
```
data = {
    "models": ["10001", "10002", "10003"],
    "data":
        {
            "pclass": "1",
            "name": "Futrelle, Mrs. Jacques Heath (Lily May Peel)",
            "sex": "male",
            "sibsp": "0",
            "parch": "0",
            "embarked": "S",
            "fare": "53",
            "age": "34"
        }
}
```
```
import requests
req = requests.post(url='http://127.0.0.1:8000/predict', json=data, verify=False)
print(req.status_code)
print(req.text)
```

### Ответ сервиса при успешном скоринге

```
{"models":[{"model_id":"catboost_sample","result_code":0,"value":0},{"model_id":"10002","result_code":0,"value":1},{"10003":"Invalid model"}],"status":200}
```

### Ответ сервиса при ошибки валидации
```
{"message":"{'data': {'pclass': ['Not a valid integer.']}}"}

```