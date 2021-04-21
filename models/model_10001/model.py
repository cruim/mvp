import os
import json
import mlflow

PATH = os.path.join(os.path.dirname(__file__), '../../additional_params/')
methods = os.path.join(PATH, 'model_settings.json')
with open(methods) as f:
    load_method = json.load(f)


class Model:
    def __init__(self, data):
        self.__name__ = load_method.get('name', 'default')
        model = os.path.join(PATH, self.__name__)
        self.model = mlflow.pyfunc.load_model(model)
        self.data = data

    def preprocessing(self):
        # Custom data preparation
        pass

    def predict(self):
        return {"model_id": self.__name__, "value": self.model.predict(self.data).item(0), "result_code": 0}
