from flask import Flask
app = Flask(__name__)

@app.route("/")
def hello():
    return "Hellow world! This is a new version :D :D :D :D <h1>This is definitely working!!!!!</h1>"

@app.route("/new")
def new():
    return "This page is brand new!!!!!"

@app.route("/good")
def good():
    return "This is fucking good"

@app.route("/see")
def see():
    return "Let's see if this works..."

@app.route("/check")
def check():
    return "It works! It works!!"

if __name__ == "__main__":
    app.run()
