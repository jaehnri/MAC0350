-- 4.1 Liste os serviços que podem ser utilizados por grupo de usuários.
SELECT *
FROM servico
WHERE id IN
    (SELECT DISTINCT ps.id_servico AS id
     FROM usuario AS u,
          rel_usuario_perfil AS up,
          rel_perfil_servico AS ps
     WHERE u.id = up.id_usuario
       AND up.id_perfil = ps.id_perfil
       AND u.nome in ('Pedro', 'João', 'Max')

-- 4.2) Liste em ordem crescente o total de serviços utilizados agrupados pelos tipos de
--      serviços disponíveis e pelo perfil dos usuários.

-- Uma execucao de um servico feita por um usuario com mais de umu perfil sera contada mais de uma vez, nao e possivel decidir para qual perfil uma execucao contara uma vez que esta informacao nao é mantida

SELECT us.servico,
       up.perfil,
       COUNT(*)
FROM rel_usuario_servico AS us,
     rel_usuario_perfil AS up
WHERE us.id_usuario = up.id_usuario
GROUP BY us.servico,
         up.perfil

-- 4.3) Liste todos os exames realizados, com seus respectivos tipos, bem como os seus
--     usuários com suas respectivas datas de coleta de amostras.

-- Por essa pergunta eu acho q o lugar de data da amostra é msm em amostra, dai amostra deixa de ser um descritor de amostra. Se n fica muito idiota essa pergunta

SELECT p.nome, pea.data_coleta, e.nome
FROM rel_paciente_amostra_exame AS pae, exame AS e, paciente AS p
WHERE pae.id_exame = e.id AND pae.id_paciente = p.id

-- 4.4) Liste os 2 exames realizados com maior frequência.

SELECT nome
FROM exame
WHERE id IN (
	SELECT TOP 2 id_exame AS id
	FROM rel_paciente_amostra_exame
	GROUP BY id_exame
	ORDER BY COUNT(*) DESC
)

-- ou, mas acho q n vai funcionar

SELECT TOP 2 nome
FROM rel_paciente_amostra_exame, exame
WHERE id = id_exame
GROUP BY id_exame
ORDER BY COUNT(*) DESC
