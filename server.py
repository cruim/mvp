import os
from importlib import import_module

import pandas as pd
from flask import Flask, jsonify, request

from preparation import prepare_data
from validate import validate_json
from models.model_10001.model import Model

app = Flask(__name__)


@app.route(rule='/health', methods=['GET'])
def health():
    return '200'


@app.route(rule='/predict', methods=['POST'])
# @validate_json
def predict():
    data = request.get_json()
    scores = list()
    model = Model(data)
    scores.append(model.predict())
    return jsonify(models=scores, status="200")


@app.errorhandler(400)
def handle_custom_exception(error):
    return jsonify(message=str(error.description)), error.code


@app.errorhandler(500)
def handle_custom_exception(error):
    return jsonify(message=str(error.description)), error.code


if __name__ == "__main__":
    app.run()
