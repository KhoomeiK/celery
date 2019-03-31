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
CREATE TABLE garden (
 type TEXT not null,
 name TEXT,
 ingredients TEXT[],
 profit FLOAT[],
 sust FLOAT[],
 buys INT[]
);

INSERT INTO garden (type, name, ingredients, profit, sust, buys) 
VALUES ('item', 'Linguini', 
	'{{"tomato", 2}, {"egg", 1}, {"wheat", 5}}',
	'{2.4, 3.5, 3.0, 4.1, 2.9}',
	'{1, 4, 2, 3, 3}', 
	'{14, 19, 12, 9, 21}');

CREATE TABLE tomato (month TEXT, profit FLOAT, sust FLOAT);

INSERT INTO tomato (month, profit, sust) 
VALUES ('2019-1', 3.5, 1.2)
'''