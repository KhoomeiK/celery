import psycopg2
import sys

def main():
	#Define our connection string
	conn_string = "host='localhost' dbname='users' user='postgres' password='password'"
 
	# print the connection string we will use to connect
	print("Connecting to database\n	->%s" % (conn_string))
 
	# get a connection, if a connect cannot be made an exception will be raised here
	conn = psycopg2.connect(conn_string)
 
	# conn.cursor will return a cursor object, you can use this cursor to perform queries
	cursor = conn.cursor()
	print("Connected!\n")
 
if __name__ == "__main__":
	main()

'''
CREATE TABLE multi (
 type TEXT not null,
 name TEXT,
 link TEXT,
 ingredients TEXT[],
 profit FLOAT[],
 sust FLOAT[],
 buys INT[]
);

INSERT INTO multi (type, name, link, ingredients, profit, sust, buys) 
VALUES ('item', 'Kungpao', 'https://img.taste.com.au/-7KlOnpq/taste/2018/02/kung-pao-chicken-taste-135078-1.jpg?fbclid=IwAR2J2aHwMJkDhsVhr0dB9ZZ61OmQCJqrq4Dv2RF9jGDxIicerK54E-YLjZg',
	'{{"chicken", 3}, {"celery", 1}}',
	'{2.4, 3.5, 3.0, 4.1, 2.9}',
	'{1, 4, 2, 3, 3}', 
	'{14, 19, 12, 9, 21}');

pho: onion, celery, beef
pizza: milk, egg, tomato
steak: beef
kungpao: chicken, celery

CREATE TABLE tomato (month TEXT, profit FLOAT, sust FLOAT);

INSERT INTO tomato (month, profit, sust) 
VALUES ('2019-1', 3.5, 1.2)


COPY beef FROM '/home/rohan/celery/backend/data/finalCow.csv' WITH (FORMAT csv);
'''

# limit csv to 12 entries, 1 prediction