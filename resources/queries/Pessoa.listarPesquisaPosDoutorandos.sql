SELECT DISTINCT l.codpes, 
	l.nompes as nome_aluno, 
	p.codprj, 
	p.titprj, 
	p.dtainiprj, 
	p.dtafimprj,
	s.nomset as departamento,
	s.nomabvset as sigla_departamento
from fflch.dbo.LOCALIZAPESSOA l 
	INNER JOIN fflch.dbo.PDPROJETO p ON l.codpes = p.codpes_pd 
	inner join fflch.dbo.SETOR s on s.codset = p.codsetprj 
WHERE l.tipvin = 'ALUNOPD' 
	AND (p.staatlprj = 'Ativo' or p.staatlprj = 'Aprovado')
	AND l.sitatl = 'A' 
	AND p.codund = __unidades__
	AND p.codmdl = 2
	and (p.dtafimprj > GETDATE() or p.dtafimprj = null) 
ORDER BY l.nompes