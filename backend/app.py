from flask import Flask

app = Flask(__name__)

@app.route('/biz/menu/<id>')
def menu(id):
	# find all type: item in db id
	# compare last 2 data points in parsed profit & sust
    return {[id]}
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

@app.route('/biz/item/<item>/<id>')
def item(item, id):
	# find item in db id
	# get composite prof, sust, and buys of item
	# parse arrays
    return {[item, id]}

'''
{
	Linguini: {
		profit: {
			color: True,
			data: [2.4, 4.1, 3.5, 3.7, 2.8]
		},
		sust: {
			color: False,
			data: [1, 1, 4, 3, 2]
		},
		buys: {
			color: True,
			data: [12, 19, 20, 14, 18]
		}
	}
}
'''

@app.route('/biz/ingredients/<item>/<data>/<id>')
def ingredient(item, data, id):
	# find item in table of id
	# parse item data into ingredient list
	# find temporal data of each ingredient (last is prediction)
	# compare last 2 data points to determine color
    return {[item, data, id]}

'''
{
	profit: {
		Tomato: {
			color: True,
			data: [2.4, 4.1, 3.5, 3.7, 2.8]
		},
		Wheat: {
			color: False,
			data: [3.5, 3.7, 2.8, 2.4, 4.1]
		},
		Bellpepper: {
			color: False,
			data: [5.5, 3.1, 2.2, 6.4, 3.3]
		}
	}
}
'''

app.run()