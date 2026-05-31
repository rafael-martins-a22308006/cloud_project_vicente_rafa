from flask import Flask
import requests

app = Flask(__name__)

@app.route("/")
def home():
    r = requests.get("http://service-b:5001/data")
    return {"service": "A", "response_from_b": r.json()}

app.run(host="0.0.0.0", port=5000)