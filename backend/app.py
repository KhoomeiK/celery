from flask import Flask, jsonify, request
import psycopg2

app = Flask(__name__)
conn_str = "host='localhost' user='postgres' password='password'"

@app.route('/biz/menu/<id>')
def menu(id):
	conn = psycopg2.connect(conn_str, dbname='users')
	cursor = conn.cursor()
	
	cursor.execute("SELECT name, profit, sust, link FROM %s WHERE type = 'item'" % id)
	data = cursor.fetchall()
	
	items = {}
	for i in data:
		items[i[0]] = {'profit': i[1][-1] - i[1][-2], 'sust': i[2][-1] - i[2][-2], 'link': i[3]}
	
	conn.close()
	return jsonify(items)

'''
{
	items: [
		Linguini: {
				profit: 0.5,
				sust: 0.5
			},
		Tiramisu: {
				profit: 0.5,
				sust: 0.5
			},
		Minestrone: {
				profit: 0.5,
				sust: 0.5
			}
		]
}
'''

@app.route('/biz/item/<item>/<id>')
def item(item, id):
	conn = psycopg2.connect(conn_str, dbname='users')
	cursor = conn.cursor()
	
	cursor.execute("SELECT profit, sust, buys FROM %s WHERE type = 'item' AND name = '%s'" % (id, item))
	data = cursor.fetchall()
	
	return jsonify({
		item: {
			'profit': data[0][0],
			'sust': data[0][1],
			'buys': data[0][2]
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
	conn = psycopg2.connect(conn_str, dbname='users')
	cursor = conn.cursor()

	cursor.execute("SELECT ingredients FROM %s WHERE name = '%s'" % (id, item))
	results = cursor.fetchall()[0][0]

	ingredients = []
	for i in results:
		ingredients.append(i[0])

	conn.close()

	conn = psycopg2.connect(conn_str, dbname='foods')
	cursor = conn.cursor()
	out = {}

	for i in ingredients:
		out[i] = []
		cursor.execute('SELECT %s FROM %s' % (data, i))
		x = cursor.fetchall()[-12:]
		for j in range(0, len(x)):
			out[i].append(x[j][0])

	return jsonify(out)

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

'''
POST endpoint to accept new menu items
{
	name: 'Salad',
	ingredients: ['tomato', 'lettuce', 'celery']
}
'''

# THIS NEEDS TO BE TESTED
@app.route('/biz/new/<id>', methods = ['POST']) # post req new menu item
def new(id):
	req = request.get_json()
	ingredients = req['ingredients']
	profit, sust, buys = [0,0,0,0,0,0,0,0,0,0,0,0], [0,0,0,0,0,0,0,0,0,0,0,0], [0,0,0,0,0,0,0,0,0,0,0,0]
	conn = psycopg2.connect(conn_str, dbname='foods')
	cursor = conn.cursor()

	for i in ingredients:
		cursor.execute('SELECT profit, sust FROM %s' % i)
		x = cursor.fetchall()[-12:]
		print(x)
		for j in range(0, len(x)):
			profit[j] = profit[j] + x[j][0]
			sust[j] = sust[j] + x[j][1]

	conn.close()
	conn = psycopg2.connect(conn_str, dbname='users')
	cursor = conn.cursor()
	cursor.execute('INSERT INTO test (type, name, ingredients, profit, sust, buys) VALUES (\'item\', %s, %s, %s, %s, %s)', (req['name'], ingredients, profit, sust, buys))

	# arr = str(ingredients).replace("'", '\\"').replace("[", "{").replace("]", "}")
	# profit = str(profit).replace("[", "{").replace("]", "}")
	# sust = str(sust).replace("[", "{").replace("]", "}")
	# buys = str(buys).replace("[", "{").replace("]", "}")
	# cursor.execute("INSERT INTO %s (type, name, ingredients, profit, sust, buys) VALUES('item', '%s', \'%s\', '%s', '%s', '%s')" 
		# % (id, req['name'], arr, profit, sust, buys))
	conn.commit()
	conn.close()
	return 'Item succesfully created'
