import sys
import random

def sql(nomes, amizades, file):
	string = "INSERT INTO pessoa (id, nome) VALUES "
	for i in range(len(nomes)):
		string = string + f"({i+1}, '{nomes[i][:-1]}'), "

	string = string[:-2] + ';\n'


	string += "INSERT INTO amigo (pessoa_id, amigo_id) VALUES "
	for amg in amizades:
		string = string + f"({amg[0]+1}, {amg[1]+1}), "

	string = string[:-2] + ';'

	with open(file, 'w') as f:
		f.write(string)

def neo4j(nomes, amizades, file):
	string = "CREATE "
	for i in range(len(nomes)):
		string = string + f"(p{i + 1}:Person {{ name: '{nomes[i][:-1]}', id: {i} }}), "

	for amg in amizades:
		string = string + f"(p{amg[0] + 1})-[:Amigo]->(p{amg[1] + 1}), "

	string = string[:-2] + ';'

	with open(file, 'w') as f:
		f.write(string)

def main():
	if len(sys.argv) < 4:
		print("python gerador.py <quantidade de amizades> <arquivo sql> <arquivo cql>")
		exit()

	nomes = sys.stdin.readlines()
	nomes.extend([ 'Bob\n', 'Alice\n' ])

	amizadesEsperadas = int(sys.argv[1])
	if len(nomes)*(len(nomes)-1) < amizadesEsperadas:
		print(f"Não é possivel fazer {amizadesEsperadas} amizades com {len(nomes)} pessoas")
		exit()

	numPessoas = len(nomes)
	grauMedio = amizadesEsperadas / numPessoas

	amizades = []
	for i in range(numPessoas):
		for j in range(numPessoas):
			if i != j and random.random() <= grauMedio/numPessoas:
				amizades.append([i, j])

	print(len(amizades))

	sql(nomes, amizades, sys.argv[2])
	neo4j(nomes, amizades, sys.argv[3])

if __name__ == "__main__":
	main()
	pass
