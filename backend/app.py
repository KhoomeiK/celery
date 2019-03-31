from flask import Flask
import psycopg2

app = Flask(__name__)
conn_str = "host='localhost' user='postgres' password='password'"

@app.route('/biz/menu/<id>')
def menu(id):
	conn = psycopg2.connect(conn_str, dbname='users')
	cursor = conn.cursor()
	
	cursor.execute("SELECT name, profit, sust FROM %s WHERE type = 'item'" % id)
	data = cursor.fetchall()
	
	items = {}
	for i in data:
		items[i[0]] = {'profit': float(i[1][-1]) - float(i[1][-2]), 'sust': float(i[2][-1]) - float(i[2][-2])}
	
	conn.close()
	return str(items)

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
	conn = psycopg2.connect(conn_str, dbname='users')
	cursor = conn.cursor()
	
	cursor.execute("SELECT profit, sust, buys FROM %s WHERE type = 'item' AND name = %s" % (id, item))
	data = cursor.fetchall()
	
	return str({
		item: {
			profit: data[0][0],
			sust: data[0][1],
			buys: data[0][2]
		}
	})

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
