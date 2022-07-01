.PHONY: postgres neo4j kill all 

all: postgres neo4j

clean:
	rm postgres/popula.sql neo4j/popula.cql

postgres/popula.sql neo4j/popula.cql: gerador.py nomes
	cat nomes | python gerador.py 3000 postgres/popula.sql neo4j/popula.cql

postgres: postgres/popula.sql
	docker-compose up -d postgres
	@echo Postgres criado e populado!

neo4j: neo4j/popula.cql
	docker-compose up -d neo4j
	cat neo4j/popula.cql | docker exec -i ep2_neo4j_1 sh -c 'while ! cypher-shell --non-interactive; do echo Tentando popular o Neo4J.; done; cypher-shell'
	@echo Neo4J criado e populado!

ex2:
	@cat postgres/buscas.sql | docker exec -i ep2_postgres_1 psql -U postgres

ex4:
	@echo -e '--------------------------------------------------------------\n-- 4) Implemente a consulta “Quem são os amigo(a)s dos amigo(a)s de Alice”\n-- utilizando o Sistema de Bancos de Dados orientado a Grafos do item 3.\n--------------------------------------------------------------'
	@cat neo4j/buscas.cql | docker exec -i ep2_neo4j_1 cypher-shell

kill:
	docker-compose down -v
