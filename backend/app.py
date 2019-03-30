from flask import Flask

app = Flask(__name__)

@app.route('/biz/menu/<id>')
def menu(id):
    return 'Hello %s' % id
'''
{
	items: [
		Linguini: {
				profit: True,
				sust: False
			},
		Tiramisu: {
				profit: False,
				sust: False
			},
		Minestrone: {
				profit: True,
				sust: True
			}
		]
}
'''
