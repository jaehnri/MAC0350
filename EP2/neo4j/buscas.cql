// --------------------------------------------------------------
// -- 4) Implemente a consulta “Quem são os amigo(a)s dos amigo(a)s de Alice”
// -- utilizando o Sistema de Bancos de Dados orientado a Grafos do item 3.
// --------------------------------------------------------------

MATCH (p1:Person) -[:Amigo*2]->(p2:Person) WHERE p1.name = 'Alice' RETURN p2;