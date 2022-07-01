# MAC0350

## Autores

- 11795418 - [Max Cabrajac Goritz](maxcg@usp.br)
- 11796378 - [João Henri Carrenho Rocha](joao.henri@usp.br)

## Dependências

Para executar esse projeto, é necessário instalar `docker`, `docker-compose` e `make`. Para fazer os scripts de população do banco, é necessário usar o `python`:
- [docker-compose](https://docs.docker.com/compose/install/)
- [docker](https://www.docker.com/)
- [python](https://www.python.org/downloads/)
- [make](https://www.gnu.org/software/make/)

Após instalar, é possível rodar os targets do Make, que usam o `docker-compose`, na pasta raíz do projeto para criar, popular e consultar os bancos de dados.

## Regerando os dados

Os nomes em `nomes` foram gerados a partir do site https://pseudorandom.name/.

Para gerar os dados, foi feito o script `gerador.py`. Ele usa o arquivo `nomes` para criar os DMLs `postgres/popula.sql` e `neo4j/popula.cql`. Para refazer esses scripts:

```bash
make clean
make postgres/popula.sql neo4j/popula.cql
```

## Criando os bancos

Esse passo requer os scripts criados no passo anterior.

Para criar e popular o Postgres:
```bash
make postgres
``` 

Para criar e popular o Neo4J:
```bash
make neo4j
``` 

Para derrubar ambos:
```bash
make kill
```

## Execução das consultas

Esse passo requer a criação dos bancos mencionada acima.

As buscas do exercício 2, isto é, do Postgres, estão no arquivo `postgres/buscas.sql`. 

 Para executar todas as buscas do Postgres, faça:
```bash
make ex2
```


A busca do exercício 4, isto é, do Neo4J, está no arquivo `neo4j/buscas.cql`. Para executá-la, faça:
```bash
make ex4
```


Boa correção!