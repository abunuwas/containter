from flask import Flask
app = Flask(__name__)

@app.route("/")
def hello():
    return "Hellow world! This is a new version :D :D :D :D"

@app.route("/new")
def new():
    return "This page is brand new!!!!!"

if __name__ == "__main__":
    app.run()
