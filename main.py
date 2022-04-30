from flask import Flask
from main_page.view import main_page_blueprint

app = Flask(__name__)


app.register_blueprint(main_page_blueprint, url_prefix='/')

if __name__ == '__main__':
    app.run()

