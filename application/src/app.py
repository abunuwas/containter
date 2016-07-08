from flask import Flask
from redis import Redis
from os.path import expanduser 

app = Flask(__name__)
redis = Redis(host="redis")

@app.route("/")
def hello():
    home = expanduser('~')
    visits = redis.incr('counter')
    html = "Hellow world! This is a new version :D :D :D :D <h1>This is definitely working!!!!!</h1><h2>Visits:</h2> <h2>{visits}</h2>"+home
    return html.format(visits=visits)

@app.route("/new")
def new():
    import os
    z = expanduser('~')
    files = [file for path, directory, files in os.walk(z) for file in files]
    html_files = ''
    for file in files:
        html_files = html_files+'<p>'+file+'</p>'
    return "This page is brand new!!!!!!!!!!!!!!!!"+html_files

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
    app.run(host="0.0.0.0", port=8080)
