from flask import Flask, request, render_template
from redis import Redis

app = Flask(__name__)
r = Redis()

@app.route('/', methods=['GET', 'POST'])
def hello():
    if request.method == 'POST':
        s = request.form['word']
        if s is not None:
            print "Adding %s to HyperLogLog" % s
            r.pfadd("hll", s)
    count = r.pfcount("hll")
    error = None
    return render_template('hll.html', count=count, error=error)

if __name__ == "__main__":
    app.run(port=5000, host="0.0.0.0", debug=True)
