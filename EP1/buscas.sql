\echo ------------------------------------------------------------------------------------------
\echo -- 4.1 Liste os serviços que podem ser utilizados por grupo de usuários.
\echo ------------------------------------------------------------------------------------------
\echo -- No caso, estamos considerando que (17, 18) corresponde ao grupo de usuários. 
\echo -- Também estamos considerando que queremos a união dos serviços e não a interseção.
\echo

SELECT DISTINCT s.*
FROM servico AS s, usuario AS u
WHERE u.id IN (17, 18) AND (u.id, s.id) IN
    ((SELECT u.id AS idu, ps.id_servico AS ids
     FROM usuario AS u,
          rel_usuario_perfil AS up,
          rel_perfil_servico AS ps
     WHERE u.id = up.id_usuario
       AND up.id_perfil = ps.id_perfil)
   UNION
    (SELECT t.id AS idu, ts.id_servico AS ids
     FROM tutelado AS t,
          rel_tutela_servico AS ts
     WHERE t.id = ts.id_tutelado));

\echo 
\echo
\echo ------------------------------------------------------------------------------------------
\echo -- 4.2) Liste em ordem crescente o total de serviços utilizados agrupados pelos tipos de
\echo --      serviços disponíveis e pelo perfil dos usuários.
\echo ------------------------------------------------------------------------------------------
\echo

WITH perfil_servico_usado AS
  (SELECT rup.id_perfil,
          rus.id_servico
   FROM rel_usuario_servico rus
   INNER JOIN rel_usuario_perfil rup ON rus.id_usuario = rup.id_usuario
   UNION ALL SELECT t.id_perfil,
                    rus.id_servico
   FROM rel_usuario_servico rus
   INNER JOIN tutelado t ON t.id = rus.id_usuario)
SELECT *,
       count(*) AS frequencia
FROM perfil_servico_usado
GROUP BY (id_perfil,
          id_servico)
ORDER BY frequencia ASC,
         id_perfil ASC,
         id_servico ASC;

\echo 
\echo
\echo ------------------------------------------------------------------------------------------
\echo -- 4.3) Liste todos os exames realizados, com seus respectivos tipos, bem como os seus
\echo --      usuários com suas respectivas datas de coleta de amostras.
\echo ------------------------------------------------------------------------------------------
\echo

SELECT e.tipo,
       p.nome,
       aplicacao.data_coleta,
       aplicacao.data_exame
FROM rel_paciente_amostra_exame aplicacao
INNER JOIN exame e ON e.id = aplicacao.id_exame
INNER JOIN paciente p ON p.id = aplicacao.id_paciente;

\echo 
\echo
\echo ------------------------------------------------------------------------------------------
\echo -- 4.4) Liste os 2 exames realizados com maior frequência.
\echo ------------------------------------------------------------------------------------------
\echo 

SELECT e.tipo, count(*) as frequencia
FROM rel_paciente_amostra_exame aplicacao
INNER JOIN exame e on e.id = aplicacao.id_exame
GROUP BY e.id
ORDER BY frequencia DESC 
LIMIT 2;