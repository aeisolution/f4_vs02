select tickets.ID AS ID,
	tickets.ClienteId AS ClienteId,
	tickets.Data AS Data,
	tickets.Oggetto AS Oggetto,
	tickets.Descrizione AS Descrizione,
	tickets.CategoriaId AS CategoriaId,
	tickets.StatoId AS StatoId,
	tickets.Owner AS Owner,
	categorie.Nome AS Categoria,
	stati.Nome AS Stato,
	CONCAT(clienti.Cognome, ' ', clienti.Nome) AS Cliente
from (((tickets 
	left join categorie on((tickets.CategoriaId = categorie.ID))) 
	left join stati on((tickets.StatoId = stati.ID))) 
	left join clienti on((tickets.ClienteId = clienti.ID)))