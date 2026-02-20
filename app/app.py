from flask import Flask, render_template, request

app = Flask(__name__)

@app.route('/')
def home():
    return render_template('index.html')

@app.route('/donate', methods=['POST'])
def donate():
    name = request.form['name']
    email = request.form['email']
    amount = request.form['amount']

    return render_template('success.html', name=name, amount=amount)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)