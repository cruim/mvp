from catboost import CatBoostClassifier
import os





class Model:
    def __init__(self, data):
        self.__name__ = 'catboost_sample'
        path = os.path.join(os.path.dirname(__file__), '../../additional_params/model')
        self.model = CatBoostClassifier().load_model(fname=path)
        self.data = data

    def preprocessing(self):
        # Custom data preparation
        pass

    def predict(self):
        return {"model_id": self.__name__, "value": self.model.predict(self.data).item(0), "result_code": 0}
