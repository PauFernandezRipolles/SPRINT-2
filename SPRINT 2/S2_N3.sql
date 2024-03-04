/*Exercici 1
S'estan establint els objectius de l'empresa per al següent trimestre, 
per la qual cosa necessiten una base sòlida per a avaluar el rendiment i mesurar l'èxit 
en els diferents mercats. Per a això, necessiten el llistat dels països la mitjana de transaccions 
dels quals sigui superior a la mitjana general.*/
SELECT company.country, AVG(amount)
FROM company
JOIN transaction
ON transaction.company_id=company.id
GROUP BY country
HAVING AVG(transaction.amount) > (
	SELECT AVG(transaction.amount)
    FROM transaction
    )
ORDER BY 2 DESC;
# Aquest serien els països amb transactions per sobre de la mitjana comptant també els "declined"

/*Exercici 2
Necessitem optimitzar l'assignació dels recursos i dependrà de la capacitat operativa que es requereixi, 
per la qual cosa et demanen la informació sobre la quantitat de transaccions que realitzen les empreses, 
però el departament de recursos humans és exigent i vol un llistat de les empreses on especifiquis si 
tenen més de 4 transaccions o menys.*/
SELECT company_name, COUNT(transaction.id)
FROM transaction
JOIN company
ON transaction.company_id=company.id
GROUP BY company_name
HAVING COUNT(transaction.id) >= 4
ORDER BY 2 DESC;
# Els hi entregaria 2 llistats, un de les que tenen 4 o més transaccions...
SELECT company_name, COUNT(transaction.id)
FROM transaction
JOIN company
ON transaction.company_id=company.id
GROUP BY company_name
HAVING COUNT(transaction.id) < 4
ORDER BY 2 DESC;
#...i un altre amb les que tenen menys de 4




