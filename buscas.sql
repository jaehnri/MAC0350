-- 4.1
SELECT * FROM servico WHERE id IN (
	SELECT DISTINCT ps.id_servico AS id
	FROM usuario AS u, rel_usuario_perfil AS up, rel_perfil_servico AS ps
	WHERE u.id = up.id_usuario AND up.id_perfil = ps.id_perfil AND u.nome = "Pedro"
)

-- 4.2
-- Uma execucao de um servico feita por um usuario com mais de umu perfil sera contada mais de uma vez, nao e possivel decidir para qual perfil uma execucao contara uma vez que esta informacao nao é mantida

SELECT us.servico, up.perfil, COUNT(*)
FROM rel_usuario_servico AS us, rel_usuario_perfil AS up
WHERE us.id_usuario = up.id_usuario
GROUP BY us.servico, up.perfil

-- 4.3

-- Por essa pergunta eu acho q o lugar de data da amostra é msm em amostra, dai amostra deixa de ser um descritor de amostra. Se n fica muito idiota essa pergunta

SELECT p.nome, pea.data_coleta, e.nome
FROM rel_paciente_amostra_exame AS pae, exame AS e, paciente AS p
WHERE pae.id_exame = e.id AND pae.id_paciente = p.id

-- 4.4

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
