from flask import Flask
import psycopg2

app = Flask(__name__)

@app.route("/data")
def data():
    return {"service": "B", "db": "connected"}

app.run(host="0.0.0.0", port=5001)