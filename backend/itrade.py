obj = {}

with open('./data.csv', 'r') as file:
	file.readline()
	for i in file:
		line = i.split(',')
		print(line[1], line[6], line[7])
		obj[line[1]] = [line[7], line[6]]
print(obj)

for i in obj:
	obj[i] = int(obj[i][0])/int(obj[i][1])

with open('./output.json', 'w') as file:
	file.write(str(obj))
