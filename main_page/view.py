from flask import Blueprint, render_template
import utils

main_page_blueprint = Blueprint('main_page_blueprint', __name__, template_folder='templates')


@main_page_blueprint.route('/<int:itemid>/')
def index(itemid):
    animal = utils.one_animal(itemid)
    return render_template('index.html', animal=animal)
