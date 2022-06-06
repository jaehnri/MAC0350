# MAC0350

## Autores

- 11795418 - Max Cabrajac Goritz
- 11796378 - João Henri Carrenho Rocha

## Como Executar

Para executar esse projeto, é necessário instalar `docker` e `docker-compose`:
- [docker-compose](https://docs.docker.com/compose/install/)
- [docker](https://www.docker.com/)

Após instalar, é possível rodar o `docker-compose` na pasta raíz do projeto para criar e popular o banco de dados:
```sh
docker-compose up -d
``` 

Então, esse banco pode ser acessado executando como abaixo. As flags `i` e `t` servem para passar o seu terminal para o STD_IN do programa que iremos executar dentro do container, isto é, o `psql -U postgres`:
```
docker exec -ti mac0350_db_1 psql -U postgres
```

Para matar o banco, execute:
```sh
docker-compose down
```
