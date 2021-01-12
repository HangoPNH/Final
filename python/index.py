import os
from flask import Flask
app = Flask(__name__)
@app.route("/")
def hello(x = os.environ['APP_HOST'], y = os.environ['APP_VERSION']):
    return "Hello World! " + y + " " + x;
if __name__ == "__main__":
    app.run(host="0.0.0.0", port=int("5000"), debug=True)
