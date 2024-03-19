/*Exercici 1
Mostra totes les transaccions realitzades per empreses d'Alemanya.*/
# AMB CORRECIONS: mes informació i sense el Join
SELECT *
FROM transaction, company
WHERE transaction.company_id=company.id AND
	country IN (
	SELECT country
	FROM company
	WHERE company.country = 'germany');   
/*Exercici 2
Màrqueting està preparant alguns informes de tancaments de gestió, 
et demanen que els passis un llistat de les empreses que han realitzat 
transaccions per una suma superior a la mitjana de totes les transaccions.*/
#CORRECCIÓ sense el Join
SELECT distinct(company_name) as 'Nom Empresa'
FROM company, transaction
WHERE company.id = transaction.company_id AND
	company_id IN (
	SELECT company_id
    FROM transaction
    WHERE amount > (
		SELECT AVG(amount)
        FROM transaction
		)
	);

/*Exercici 3
El departament de comptabilitat va perdre la informació de les transaccions 
realitzades per una empresa, però no recorden el seu nom, només recorden que 
el seu nom iniciava amb la lletra c. Com els pots ajudar? Comenta-ho acompanyant-ho 
de la informació de les transaccions.*/
# AMB CORRECCIÓ: Sense el Join i amb subquery
SELECT *
FROM transaction, company
WHERE transaction.company_id=company.id AND 
	company_name IN (
		SELECT company_name
        FROM company
        WHERE company_name LIKE 'c%'
        OR 'C%'
        )
ORDER BY date(timestamp);
# Els ajudaria adjuntant tota la informació que tenim de les transaccions i empreses
# que comencen per 'C', ordenades per data.

/*Exercici 4
Van eliminar del sistema les empreses que no tenen transaccions registrades, 
lliura el llistat d'aquestes empreses.*/
# AMB CORRECCIÓ: Mi idea inicial con Join pero debía ser Cross Join y no left
SELECT company_name as'Nom Empresa'
FROM company
CROSS JOIN transaction
ON transaction.company_id=company.id
WHERE transaction.id = null
OR transaction.id  = '';
# No n'hi ha cap que no tingui transaccions registrades
# AMB CORRECCIÓ 2: ERROR DE PLANTEJAMENT! Es demana quines empreses no tenen registres 
# a la taula transaction, sense fer JOIN i sense buscar null o buit a transaction.id
SELECT  DISTINCT company.id as'Empresa a Company', company_id as 'Empresa a Transaction'
FROM company, transaction
WHERE transaction.company_id=company.id;
#Surten les mateixes empreses a la taula Company que a la Transaction, les 100 empreses que hi ha tenen
# tenen alguna Transaction	


