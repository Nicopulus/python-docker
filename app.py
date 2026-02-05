# https://flask.palletsprojects.com/en/3.0.x/quickstart/
# https://echarts.apache.org/en/option.html#yAxis

import random
from flask import Flask, render_template, jsonify
app = Flask(__name__)
# app.config['DEBUG'] = True

@app.route('/')
def hello_world():
    return render_template("index.html", zip=zip)

@app.route('/data')
def data():
    random_data = {
        'x': list(range(10)),  # x-axis values [0, 1, 2, ..., 9]
        'y': [random.randint(0, 100) for _ in range(10)]  # y-axis random values between 0 and 100
    }
    return jsonify(random_data)

if __name__ == "__main__":
    # app.run()
    app.run(debug=True)
    
    #In WINDOWS, use the following to start the app#
    #waitress-serve --listen=0.0.0.0:5000 app:app