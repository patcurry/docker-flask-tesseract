from flask import Flask, Response

app = Flask(__name__)

@app.route("/")
def hello():
    return Response("Hello")

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80, debug=True)
