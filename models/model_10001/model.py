# from catboost import CatBoostClassifier
import os
import json

PATH = os.path.join(os.path.dirname(__file__), '../../additional_params/')
methods = os.path.join(PATH, 'model_settings.json')
with open(methods) as f:
    load_method = json.load(f)
list(map(exec, load_method.get('import', False)))



class Model:
    def __init__(self, data):
        self.__name__ = 'catboost_sample'
        model = os.path.join(PATH, 'model')
        self.model = eval(load_method.get('load', False))
        self.data = data

    def preprocessing(self):
        # Custom data preparation
        pass

    def predict(self):
        return {"model_id": self.__name__, "value": self.model.predict(self.data).item(0), "result_code": 0}
