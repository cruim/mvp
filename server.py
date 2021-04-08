import os
from importlib import import_module

import pandas as pd
from flask import Flask, jsonify, request

from preparation import prepare_data
from validate import validate_json

app = Flask(__name__)


@app.route(rule='/health', methods=['GET'])
def health():
        return '200'


@app.route(rule='/predict', methods=['POST'])
@validate_json
def predict():
    data = request.get_json()
    call_models = data.get('models')
    dataset = pd.DataFrame.from_dict([prepare_data(data['data'])], orient='columns')
    available_models = {model[6:] for model in os.listdir('models')}
    scores = list()
    for value in call_models:
        if value in available_models:
            model = getattr(import_module(f'models.model_{value}.model'), 'Model')
            model = model(data=dataset)
            scores.append(model.predict())
        else:
            scores.append({value: 'Invalid model'})
    # print(type(dict(os.environ)))
    return jsonify(models=scores, status=200, environ=dict(os.environ))


@app.errorhandler(400)
def handle_custom_exception(error):
    return jsonify(message=str(error.description)), error.code


@app.errorhandler(500)
def handle_custom_exception(error):
    return jsonify(message=str(error.description)), error.code


if __name__ == "__main__":
    app.run()
