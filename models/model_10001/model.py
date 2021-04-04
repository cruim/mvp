from catboost import CatBoostClassifier
from pathlib import Path
import os


class Model:
    def __init__(self, data):
        self.__name__ = 'catboost_sample'
        self.model = CatBoostClassifier().load_model(fname=os.path.join(Path(__file__).parent.absolute(), 'catboost_model'))
        self.test = '42'
        self.data = data

    def preprocessing(self):
        # Custom data preparation
        pass

    def predict(self):
        return {"model_id": self.__name__, "value": self.model.predict(self.data).item(0), "result_code": 0}
