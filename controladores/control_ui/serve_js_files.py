# -*- coding: utf-8 -*-
#!/usr/bin/python3

"""
Servicio web para proveer archivos .js vía http a la app Control (http://charlie-roberts.com/Control/)
de forma local

Dependencias:
 $ pip install flask
"""

from flask import Flask, request, send_from_directory

# set the project root directory as the static folder, you can set others.
app = Flask(__name__, static_url_path='')

""" Ejemplo http://127.0.0.1:5000/js/slider.js """
@app.route('/js/<path:path>')
def send_js(path):
    return send_from_directory('js', path)

if __name__ == "__main__":
    app.run()
