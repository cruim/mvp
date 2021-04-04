import os
import pickle
from pathlib import Path


class Model:
    def __init__(self, data):
        self.__name__ = '10002'
        path = os.path.join(Path(__file__).parent.absolute(), "gradient_boosting_classifier_model.dat")
        self.model = pickle.load(open(path, "rb"))
        self.data = data

    def preprocessing(self):
        # Custom data preparation
        pass

    def predict(self):
        return {"model_id": self.__name__, "value": self.model.predict(self.data).item(0), "result_code": 0}
