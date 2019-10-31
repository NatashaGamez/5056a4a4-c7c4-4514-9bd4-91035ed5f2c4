from flask import Flask, jsonify
from flask_sqlalchemy import SQLAlchemy

from settings import SQLALCHEMY_DATABASE_URI

# Configure flask application
app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = SQLALCHEMY_DATABASE_URI

# Enable SQL Alchemy
db = SQLAlchemy(app)


@app.route('/user/<user_handle>', methods=['GET', 'POST'])
def get_instagram_user(user_handle):
    pass


if __name__ == '__main__':
    app.run()
